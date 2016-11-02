package project.jsp.bakery.model;

public class Member {
	private int id;
	private String mem_name;
	private String mem_id;
	private String mem_pw;
	private String email;
	private String phone_no;
	private String birthdate;
	private String postcode;
	private String addr1;
	private String addr2;
	private String classify;
	private String gender;
	private String reg_date;
	private String edit_date;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone_no() {
		return phone_no;
	}
	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getEdit_date() {
		return edit_date;
	}
	public void setEdit_date(String edit_date) {
		this.edit_date = edit_date;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", mem_name=" + mem_name + ", mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", email="
				+ email + ", phone_no=" + phone_no + ", birthdate=" + birthdate + ", postcode=" + postcode + ", addr1="
				+ addr1 + ", addr2=" + addr2 + ", classify=" + classify + ", gender=" + gender + ", reg_date="
				+ reg_date + ", edit_date=" + edit_date + "]";
	}
	
	
	
}
