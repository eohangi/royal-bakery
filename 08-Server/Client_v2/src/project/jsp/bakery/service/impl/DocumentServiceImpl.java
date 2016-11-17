package project.jsp.bakery.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.model.Comment;
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

	@Override
	public Document selectPrevDocument(Document document) throws Exception {
		Document result = null;

		try {
			// 이전글이 없는 경우도 있으므로, 리턴값이 null인 경우 예외를 발생하지 않는다.
			result = sqlSession.selectOne("DocumentMapper.selectPrevDocument", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("이전글 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public Document selectNextDocument(Document document) throws Exception {

		Document result = null;
		try {
			// 다음글이 없는 경우도 있으므로, 리턴값이 null인 경우 예외를 발생하지 않는다.
			result = sqlSession.selectOne("DocumentMapper.selectNextDocument", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("다음글 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int selectDocumentCount(Document document) throws Exception {
		int result = 0;

		try {
			// 게시물 수가 0건인 경우도 있으므로,
			// 결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("DocumentMapper.selectDocumentCount", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int selectDocumentCountByMemberId(Document document) throws Exception {
		int result = 0;

		try {
			// 자신의 게시물이 아닌 경우도 있으므로,
			// 결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("DocumentMapper.selectDocumentCountByMemberId", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int selectDocumentCountByPw(Document document) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("DocumentMapper.selectDocumentCountByPw", document);
			// 비밀번호가 일치하는 데이터의 수가 0이라면 비밀번호가 잘못된 것으로 간주한다.
			if (result < 1) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("비밀번호를 확인하세요.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<Document> selectMyDocumentList(Document document) throws Exception {
		List<Document> result = null;

		try {
			result = sqlSession.selectList("DocumentMapper.selectMyDocumentList", document);
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
	public int selectMyDocumentCount(Document document) throws Exception {
		int result = 0;

		try {
			// 게시물 수가 0건인 경우도 있으므로,
			// 결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("DocumentMapper.selectMyDocumentCount", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}

		return result;
	}
	
	
	//문서 참조관계 해제
	@Override
	public void updateDocumentMemberOut(Document document) throws Exception {
		try{
			//게시글을 작성한 적이 없는 회원도 있을 수 있기 때문에,
			//NullPointException을 발생시키지 않는다.
		sqlSession.update("DocumentMapper.updateDocumentMemberOut", document);
		} catch(Exception e) {
			logger.error(e.getLocalizedMessage());
			e.printStackTrace();
			throw new Exception("참조관계 해제에 실패했습니다. from docu impl");
		}finally {
			sqlSession.commit();
		}
	}

	@Override
	public Document selectMyPrevDocument(Document document) throws Exception {
		Document result = null;

		try {
			// 이전글이 없는 경우도 있으므로, 리턴값이 null인 경우 예외를 발생하지 않는다.
			result = sqlSession.selectOne("DocumentMapper.selectMyPrevDocument", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("이전글 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public Document selectMyNextDocument(Document document) throws Exception {

		Document result = null;
		try {
			// 다음글이 없는 경우도 있으므로, 리턴값이 null인 경우 예외를 발생하지 않는다.
			result = sqlSession.selectOne("DocumentMapper.selectMyNextDocument", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("다음글 조회에 실패했습니다.");
		}

		return result;
	}

	
}
