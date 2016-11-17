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
	public List<Member> selectAllMember(Member member) throws Exception;
	
	/**
	 *  총멤버인원 계산해서 페이지헬퍼구현하게
	 * @param member
	 * @return 
	 * @throws Exception
	 */
	public int CountMember (Member member) throws Exception;
	
	
	/***
	 * 그...멤버 한명 정보 조회랑 탈퇴기능하려고
	 * @param keyword - 뭐든 받는다 이름 혹은 아이디 전번 이메일 폰번호 같은거
	 * @return - 조회된 멤버 있으면 그멤버 모든정보 돌려드림 
	 * @throws Exception
	 */
	public Member HandleMember (Member member) throws Exception;
	
}
	


