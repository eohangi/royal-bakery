package project.jsp.bakery.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.model.Comment;
import project.jsp.bakery.service.CommentService;

public class CommentServiceImpl implements CommentService {
	
	/** 객채 생성 */
	Logger logger;
	SqlSession sqlSession;
	public CommentServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	@Override
	public void insertComment(Comment comment) throws Exception {
		try {
			int result = sqlSession.insert("CommentMapper.insertComment", comment);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 덧글이 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			throw new Exception("덧글 등록에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		
	}

	@Override
	public Comment selectComment(Comment comment) throws Exception {
		Comment result = null;
		
		try {
			result = sqlSession.selectOne("CommentMapper.selectComment", comment);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("답변 조회에 실패했습니다.");
		}
		return result;
	}

		//코멘트 참조관계 해제
		@Override
		public void updateCommentMemberOut(Comment comment) throws Exception {
			try{
				//코멘트 기능은 관리자만 쓴다.관리자는 일반회원과 DB table을 공유한다.
				//그러므로 코멘트테이블은 member테이블의 id값을 참조받는다
				//그러므로 멤버 탈퇴를 위해서는 관리자만 쓰는 기능이라도 둘의 참조관계를 해제하는 작업이 필요하다.
				sqlSession.update("CommentMapper.updateCommentMemberOut", comment);
			} catch(Exception e) {
				sqlSession.rollback();
				logger.error(e.getLocalizedMessage());
				throw new Exception("참조관계 해제 실패 from comment impl");
			} finally{
				sqlSession.commit();
			}
		}

		@Override
		public void deleteComment(Comment commnet) throws Exception {
			
			try {
				int result = sqlSession.delete("CommentMapper.deleteComment", commnet);
				if (result == 0) {
					throw new NullPointerException();
				}
			} catch (NullPointerException e) {
				throw new Exception("존재하지 않는 답변 대한 요청입니다.");
			} catch (Exception e) {
				sqlSession.close();
				logger.error(e.getLocalizedMessage());
				throw new Exception("답변 삭제에 실패했습니다.");
			} finally {
				sqlSession.commit();
			}
			
		}

		@Override
		public void updateComment(Comment comment) throws Exception {
			try {
				int result = sqlSession.update("CommentMapper.updateComment", comment);
				if (result == 0) {
					throw new NullPointerException();
				}
			} catch (NullPointerException e) {
				sqlSession.rollback();
				throw new Exception("존재하지 않는 답변에 대한 요청입니다.");
			} catch (Exception e) {
				sqlSession.rollback();
				logger.error(e.getLocalizedMessage());
				throw new Exception("답변 수정에 실패했습니다.");
			} finally {
				sqlSession.commit();
			}
			
		}

}
