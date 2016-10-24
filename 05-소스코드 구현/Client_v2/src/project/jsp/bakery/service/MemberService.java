package project.jsp.bakery.service;

import project.jsp.bakery.model.Member;

//회원 관련 기능을 제공하기 위한 service 계층
public interface MemberService {
	/***
	 * 아이디 중복검사
	 * @param member - 아이디
	 * @return 
	 * @throws Exception - 중복된 데이터인 경우 예외 발생함
	 */
	public Member selectUserIdCount(Member member) throws Exception;
	
	/***
	 * 이메일 중복검사
	 * @param memeber - 이메일
	 * @throws Exception - 중복된 데이터인 경우 예외 발생함.
	 */
	public void selectEmailCount(Member member) throws Exception;
	
	
	/***
	 * 회원가입(아이디,이메일,중복검사 후 가입처리)
	 * @param member - 일련번호,가입일시,변경일시를 제외한 모든 정보
	 * @throws Exception
	 */
	public void insertMember(Member member) throws Exception;
	
	/***
	 * 로그인
	 * @param member 아이디 비밀번호
	 * @return 회원정보
	 * @throws Exception
	 */
	public Member selectLogInfo(Member member) throws Exception;
	
	/***
	 * 비밀번호 변경
	 * @param member 이메일주소,비밀번호
	 * @throws Exception 
	 */
	public void updateMemberPasswordByEmail(Member member) throws Exception;
	
	/***
	 * 비밀번호 검사
	 * @param member 
	 * @throws Exception
	 */
	public void selectMemberPasswordCount(Member member) throws Exception;
	
	
	/***
	 * 회원탈퇴
	 * @param member 회원번호,비밀번호
	 * @throws Exception
	 */
	public void deleteMember(Member member) throws Exception;
	
	/***
	 * 아이디 찾기를 위한 이름,이메일 조회
	 * @param member - 회원아이디,회원 이메일
	 * @return 
	 * @throws Exception
	 * @return member - 이름,아이디,이메일
	 */
	public Member selectCountByNameEmail(Member member) throws Exception;
	
}
	


