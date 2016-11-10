package project.jsp.bakery.test.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.core.Logger;


import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Member;
import project.jsp.bakery.service.AdminService;
import project.jsp.bakery.service.impl.AdminServiceImpl;


public class MyBatisConnectionTest {

	public static void main(String[] args) {
		// 데이터베이스 접속처리
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
		AdminService memberService = new AdminServiceImpl(null, sqlSession);
		
		Member member = new Member();
		
		member.setMem_id("test1");
		member.setMem_pw("123");
		Member loginInfo = null;
		
		try {
			loginInfo = memberService.selectLogInfo(member);
		} catch (Exception e) {
			sqlSession.close();
			e.printStackTrace();
		}
		
		
		
		// 데이터베이스 접속 해제
		sqlSession.close();
		
		/** 1차 작업 후 이 클래스에서 에러가 발생한 경우 다음을 확인 */
		// 1) log4j2.xml 파일에서 로그가 저장될 경로 설정이 정확한지 여부
		// 2) config.xml 파일에서 데이터베이스 접속 정보 설정 확인
		// 3) MyBatisConnectionFactory에서 config.xml의 경로 설정 확인
		
		/** Mapper 파일의 경로를 config.xml에 추가할 때 마다 이 클래스로 테스트 한다. */
		// 4) Mapper 추가후 에러가 발생할 경우 
		//	  - config.xml 파일에 명시한 경로를 확인
		//    - Mapper.xml의 파일이름 확인.
		//    - Mapper.xml에 추가한 resultMap의 type속성에 대한 Beans 경로 정상 여부.
	}

}
