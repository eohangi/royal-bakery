package project.jsp.bakery.model;

public class Product { // <<-- 클래스명 소문자
	private int id;
	private String proClassify; // a: 빵, b: 케잌 c: 쿠키
	private String proName;
	private int proPrice;
	private int stock;
	private String status; // o: 있음 x: 품절
	private String content;
	private int kcal;
	private int na;
	private int sugar;
	private int fat;
	private int protein;
	private String proImg;
	private String proEditDate;
	private String proRegDate;

	// 페이지 구현을 위해서 추가된 값
	private int limitStart;
	private int listCount;

	// getter , setter

	public int getId() {
		return id;
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

	public void setId(int id) {
		this.id = id;
	}

	public String getProClassify() {
		return proClassify;
	}

	public void setProClassify(String proClassify) {
		this.proClassify = proClassify;
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

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getKcal() {
		return kcal;
	}

	public void setKcal(int kcal) {
		this.kcal = kcal;
	}

	public int getNa() {
		return na;
	}

	public void setNa(int na) {
		this.na = na;
	}

	public int getSugar() {
		return sugar;
	}

	public void setSugar(int sugar) {
		this.sugar = sugar;
	}

	public int getFat() {
		return fat;
	}

	public void setFat(int fat) {
		this.fat = fat;
	}

	public int getProtein() {
		return protein;
	}

	public void setProtein(int protein) {
		this.protein = protein;
	}

	public String getProImg() {
		return proImg;
	}

	public void setProImg(String proImg) {
		this.proImg = proImg;
	}

	public String getProEditDate() {
		return proEditDate;
	}

	public void setProEditDate(String proEditDate) {
		this.proEditDate = proEditDate;
	}

	public String getProRegDate() {
		return proRegDate;
	}

	public void setProRegDate(String proRegDate) {
		this.proRegDate = proRegDate;
	}

	@Override
	public String toString() {
		return "product [id=" + id + ", proClassify=" + proClassify + ", proName=" + proName + ", proPrice=" + proPrice
				+ ", stock=" + stock + ", status=" + status + ", content=" + content + ", kcal=" + kcal + ", na=" + na
				+ ", sugar=" + sugar + ", fat=" + fat + ", protein=" + protein + ", proImg=" + proImg + ", proEditDate="
				+ proEditDate + ", proRegDate=" + proRegDate + "]";
	}

}
