package project.jsp.bakery.test.mybatis.Product;

import org.apache.ibatis.session.SqlSession;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Product0;

public class InsertProductItemTest {
	public static void main(String[] args) {
		
		/** (1) 데이터베이스 접속처리 */
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
		/** (2) 데이터베이스에 저장할 product의 정보를 저장하고 있는 javabeans 객체 */
		Product0 product = new Product0();
		product.setProClassify('c');	// a: 빵, b: 케잌 c: 쿠키
		product.setProName("더블초코칩쿠키");	//품명
		product.setProPrice(3800);				//가격
		product.setProImg("/Client_v2/WebContent/assets/img/cokie/c009.jpg");
		product.setStatus('o');	// o: 있음	x: 품절
		product.setContent("더블초코칩 뚜레쥬르 쿠키");
		product.setStock(13);	//재고		
		product.setKcal(165);	//칼로리		
		product.setSugar(11);	//당
		product.setProtein(1);	//단백질
		product.setFat(4);		//지방		
		product.setNa(105);		//나트륨

		/** (3) */
		/** 데이터 저장 기능 호출하기 + 트렌젝션 */
		try {
			int result = sqlSession.insert("ProductMapper.insertProduct", product);

			// 리턴값은 저장된 행의 수
			if (result == 0) {
				// 저장된 행이 없다면 강제로 예외를 발생시킨다.
				// --> 이 예외를 처리 가능한 catch블록으로 제어가 이동한다.
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			// 에러가 발생했으므로 SQL 수행 내역을 되돌림
			sqlSession.rollback();
			System.out.println("저장된 데이터가 없습니다.");
			return;
		} catch (Exception e) {
			// 에러가 발생했으므로 SQL 수행 내역을 되돌림
			sqlSession.rollback();
			System.out.println(e.getLocalizedMessage());
			System.out.println("데이터 저장에 실패했습니다.");
			return;
		} finally {
			// 입력,수정,삭제 처리의 경우 실제 반영을 위해서 commit 필요함
			sqlSession.commit();
			// 데이터베이스 접속 해제
			sqlSession.close();
		}

		/** (4) 저장된 데이터 출력하기 */
		// 저장된 데이터의 식별값 (pk)은 파라미터로 전달된 beans에 보관된다.
		System.out.println("Primay Key=" + product.getId());
	}
}
