package project.jsp.bakery.test.mybatis.Document;

import org.apache.ibatis.session.SqlSession;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Document;

public class InsertDocument {

	public static void main(String[] args) {

		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

		Document document = new Document();
		document.setCategory("공지사항");
		document.setWriterName("홍길동");
		document.setSubject("테스트");
		document.setContent("테스트입니다.");
		document.setRegDate("2016-10-19");
		document.setEditDate("2016-10-19");
		document.setIpAddr("192.168.0.1");
		document.setMemberId(1);
		document.setWriterPw("1234");

		try {
			
			// 두번째 파라미터는 조회 조건시에 사용될 파라미터 --> Beans객체
			int result = sqlSession.insert("DocumentMapper.insertDocument", document);

			// 리턴값은 저장된 행의 수
			if (result == 0) {
				// 저장된 행이 없다면 강제로 예외를 발생시킨다.
				// --> 이 예외를 처리 가능한 catch 블록으로 제어가 이동된다.
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			// 에러가 발생했으므로 sQL 수행내역을 되돌림
			sqlSession.rollback();
			System.out.println("저장된 데이터가 없습니다.");
			return;
		} catch (Exception e) {
			// 에러가 발생했으므로 SQl 수행 내역을 되돌림
			sqlSession.rollback();
			System.out.println(e.getLocalizedMessage());
			System.out.println("데이터 저장에 실패했습니다.");
			return;
		} finally {
			// 입력, 수정, 삭제 처리의 경우 실제 반영을 위해서 commit 필요함
			sqlSession.commit();
			// 데이터베이스 접속 해제
			sqlSession.close();
		}
		/** 4) 저장된 데이터 출력하기 */
		// 저장된 데이터의 식별값(PK)은 파라미터로 전달된 BEANS에 보관된다.
		System.out.println("Primary Key=" + document.getId());
	}

}
