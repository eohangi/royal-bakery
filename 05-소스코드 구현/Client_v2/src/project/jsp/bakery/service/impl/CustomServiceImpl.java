package project.jsp.bakery.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.model.Custom;
import project.jsp.bakery.service.CustomService;

public class CustomServiceImpl implements CustomService {

	/** 처리 결과를 기록할 Log4J 객체 생성 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
	public CustomServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override
	public int selectCustomIdCount(Custom custom) throws Exception {
		try {
			int result = sqlSession.selectOne("CustomMapper.selectCustomIdCount", custom);

			// 중복된 데이터가 존재한다면?
			if (result > 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("이미 사용중인 제품이름 입니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("아이디 중복검사에 실패했습니다.");
		}
		return 0;
	}

	@Override
	public Custom selectCustomItem(Custom custom) throws Exception {
		Custom result = null;

		try {
			result = sqlSession.selectOne("CustomMapper.selectCustomItem", custom);

			// 리턴값은 저장된 행의 수
			if (result == null) {
				// 저장된 행이 없다면 강제로 예외를 발생시킨다.
				// --> 이 예외를 처리 가능한 catch블록으로 제어가 이동한다.
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			// 에러가 발생했으므로 SQL 수행 내역을 되돌림
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {

			logger.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public void insertCustomItem(Custom custom) throws Exception {

		selectCustomIdCount(custom);

		// 데이터 저장처리 = 가입
		// not null로 설정된 값이 설정되지 않았다면 예외 발생됨.
		try {
			int result = sqlSession.insert("CustomMapper.insertCustomItem", custom);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 회원정보가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("아이템 추가가 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public void updateCustomItem(Custom custom) throws Exception {
		try {
			int result = sqlSession.update("CustomMapper.updateCustomItem", custom);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("변경된 회원정보가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원정보 수정에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public void deleteCustomItem(Custom custom) throws Exception {
		try {
			int result = sqlSession.delete("CustomMapper.deleteCustomItem", custom);
			// 삭제된 데이터가 없다는 것은 WHERE절의 조건값이 맞지 않다는 의미.
			// 이 경우, 첫 번째 WHERE조건에서 사용되는 id값에 대한 회원을 찾을 수 없다는 의미
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("이미 탈퇴된 회원 입니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원탈퇴에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public List<Custom> getCustomList(Custom custom) throws Exception {
		List<Custom> result = null;

		try {
			result = sqlSession.selectList("CustomMapper.getCustomList", custom);

			// 리턴값은 저장된 행의 수
			if (result == null) {
				// 저장된 행이 없다면 강제로 예외를 발생시킨다.
				// --> 이 예외를 처리 가능한 catch블록으로 제어가 이동한다.
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			// 에러가 발생했으므로 SQL 수행 내역을 되돌림
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {

			logger.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public List<Custom> selectCustomClassCount(Custom custom) throws Exception {
		List<Custom> result = null;

		try {
			result = sqlSession.selectList("CustomMapper.selectCustomClassCount", custom);

			// 리턴값은 저장된 행의 수
			if (result == null) {
				// 저장된 행이 없다면 강제로 예외를 발생시킨다.
				// --> 이 예외를 처리 가능한 catch블록으로 제어가 이동한다.
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			// 에러가 발생했으므로 SQL 수행 내역을 되돌림
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {

			logger.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

}
