package project.jsp.bakery.model;

public class cart {
	
	private String id;
	private String proName;
	private String proPrice;
	private String proCount;
	private String orderNo;
	private String opText;
	private String Cartcol;
	private String OrderId;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProPrice() {
		return proPrice;
	}
	public void setProPrice(String proPrice) {
		this.proPrice = proPrice;
	}
	public String getProCount() {
		return proCount;
	}
	public void setProCount(String proCount) {
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
	public String getOrderId() {
		return OrderId;
	}
	public void setOrderId(String orderId) {
		OrderId = orderId;
	}
	@Override
	public String toString() {
		return "cart [id=" + id + ", proName=" + proName + ", proPrice=" + proPrice + ", proCount=" + proCount
				+ ", orderNo=" + orderNo + ", opText=" + opText + ", Cartcol=" + Cartcol + ", OrderId=" + OrderId + "]";
	}

	
	

}
