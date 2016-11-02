package project.jsp.bakery.test.mybatis.Custom;

import org.apache.ibatis.session.SqlSession;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Custom;

public class SelectCustomItemTest {

	public static void main(String[] args) {
		/** (1) 데이터베이스 접속처리 */
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

		/** (2) 데이터 조회 기능 호출하기 */
		Custom custom = new Custom();
		custom.setId(3);

		// 조회결과가 저장될 Beans 선언하기
		Custom item = null;

		try {
			item = sqlSession.selectOne("CustomMapper.selectCustomItem", custom);

		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
			// TODO: handle exception
			System.out.println("데이터 조회에 실패했습니다.");
			return;
		} finally {
			sqlSession.close();
		}
		/** (3) 조회 결과 출력하기 */
		System.out.println(item.toString());
	}

}
