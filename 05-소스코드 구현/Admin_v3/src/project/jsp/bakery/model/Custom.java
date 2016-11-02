package project.jsp.bakery.model;

public class Custom {
	private int id;
	private String cuClassify;
	private String cuName;
	private int cuPrice;
	private String cuEditDate;
	private String cuRegDate;

	private int limitStart;
	private int listCount;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCuClassify() {
		return cuClassify;
	}

	public void setCuClassify(String cuClassify) {
		this.cuClassify = cuClassify;
	}

	public String getCuName() {
		return cuName;
	}

	public void setCuName(String cuName) {
		this.cuName = cuName;
	}

	public int getCuPrice() {
		return cuPrice;
	}
	public void setCuPrice(int cuPrice) {
		this.cuPrice = cuPrice;
	}

	public String getCuEditDate() {
		return cuEditDate;
	}

	public void setCuEditDate(String cuEditDate) {
		this.cuEditDate = cuEditDate;
	}

	public String getCuRegDate() {
		return cuRegDate;
	}

	public void setCuRegDate(String cuRegDate) {
		this.cuRegDate = cuRegDate;
	}

	public int getLimitStart() {
		return limitStart;
	}

	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	@Override
	public String toString() {
		return "Custom [id=" + id + ", cuClassify=" + cuClassify + ", cuName=" + cuName + ", cuPrice=" + cuPrice
				+ ", cuEditDate=" + cuEditDate + ", cuRegDate=" + cuRegDate + ", limitStart=" + limitStart
				+ ", listCount=" + listCount + "]";
	}

//	public void setCuClassify(List<String> contain) {
//		// TODO Auto-generated method stub
//		
//	}

}
