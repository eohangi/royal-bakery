package project.jsp.bakery.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.service.MemberService;
import project.jsp.bakery.service.impl.MemberServiceImpl;



import org.json.JSONObject;

import project.jsp.bakery.model.Member;
import project.jsp.helper.BaseController;

//아이디 중복 여부를 조회할 수 있는 백엔드 프로그램

@WebServlet("/member/IdUniqueCheck.do")
public class id_unique_check extends BaseController {

	private static final long serialVersionUID = -2470687284081810168L;
	Logger logger;
	SqlSession sqlSession;
	MemberService memberService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		memberService = new MemberServiceImpl(logger, sqlSession);
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		
		String userId = request.getParameter("mem_id");
		String result = "ok";
	
		logger.debug("로거.mem_name from IdUniqueCheck.do = " + userId);
		
		/**입력값을 자바 빈즈에 저장*/
		Member member = new Member();
		member.setMem_id(userId);
		logger.debug("name from FindIdOk" + userId);
		
	
		Member idList =null;;
		try {
			idList = memberService.selectUserIdCount(member);
			//셀렉트로 조회한 아이디
		} catch (Exception e) {
			sqlSession.close();
			e.printStackTrace();
		}		
		if(idList.equals(userId)){
			result = "no";
		}
		
		
		sqlSession.close();
		JSONObject json = new JSONObject();		//제이슨 객체 선언
		json.put("result",result);				//result를 제이슨객체에 담음
		response.getWriter().print(json);		//제이슨을 뿌려줌
		
		return null;
	}

}

