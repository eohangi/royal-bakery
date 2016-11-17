package project.jsp.bakery.controller.mypage;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Custom;
import project.jsp.bakery.model.Member;
import project.jsp.bakery.model.Orders;
import project.jsp.bakery.model.Product;
import project.jsp.bakery.model.cart;
import project.jsp.bakery.service.CartService;
import project.jsp.bakery.service.OrderService;
import project.jsp.bakery.service.ProductService;
import project.jsp.bakery.service.impl.CartServiceImpl;
import project.jsp.bakery.service.impl.OrderServiceImpl;
import project.jsp.bakery.service.impl.ProductServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.PageHelper;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.Util;
import project.jsp.helper.WebHelper;


/**
 * Servlet implementation class OrderConfirmation
 */
@WebServlet("/mypage/OrderCompleteOk.do")
public class OrderCompleteOk extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7381080922281498701L;
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	
	OrderCommon order;
	CartService cartService;
	//OrderService orderService;

	PageHelper pageHelper;
	// --> import study.jsp.helper.Upload;
	UploadHelper upload;
	
	ProductService productService;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		// --> import study.jsp.mysite.service.impl.BbsDocumentServiceImpl;
		OrderService orderService = new OrderServiceImpl(sqlSession, logger);
		cartService = new CartServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		productService = new ProductServiceImpl(logger, sqlSession);
		order = OrderCommon.getInstance();

		upload = UploadHelper.getInstance();

	
		Member loginInfo = (Member) web.getSession("loginInfo");
		/** (4) UploadHelper에서 텍스트 형식의 값을 추출 */
	//	Map<String, String> paramMap = upload.getParamMap();
		String OrderName = web.getString("OrderName");
		String tel = web.getString("tel");
		String time = web.getString("time");
		int totalPrice = web.getInt("totalPrice");
		String paytype = web.getString("paytype");
		String ProName = web.getString("ProName");
		String cuText = web.getString("cuText");
		
		/** (5) 주문 번호와 바코드 생성하기. */
		String Barcode= Util.getInstance().getRandomOrder();
		
		int OrderNo = Integer.parseInt(Barcode);
	
		// 로그인 한 경우, 입력하지 않은 이름, 비밀번호, 이메일을 세션정보로 대체
		
		logger.debug("일반제품 =" + ProName);
		logger.debug("주문제품 =" + cuText);
		
		// 전달된 파라미터는 로그로 확인한다.
		logger.debug("OrderNo=" + OrderNo);
		logger.debug("totalPrice=" + totalPrice);
		logger.debug("MemberId=" + loginInfo.getId());
		logger.debug("Barcode=" + Barcode);
		logger.debug("OrderName=" + OrderName);
		logger.debug("paytype=" + paytype);
		logger.debug("time=" + time);
		logger.debug("tel=" + tel);
		
		if (time == null) {
			web.redirect(null, "수령 시간을 선택해주세요.");
			return null;
		}

		if (paytype == null) {
			web.redirect(null, "지불 방식을 선택해주세요.");
			return null;
		}
		
		cart cart = new cart();
		
		cart.setOrderNo(OrderNo);
		cart.setMemberId(loginInfo.getId());
		
		Product count = new Product();

		//order에 저장할 것들 beans로 묶기
		Orders order = new Orders();
		order.setOrderNo(OrderNo);
		order.setTotalSum(totalPrice);
		order.setMemberId(loginInfo.getId());
		order.setPickupTime(null);
		order.setBarcode(Barcode);
		order.setOrderCategory("reservation");
		order.setOrType(paytype);
		order.setOrName(OrderName);
		order.setOrTime(time);
		order.setOrTel(tel);
		
		order.setOrTime(time);
		
		List<cart> cartlist = null;
		List<cart> cartlist2 = null;
		Product item = null;
		String OrName =null;
		try {
			cartlist = cartService.selectCartProMemberId(cart);
			cartlist2 = cartService.selectCartCuMemberId(cart);
			int a = cartlist.size();
			int b = cartlist2.size();
			int c= a+b;
			System.out.println("일반 제품 select 품목 갯수 : "+a);
			System.out.println("주문 제품 select 품목 갯수 : "+b);
			System.out.println("총 select 품목 갯수 : "+c);
			if(a !=0){
				System.out.println("일반제품만 주문");
				OrName = cartlist.get(0).getProName()+"외"+c+"개";
				
			}else if(b !=0){
				System.out.println("제작제품만 주문");
				OrName = "제작제품 외 "+c+" 개";
				if(b==1){
					OrName = "제작제품 "+c+" 개";
				}
				
			}else if(a!=0&&b!=0){
				System.out.println("둘다 주문");
				OrName = cartlist.get(0).getProName()+" 외 "+c+" 개";
			}
			System.out.println("주문 취합된 이름 = "+OrName);
			order.setOrTitle(OrName);
			int[] arrStock = new int[a];
			String[] arrName = new String[a];
			for (int i = 0; i < cartlist.size(); i++) {
				count.setProName(cartlist.get(i).getProName());
				arrName[i] = cartlist.get(i).getProName();
				item = productService.selectProductOneName(count);
				int usestock = item.getStock();
				int buystock = cartlist.get(i).getProCount();
				int totalStock = usestock-buystock;
				
				if(totalStock <0){
					String url = "%s/product/productBread.do";
					url = String.format(url, web.getRootPath());
					web.redirect(url, arrName[i]+ "재고가 없습니다. 상품 구매 페이지로 이동합니다.");
					return null;
				}
				
				
				arrName[i] = cartlist.get(i).getProName();
				arrStock[i] = totalStock;
				//count.setStock(i);	
				//productService.updateProductStock(count);
				
				System.out.println("제품 1개 SELECT["+i+"]  =  "+item);
				System.out.println("제품 수량["+i+"]  = "+usestock);
				System.out.println("장바구니의 수량["+i+"]  = "+buystock);
				System.out.println("총 합산 수량["+i+"]  = "+totalStock);
			}
			System.out.println("이름들 출력 : " + Arrays.toString(arrName));
			System.out.println("수량들 출력 : " + Arrays.toString(arrStock));
			for (int i = 0; i < cartlist.size(); i++) {
				System.out.println("배열에 담긴 select 각각의 품목 갯수 : "+arrStock[i]);
				if(arrStock[i] == 0){
					count.setStatus("x");
				}else{
					count.setStatus("o");
				}
				System.out.println("제품 1개 status["+i+"]  = "+count.getStatus());
				count.setProName(arrName[i]);
				count.setStock(arrStock[i]);	
				productService.updateProductStock(count);
			}
			//order insert 하기
			if(ProName != null){
			cartService.updateCartItemOrder(cart);
			}
			if(cuText != null){
			cartService.updateCartItemOrder2(cart);
			}
			
			orderService.insertOrder(order);
		
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		/** (13) */
		sqlSession.close();

		

		/** (11) 저장 완료 후 읽기 페이지로 이동하기 */
		// 읽어들일 게시물을 식별하기 위한 게시물 일련번호값을 전달해야 한다.
		String url = "%s/mypage/OrderConfirmation.do?OrderCategory=%s&OrderNo=%d";
		url = String.format(url, web.getRootPath(), order.getOrderCategory(), order.getOrderNo());
		//페이지 이동시키는 부분
		web.redirect(url, null);
	//	return "mypage/OrderConfirmation";
	return null;
	}
	

}
