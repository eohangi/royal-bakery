package project.jsp.bakery.test.mybatis.Order;

import org.apache.ibatis.session.SqlSession;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Document;
import project.jsp.bakery.model.Orders;

public class UpdateDocument {

	public static void main(String[] args) {
		
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

		Orders order = new Orders();
		order.setId(7);
		order.setOrderCategory("pay");
		order.setId(7);

		
		
		
		try {
			int result = sqlSession.update("OrderMapper.updateOrder", order);
			
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback(); // SQL 수행내역을 되돌림
			System.out.println("수정된 데이터가 없습니다.");
			return;
		} catch (Exception e) {
			sqlSession.rollback(); // SQL 수행내역을 되돌림
			System.out.println(e.getLocalizedMessage());
			System.out.println("데이터 수정에 실패했습니다.");
			return;
		} finally {
			sqlSession.commit();	// 실제 반영을 위해서 commit
			sqlSession.close();	// 데이터베이스 접속 해제
		}
		/** 결과 출력 */
		System.out.println("수정되었습니다.");
	}

}
