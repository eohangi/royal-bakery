package project.jsp.bakery.controller.bbs;

/**
 * 모든 게시판에서 공통적으로 수행되어야 하는 처리 로직에 대한 기능 구현
 */
public class BBSCommon {
	// ----------- 싱글톤 객체 생성 시작 --------------
	private static BBSCommon current = null;
	
	public static BBSCommon getInstance() {
		if (current == null) {
			current = new BBSCommon();
		}
		return current;
	}
	
	public static void freeInstance() {
		current = null;
	}
	
	private BBSCommon() {
		super();
	}
	// ----------- 싱글톤 객체 생성 끝 ----------------
	
	/**
	 * 카테고리 값을 추출하여 허용된 게시판인지 판별한다.
	 * 허용된 게시판일 경우 게시판의 이름을 리턴. 그렇지 않을 경우 예외를 발생시킨다.
	 * @param category
	 * @return 게시판이름
	 * @throws Exception
	 */
	public String getBbsName(String category) throws Exception {
		// 리턴할 게시판 이름
		String bbsName = null;
		
		// 카테고리값이 존재할 경우 게시판 이름 판별
		if (category != null) {
			if (category.equals("notice")) {
				bbsName = "공지사항";
			} else if (category.equals("qna")) {
				bbsName = "질문/답변";
			}
		}
		
		// 생성된 게시판 이름이 없다면 예외를 발생시킨다.
		if (bbsName == null) {
			throw new Exception("존재하지 않는 게시판 입니다.");
		}
		
		return bbsName;
	}
}
