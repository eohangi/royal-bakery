package project.jsp.bakery.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.model.Member;
import project.jsp.bakery.service.MemberService;

public class MemberServiceImpl implements MemberService {
	/** 처리 결과를 기록할 로그 객체 생성 */
	Logger logger;
	/** 마이바티스 */
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
	public MemberServiceImpl(Logger logger, SqlSession sqlSession) {
		this.logger = logger;
		this.sqlSession = sqlSession;
	}

	// 아이디 중복검사
	@Override
	public Member selectUserIdCount(Member member) throws Exception {
		Member result = null;
		try {
			result = sqlSession.selectOne("MemberMapper.selectUserIdCount", member);
			/**
			 * 중복된 데이터가 존재한다면?
			 * 참이라면 result를 리턴,
			 * 아니라면 null을 리턴
			 * 이외의 경우 중복검사 실패.
			 * */
			if (result != null) {
					System.out.println("<<<<<<<<<<<<<<<<중복된 데이터가 존재할 경우 실행되는 if문 from IMPL>>>>>>>>>>>>>>>");
					return result;
			}
		}catch (Exception e) {
			e.printStackTrace();
			throw new Exception("아이디 중복검사 실패 from IMPL");
		}
		System.out.println("<<<<<<<<<<<<<<<<<<<<<<중복된 데이터가 없으면 실행될꺼야from IMPL>>>>>>>>>>>>>>>>>>>>");
		return null;
	}

	// 이메일 중복검사
	@Override
	public void selectEmailCount(Member member) throws Exception {
		try {
			int result = sqlSession.selectOne("MemberMapper.selectEmailCount", member);
			// 중복된 데이터가 존재한다면?
			if (result > 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("이미 사용중인 이메일");
		} catch (Exception e) {
			throw new Exception("이메일 중복검사 실패");
		}
	}

	// 회원가입
	@Override
	public void insertMember(Member member) throws Exception {
		selectEmailCount(member);

		// 데이터 저장처리 = 가입
		// not null로 설정된 값이 설정되지 않았다면 예외 발생됨.
		try {
			int result = sqlSession.insert("MemberMapper.insertMember", member);
			if (result == 0) {

				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 회원정보가 없다");
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
			throw new Exception("회원가입에 실패했다.");
		} finally {
			sqlSession.commit();
		}
	}

	// 로그인
	@Override
	public Member selectLogInfo(Member member) throws Exception {
		Member result = null;
		try {
			result = sqlSession.selectOne("MemberMapper.selectLoginInfo", member);

			// 조회된 데이터가 없다는 것 ㅡ where절 조건에 맞는 데이터가 없다.
			// ㅡ>where절은 아이디와 비밀번호가 일치하는 항목을 지정,
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

	// 비밀번호 변경의 구현체
	@Override
	public void updateMemberPasswordByEmail(Member member) throws Exception {
		try {
			int result = sqlSession.update("MemberMapper.updateMemberPasswordByEmail", member);
			// 수정된 행의 수가 없다는 것은 WHERE절의 조건이 맞지 않기 때문이다.
			// 즉,입력한 이메일과 일치하는 데이터가 없다는 의미.
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("가입된 이메일이 아닙니다.");
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			throw new Exception("알수없는 에러,고객센터로 문의 바랍니다");
		} finally {
			sqlSession.commit();
		}
	}

	// 비밀번호 검사
	@Override
	public void selectMemberPasswordCount(Member member) throws Exception {
		try {

			int result = sqlSession.selectOne("MemberMapper.selectMemberPasswordCount", member);
			// 회원번호와 비밀번호가 일치하는 데이터가 0 이라면, 비밀번호가 잘못된 상태

			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("잘못된 비밀번호 입니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("비밀번호 검사에 실패");
		}

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

	//이메일이랑 이름으로 아이디 찾기
	@Override
	public Member selectCountByNameEmail(Member member) throws Exception {
		Member loginInfo = null;
		try {
			loginInfo = sqlSession.selectOne("MemberMapper.selectCountByNameEmail", member);
			// 중복된 데이터가 없다면?
			if (loginInfo == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("해당정보로 가입된 회원이 없습니다.");
		} catch (Exception e) {
			throw new Exception("아이디 찾기 실패 고객센터로 문의 바랍니다.");
		}
		return loginInfo;
	}

	@Override
	public void updateMember(Member member) throws Exception {
		try {
			int result = sqlSession.update("MemberMapper.updateMember", member);
			// 삭제된 데이터가 없다는 것은 WHERE절의 조건값이 맞지 않다는 의미.
			// 이 경우, 첫 번째 WHERE조건에서 사용되는 ID값에 대한 회원을 찾을 수 없다는 의미.
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("해당 회원정보를 찾을 수 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
			throw new Exception("정보수정에 실패했습니다 관리자에게 문의바랍니다.");
		} finally {
			sqlSession.commit();
		}
		
	}

}
