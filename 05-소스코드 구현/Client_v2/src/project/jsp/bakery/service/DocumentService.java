package project.jsp.bakery.service;

import java.util.List;

import project.jsp.bakery.model.Comment;
import project.jsp.bakery.model.Document;
/**
 * 게시물 관련 기능을 제공하기 위한 Service 계층
 */

public interface DocumentService {

	/**
	 * 게시물을 저장한다
	 * @param document - 게시물 데이터
	 * @throws Exception
	 */
	public void insertDocument(Document document) throws Exception;
	
	/**
	 * 하나의 게시물을 읽어들인다.
	 * @param document - 게시물 데이터
	 * @throws Exception
	 */
	public Document selectDocument(Document document) throws Exception;
	
	/**
	 * 현재글을 기준으로 이전글을 읽어들인다.
	 * @param document - 현재글에 대한 게시물 번호가 저장된 Beans
	 * @return Document - 읽어들인 게시물 내용 (없을 경우 null)
	 * @throws Exception
	 */
	public Document selectPrevDocument(Document document) throws Exception;
	
	/**
	 * 현재글을 기준으로 다음글을 읽어들인다.
	 * @param document - 현재글에 대한 게시물 번호가 저장된 Beans
	 * @return Document - 읽어들인 게시물 내용 (없을 경우 null)
	 * @throws Exception
	 */
	public Document selectNextDocument(Document document) throws Exception;
	
	/**
	 * 게시글 목록 조회
	 * @param document - 게시물 데이터
	 * @throws Exception
	 */
	public List<Document> selectDocumentList(Document document) throws Exception; 
	
	/**
	 * 전체 게시물 수 조회
	 * @param document
	 * @return int
	 * throws Exception
	 */
	public int selectDocumentCount(Document document) throws Exception;
	
	/**
	 * 자신의 게시물인지 검사한다.
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectDocumentCountByMemberId(Document document) throws Exception; 
	
	/**
	 * 비밀번호를 검사한다
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectDocumentCountByPw(Document document) throws Exception;
	
	/**
	 * 게시물을 삭제한다.
	 * @param document - 게시물 데이터
	 * @throws Exception
	 */
	public void deleteDocument(Document document) throws Exception;
	
	/**
	 * 게시물을 수정한다.
	 * @param document - 게시물 데이터
	 * @throws Exception
	 */
	public void updateDocument(Document document) throws Exception;
	
	
	
	public List<Document> selectMyDocumentList(Document document) throws Exception; 
	
	public int selectMyDocumentCount(Document document) throws Exception;
	
	/***
	 * 회원과의 게시물의 참조관계를 해제한다.
	 * @param document - 게시물 데이터
	 * @throws Exception
	 */
	
	public void updateDocumentMemberOut(Document document) throws Exception;
	
	/***
	 * 회원과 덧글간의 참조관계를 해제한다.
	 * @param comment - 게시물 데이터
	 * @throws Exception
	 */
	public void updateCommentMemberOut(Comment comment) throws Exception;
}
