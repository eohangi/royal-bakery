package project.jsp.bakery.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.model.Member;
import project.jsp.bakery.service.AdminService;

public class AdminServiceImpl implements AdminService {
	/** 처리 결과를 기록할 로그 객체 생성 */
	Logger logger;
	/** 마이바티스 */
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
	public AdminServiceImpl(Logger logger, SqlSession sqlSession) {
		this.logger = logger;
		this.sqlSession = sqlSession;
	}

	// 로그인
	@Override
	public Member selectLogInfo(Member member) throws Exception {
		Member result = null;
		try {
			result = sqlSession.selectOne("MemberMapper.selectLoginInfo", member);
			
			// 조회된 데이터가 없다는 것 ㅡ where절 조건에 맞는 데이터가 없다.
			// ㅡ>where절은 classify의 값이 1인 회원중에서 아이디와 비밀번호가 일치하는 항목을 지정,
			// 조회된 데이터가 없다는 것은 아이디나 비밀번호가 잘못되었음을 의미한다.
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("아이디나 비밀번호가 잘못되었습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("로그인에 실패했습니다.");
		}
		return result;
	}

	// 회원탈퇴
	@Override
	public void deleteMember(Member member) throws Exception {
		try {
			int result = sqlSession.delete("MemberMapper.deleteMember", member);
			// 삭제된 데이터가 없다는 것은 WHERE절의 조건값이 맞지 않다는 의미.
			// 이 경우, 첫 번째 WHERE조건에서 사용되는 ID값에 대한 회원을 찾을 수 없다는 의미.
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("이미 탈퇴한 회원 입니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			throw new Exception("회원탈퇴에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}

	}

	@Override
	public Member selectAllMember(Member member) throws Exception {
		Member result = null;
		try {
			result = sqlSession.selectOne("MemberMapper.selectAllMember", member);
			
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("로그인에 실패했습니다.");
		}
		return result;
	}

}
