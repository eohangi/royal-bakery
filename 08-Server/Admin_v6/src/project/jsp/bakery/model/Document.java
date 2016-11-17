package project.jsp.bakery.model;

public class Document {
	private int id;
	private String writerName;
	private String writerPw;
	private String subject;
	private String content;
	private String regDate;
	private String editDate;
	private String ipAddr;
	private String category;
	private String checks;
	private int memberId;
	
	// 페이지 구현을 위해서 추가된 값
	private int limitStart;
	private int listCount;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public String getWriterPw() {
		return writerPw;
	}
	public void setWriterPw(String writerPw) {
		this.writerPw = writerPw;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getEditDate() {
		return editDate;
	}
	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}
	public String getIpAddr() {
		return ipAddr;
	}
	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getChecks() {
		return checks;
	}
	public void setChecks(String checks) {
		this.checks = checks;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
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
		return "Document [id=" + id + ", writerName=" + writerName + ", writerPw=" + writerPw + ", subject=" + subject
				+ ", content=" + content + ", regDate=" + regDate + ", editDate=" + editDate + ", ipAddr=" + ipAddr
				+ ", category=" + category + ", checks=" + checks + ", memberId=" + memberId + ", limitStart="
				+ limitStart + ", listCount=" + listCount + "]";
	}

	

	
}