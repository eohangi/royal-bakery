package project.jsp.bakery.model;

public class Comment {
	private int id;
	private String coContent;
	private String coRegDate;
	private String coEditDate;
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
	public String getCoRegDate() {
		return coRegDate;
	}
	public void setCoRegDate(String coRegDate) {
		this.coRegDate = coRegDate;
	}
	public String getCoEditDate() {
		return coEditDate;
	}
	public void setCoEditDate(String coEditDate) {
		this.coEditDate = coEditDate;
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
		return "Comment [id=" + id + ", coContent=" + coContent + ", coRegDate=" + coRegDate + ", coEditDate="
				+ coEditDate + ", memberId=" + memberId + ", documentId=" + documentId + "]";
	}
	
	
}	