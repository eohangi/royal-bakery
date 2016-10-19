package project.jsp.bakery.model;

public class Comment {
	private int id;
	private String coContent;
	private String regDate;
	private String editDate;
	private int memberId;
	private int documentId;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCoContent() {
		return coContent;
	}
	public void setCoContent(String coContent) {
		this.coContent = coContent;
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
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getDocumentId() {
		return documentId;
	}
	public void setDocumentId(int documentId) {
		this.documentId = documentId;
	}
	@Override
	public String toString() {
		return "Comment [id=" + id + ", coContent=" + coContent + ", regDate=" + regDate + ", editDate=" + editDate
				+ ", memberId=" + memberId + ", documentId=" + documentId + "]";
	}
	
}	
	