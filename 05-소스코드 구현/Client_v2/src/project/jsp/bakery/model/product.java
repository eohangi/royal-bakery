package project.jsp.bakery.model;

public class Product {
	private int id;
	private String proClassify;
	private String proName;
	private int proPrice;
	private int stock;
	private String status;
	private String content;
	private int kcal;
	private int na;
	private int sugar;
	private int fat;
	private int protein;
	private String proImg;
	private String proEditDate;
	private String proRegDate;
	
	//getter , setter
	public int getId() {
		return id;
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
	public String getRegDate() {
		return proRegDate;
	}
	public void setRegDate(String proRegDate) {
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
