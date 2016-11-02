package project.jsp.bakery.test.mybatis.Document;

import org.apache.ibatis.session.SqlSession;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Document;



public class SelectDocumentItem {

	public static void main(String[] args) {
		
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

		Document document = new Document();
		document.setId(5);

		Document item = null;

		try {
			// professormapper.selectprofessorlist 기능을 호출한다.
			// 두번째 파라미터는 조회 조건시에 사용될 파라미터 --> Beans객체
			// 조회 결과가 단일행을 리턴하기 때문에 Beans 객체 형태로 리턴된다
			item = sqlSession.selectOne("DocumentMapper.selectDocument", document);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
			System.out.println("데이터 조회에 실패했습니다.");
			return;
		} finally {
			// 데이터 베이스 접속 해제하기
			// 트라이 캣치의 파이널리는 캣치에서 리턴문보다 우선 실행된다.
			sqlSession.close();
		}

		/** 조회 결과 출력하기 */
		System.out.println(item.toString());

	}

}
