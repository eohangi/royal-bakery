package project.jsp.helper;

public class PageHelper2 {
	
	/*get파라미터로 처리할 값*/
	private int page = 1;  //현재 페이지 번호
	
	/*db에서 조회한 결과값*/
	private int totalCount = 0;  //전체 글 개수 조회
	
	/*개발자가 정의해야 하는 값*/
	private int listCount = 10; //한 페이지에 보여질 글의 목록 수
	private int groupCount = 5; //한 그룹에 표시할 페이지 번호 개수
	
	/*연산처리가 필요한 값*/
	private int totalPage = 0;	//전체 페이지 수
	private int startPage =0;	//현재 그룹의 시작 페이지
	private int endPage =0;		//현재 그룹의 마지막 페이지
	private int prevPage =0;	//이전 그룹의 마지막 페이지
	private int nextPage =0;	//이전 그룹의 첫 페이지
	private int limitStart =0;	//mysql 의 limit 시작 위치
	
	// 싱글톤 객체 생성을 위한 준비
	private static PageHelper2 current = null;

	public static PageHelper2 getInstance() {
		if (current == null) {
			current = new PageHelper2();

		}
		
		return current;
	}

	// 객체에 null을 대입하면 메모리에서 삭제된다.
	public static void freeInstance() {
		current = null;
	}

	// 기본 생성자를 private로 은닉하게 되면 new를 통한 객체 생성이 금지된다.
	private PageHelper2() {
		super();
	}
	
	public void pageProcess(int page, int totalCount, int listCount, int groupCount){
		this.page = page;
		this.totalCount=totalCount;
		this.listCount=listCount;
		this.groupCount=groupCount;
		
		totalPage = ((totalCount-1)/listCount)+1;
		
		if(page<0){
			page=1;
		}
		if(page>totalPage){
			page = totalPage;
		}
		
		startPage = ((page-1)/groupCount)*groupCount+1;
		
		endPage=(((startPage-1)+groupCount)/groupCount)*groupCount;
		
		if(endPage>totalPage){
			endPage=totalPage;
		}
		if(startPage>groupCount){
			prevPage=startPage-1;
		}else{
			prevPage=0;
		}
		if(endPage<totalPage){
			nextPage=endPage+1;
		}else{
			nextPage=0;
		}
		
		limitStart = (page-1)*listCount;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getGroupCount() {
		return groupCount;
	}

	public void setGroupCount(int groupCount) {
		this.groupCount = groupCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getLimitStart() {
		return limitStart;
	}

	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}

	public static PageHelper2 getCurrent() {
		return current;
	}

	public static void setCurrent(PageHelper2 current) {
		PageHelper2.current = current;
	}

	@Override
	public String toString() {
		return "PageHelper [page=" + page + ", totalCount=" + totalCount + ", listCount=" + listCount + ", groupCount="
				+ groupCount + ", totalPage=" + totalPage + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", prevPage=" + prevPage + ", nextPage=" + nextPage + ", limitStart=" + limitStart + "]";
	}
	
	
	

	

}
