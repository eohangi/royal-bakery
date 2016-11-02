package project.jsp.bakery.test.mybatis.Document;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Document;


public class SelectDocumentList {

	public static void main(String[] args) {

		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

		List<Document> list = null;

		try {
			// professormapper.selectprofessorlist 기능을 호출한다
			// 두번째 파라미터는 조회 조건시 사용될 파라미터
			// 조회 결과가 다중행을 리턴하기 때문에 list 형태로 리턴된다.
			list = sqlSession.selectList("DocumentMapper.selectDocumentList", null);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
			System.out.println("데이터 조회에 실패했습니다.");
			return;
		} finally {
			// 데이터 베이스 접속 해제하기
			// 트라이 캣치의 파이널리는 캣치에서 리턴문보다 우선 실행된다.
			sqlSession.close();
		}

		/** 3) 조회 결과 출력하기 */
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
	}

}
