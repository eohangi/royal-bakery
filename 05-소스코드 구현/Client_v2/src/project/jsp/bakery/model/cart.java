package project.jsp.bakery.model;

public class cart {

	private int id;
	private String proName;
	private int proPrice;
	private int proCount;
	private int orderNo;
	private String cuText;
	private int cuPrice;
	private int cuCount;
	private int OrderId;
	private String RegDate;
	private String EditDate;
	private int memberId;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCuCount() {
		return cuCount;
	}

	public void setCuCount(int cuCount) {
		this.cuCount = cuCount;
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


	public String getCuText() {
		return cuText;
	}

	public void setCuText(String cuText) {
		this.cuText = cuText;
	}

	public int getCuPrice() {
		return cuPrice;
	}

	public void setCuPrice(int cuPrice) {
		this.cuPrice = cuPrice;
	}

	public int getOrderId() {
		return OrderId;
	}

	public void setOrderId(int orderId) {
		OrderId = orderId;
	}

	public String getRegDate() {
		return RegDate;
	}

	public void setRegDate(String regDate) {
		RegDate = regDate;
	}

	public String getEditDate() {
		return EditDate;
	}

	public void setEditDate(String editDate) {
		EditDate = editDate;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	@Override
	public String toString() {
		return "cart [id=" + id + ", proName=" + proName + ", proPrice=" + proPrice + ", proCount=" + proCount
				+ ", orderNo=" + orderNo + ", cuText=" + cuText + ", cuPrice=" + cuPrice + ", cuCount=" + cuCount
				+ ", OrderId=" + OrderId + ", RegDate=" + RegDate + ", EditDate=" + EditDate + ", memberId=" + memberId
				+ "]";
	}

	

	

}
