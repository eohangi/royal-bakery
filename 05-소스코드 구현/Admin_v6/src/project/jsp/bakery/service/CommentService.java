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
	
	/**
	 * 답변을 삭제한다.
	 * @param document - 게시물 데이터
	 * @throws Exception
	 */
	public void deleteComment(Comment commnet) throws Exception;
	
	/**
	 * 답변을 수정한다.
	 * @param document - 게시물 데이터
	 * @throws Exception
	 */
	public void updateComment(Comment comment) throws Exception;
	
	/***
	 * 회원과 덧글간의 참조관계를 해제한다.
	 * @param comment - 게시물 데이터
	 * @throws Exception
	 */
	public void updateCommentMemberOut(Comment comment) throws Exception;
}
