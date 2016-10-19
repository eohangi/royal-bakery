package project.jsp.bakery.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.model.Document;
import project.jsp.bakery.service.DocumentService;

public class DocumentServiceImpl implements DocumentService {

	/** 처리 결과를 기록할 Log4J객체 생성 */
	Logger logger;
	/** MyBatis */
	SqlSession sqlSession;
	/** 생성자를 통한 객체 생성 */
	public DocumentServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	
	@Override
	public void insertDocument(Document document) throws Exception {
		try {
			int result = sqlSession.insert("DocumentMapper.insertDocument", document);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 게시물이 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 정보 등록에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}		
	
	@Override
	public Document selectDocument(Document document) throws Exception {
		Document result = null;

		try {
			result = sqlSession.selectOne("DocumentMapper.selectDocument", document);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 게시물이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<Document> selectDocumentList(Document document) throws Exception {
		List<Document> result = null;

		try {
			result = sqlSession.selectList("DocumentMapper.selectDocumentList", document);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 글 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("글 목록 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public void deleteDocument(Document document) throws Exception {
		try {
			int result = sqlSession.delete("DocumentMapper.deleteDocument", document);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("존재하지 않는 게시물에 대한 요청입니다.");
		} catch (Exception e) {
			sqlSession.close();
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 삭제에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		
	}

	@Override
	public void updateDocument(Document document) throws Exception {
		try {
			int result = sqlSession.update("DocumentMapper.updateDocument", document);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 게시물에 대한 요청입니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수정에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		
	}

}
