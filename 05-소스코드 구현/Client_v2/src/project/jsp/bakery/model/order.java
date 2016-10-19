package project.jsp.bakery.model;

public class order {
	
	private String id;
	private String orderNo;
	private String totalSum;
	private String memberId;
	private String orRegDate;
	private String pickupTime;
	private String barcode;
	private String orderCategory;
	private String orEditTime;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getTotalSum() {
		return totalSum;
	}
	public void setTotalSum(String totalSum) {
		this.totalSum = totalSum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
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
	public String getOrDditTime() {
		return orDditTime;
	}
	public void setOrDditTime(String orDditTime) {
		this.orDditTime = orDditTime;
	}
	@Override
	public String toString() {
		return "order [id=" + id + ", orderNo=" + orderNo + ", totalSum=" + totalSum + ", memberId=" + memberId
				+ ", orRegDate=" + orRegDate + ", pickupTime=" + pickupTime + ", barcode=" + barcode
				+ ", orderCategory=" + orderCategory + ", orDditTime=" + orDditTime + "]";
	}
	
	
	
	

}
