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

}
