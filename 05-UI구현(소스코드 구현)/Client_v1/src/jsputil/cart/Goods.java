package jsputil.cart;

public class Goods {
	private String code;	// 상품코드
	private String name;	// 상품명
	private int price;		// 가격
	private int orderQnt;	//주문수량
	private int qnt ; // 재고 수명
	
	
	public Goods(){
		
	}
	public Goods( String code, String name, int price){
		this.code = code;
		this.name = name;
		this.price = price;
		
	}
	public void setCode(String code) {
		this.code = code;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setOrderQnt(int orderQnt) {
		this.orderQnt = orderQnt;
	}
	public void setQnt(int qnt) {
		this.qnt = qnt;
	}
	
	
	
	public String getCode() {
		return code;
	}
	public String getName() {
		return name;
	}
	public int getPrice() {
		return price;
	}
	public int getOrderQnt() {
		return orderQnt;
	}
	public int getQnt() {
		return qnt;
	}
		
}
