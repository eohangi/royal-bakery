package project.jsp.bakery.test.mybatis.Document;

import org.apache.ibatis.session.SqlSession;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Document;



public class DeleteDocument {

	public static void main(String[] args) {
		
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

		Document document = new Document();
		document.setId(4);

		try {
			int result = sqlSession.delete("DocumentMapper.deleteDocumentItem", document);

			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback(); // SQL 수행내역을 되돌림
			System.out.println("삭제된 데이터가 없습니다.");
			return;
		} catch (Exception e) {
			sqlSession.rollback(); // SQL 수행내역을 되돌림
			System.out.println(e.getLocalizedMessage());
			System.out.println("데이터 삭제에 실패했습니다.");
			return;
		} finally {
			sqlSession.commit(); // 실제 반영을 위해서 commit
			sqlSession.close(); // 데이터베이스 접속 해제
		}

		/** 결과 출력하기 */
		System.out.println("삭제되었습니다.");
	}

}