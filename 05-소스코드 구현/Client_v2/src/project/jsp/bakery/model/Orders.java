package project.jsp.bakery.model;

public class Orders {
	
	private int id;
	private int orderNo;
	private int totalSum;
	private int memberId;
	private String orRegDate;
	private String pickupTime;
	private String barcode;
	private String orderCategory;
	private String orEditTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getTotalSum() {
		return totalSum;
	}
	public void setTotalSum(int totalSum) {
		this.totalSum = totalSum;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getOrRegDate() {
		return orRegDate;
	}
	public void setOrRegDate(String orRegDate) {
		this.orRegDate = orRegDate;
	}
	public String getPickupTime() {
		return pickupTime;
	}
	public void setPickupTime(String pickupTime) {
		this.pickupTime = pickupTime;
	}
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	public String getOrderCategory() {
		return orderCategory;
	}
	public void setOrderCategory(String orderCategory) {
		this.orderCategory = orderCategory;
	}
	public String getOrEditTime() {
		return orEditTime;
	}
	public void setOrEditTime(String orEditTime) {
		this.orEditTime = orEditTime;
	}
	@Override
	public String toString() {
		return "Orders [id=" + id + ", orderNo=" + orderNo + ", totalSum=" + totalSum + ", memberId=" + memberId
				+ ", orRegDate=" + orRegDate + ", pickupTime=" + pickupTime + ", barcode=" + barcode
				+ ", orderCategory=" + orderCategory + ", orEditTime=" + orEditTime + "]";
	}
	
	
	
	
	

}
