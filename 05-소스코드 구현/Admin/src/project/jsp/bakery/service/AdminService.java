package project.jsp.bakery.service;

import java.util.List;

import project.jsp.bakery.model.Member;

//회원 관련 기능을 제공하기 위한 service 계층
public interface AdminService {

	/***
	 * 로그인
	 * @param member 아이디 비밀번호
	 * @return 회원정보
	 * @throws Exception
	 */
	public Member selectLogInfo(Member member) throws Exception;
	
	/***
	 * 회원탈퇴
	 * @param member 회원번호,비밀번호
	 * @throws Exception
	 */
	public void deleteMember(Member member) throws Exception;
	
	/***
	 * 관리자 첫 로그인 후 보여질 회원 목록조회
	 * @param member 
	 * @return
	 * @throws Exception
	 */
	public List<Member> selectAllMember() throws Exception;
	
}
	


