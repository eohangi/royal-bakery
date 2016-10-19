package project.jsp.bakery.service;

import java.util.List;

import project.jsp.bakery.model.Document;

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
	 * 게시글 목록 조회
	 * @param document - 게시물 데이터
	 * @throws Exception
	 */
	public List<Document> selectDocumentList(Document document) throws Exception; 
	
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
}
