package project.jsp.bakery.test.mybatis.Product;

import org.apache.ibatis.session.SqlSession;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Document;
import project.jsp.bakery.model.pro;

public class UpdateProductItemTest {

	public static void main(String[] args) {

		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

		pro product = new pro();
		product.setId(11);
		product.setProClassify('a');	// a: 빵, b: 케잌 c: 쿠키
		product.setProName("카페모카 롤브레드");	//품명
		product.setProPrice(6800);				//가격
		product.setProImg("/Client_v2/WebContent/assets/img/braad/b011.jpg");
		product.setStatus('o');	// o: 있음	x: 품절
		product.setContent("국내에서 직접 로스팅한 그랑드카페 원두를 곱게 갈아 넣은 향긋한 커피 내음 가득한 롤브레드");
		product.setStock(19);	//재고		
		product.setKcal(305);	//칼로리		
		product.setSugar(15);	//당
		product.setProtein(8);	//단백질
		product.setFat(3);		//지방		
		product.setNa(330);		//나트륨

		try {
			int result = sqlSession.update("ProductMapper.updateProduct", product);

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
			sqlSession.commit(); // 실제 반영을 위해서 commit
			sqlSession.close(); // 데이터베이스 접속 해제
		}
		/** 결과 출력 */
		System.out.println("수정되었습니다.");

	}

}
