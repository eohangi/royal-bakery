package project.jsp.bakery.model;

public class cart {
	
	private int id;
	private String proName;
	private int proPrice;
	private int proCount;
	private String orderNo;
	private String opText;
	private String Cartcol;
	private int OrderId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public int getProPrice() {
		return proPrice;
	}
	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}
	public int getProCount() {
		return proCount;
	}
	public void setProCount(int proCount) {
		this.proCount = proCount;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getOpText() {
		return opText;
	}
	public void setOpText(String opText) {
		this.opText = opText;
	}
	public String getCartcol() {
		return Cartcol;
	}
	public void setCartcol(String cartcol) {
		Cartcol = cartcol;
	}
	public int getOrderId() {
		return OrderId;
	}
	public void setOrderId(int orderId) {
		OrderId = orderId;
	}
	@Override
	public String toString() {
		return "cart [id=" + id + ", proName=" + proName + ", proPrice=" + proPrice + ", proCount=" + proCount
				+ ", orderNo=" + orderNo + ", opText=" + opText + ", Cartcol=" + Cartcol + ", OrderId=" + OrderId + "]";
	}
	
	
	

}
