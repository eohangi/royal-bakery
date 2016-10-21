package project.jsp.bakery.test.mybatis.cart;

import org.apache.ibatis.session.SqlSession;

import project.jsp.bakery.dao.MyBatisConnectionFactory;

import project.jsp.bakery.model.cart;

public class SelectCartItemTest {

	public static void main(String[] args) {
		/** (1) 데이터베이스 접속처리 */
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

		/** (2) 데이터 조회 기능 호출하기 */
		cart cart = new cart();
		cart.setId(7);

		// 조회결과가 저장될 Beans 선언하기
		cart item = null;

		try {
			item = sqlSession.selectOne("CartMapper.selectCartItem", cart);

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
