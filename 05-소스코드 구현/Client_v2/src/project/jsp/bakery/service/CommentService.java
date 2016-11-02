package project.jsp.bakery.service;

import project.jsp.bakery.model.Comment;

/**
 *  답변 관련 기능을 제공하기 위한 Service 계층
 */
public interface CommentService {
	/**
	 * 답변을 저장한다.
	 */
	public void insertComment(Comment comment) throws Exception; 
	
	/**
	 * 답변을 읽어들인다.
	 */
	public Comment selectComment(Comment comment) throws Exception;
}
