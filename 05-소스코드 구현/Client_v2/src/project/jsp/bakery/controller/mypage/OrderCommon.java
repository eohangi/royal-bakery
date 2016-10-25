package project.jsp.bakery.controller.mypage;

public class OrderCommon {

	// 싱글톤 객체 생성을 위한 준비
	private static OrderCommon current = null;

	public static OrderCommon getInstance() {
		if (current == null) {
			current = new OrderCommon();

		}
		return current;
	}

	// 객체에 null을 대입하면 메모리에서 삭제된다.
	public static void freeInstance() {
		current = null;
	}

	// 기본 생성자를 private로 은닉하게 되면 new를 통한 객체 생성이 금지된다.
	private OrderCommon() {
		super();
	}
	
	public String getOrderName(String orderCategory) throws Exception{
		String orderName = null;
		
		if(orderCategory != null){
			if(orderCategory.equals("reservation")){
				orderName = "예약확인";
			}
			if(orderCategory.equals("pay")){
				orderName = "결제확인";
			}
			
		}
		if(orderName == null){
			throw new Exception("존재하지 않는 게시판 입니다.");
		}
		
		return orderName;
	}
}
