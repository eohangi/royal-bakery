package project.jsp.bakery.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.model.Product;
import project.jsp.bakery.service.ProductService;

public class ProductServiceImpl implements ProductService {

	/** 처리 결과를 기록한 Log4J 객체 생성 */
	Logger logger;

	/** Mybatis */
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */

	public ProductServiceImpl(Logger logger, SqlSession sqlSession) {
		super();
		this.logger = logger;
		this.sqlSession = sqlSession;
	}

	@Override
	public Product selectProduct(Product product) throws Exception {
		Product result = null;

		try {
			result = sqlSession.selectOne("ProductMapper.selectProduct", product);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
			throw new Exception("조회된 제품이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("제품 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<Product> selectProductList(Product product) throws Exception {
		List<Product> result = null;
		
		try{
			result = sqlSession.selectList("ProductMapper.selectProductList",product);
			if(result == null){
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
			throw new Exception("조회된 제품목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("제품목록 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int selectProductCount(Product product) throws Exception {
		int result = 0;
		
		try {
			//게시물 수가 0건인 경우도 있으므로,
			//결과값이 0 인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("ProductMapper.selectProductCount", product);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("제품 수 조회에 실패했습니다.");
		}

		return result;
	}

	
	//이름으로 빵 조회한다
	@Override
	public Product SelectProductNyname(Product product) throws Exception {
		Product result = null;

		try {
			result = sqlSession.selectOne("ProductMapper.selectProductByname", product);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
			throw new Exception("조회된 제품이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("제품 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public void Update(Product product) throws Exception {
		try {
			int result = sqlSession.update("ProductMapper.updateProduct", product);
			// 삭제된 데이터가 없다는 것은 WHERE절의 조건값이 맞지 않다는 의미.
			// 이 경우, 첫 번째 WHERE조건에서 사용되는 ID값에 대한 회원을 찾을 수 없다는 의미.
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("해당 제품값을 찾지 못했습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
			throw new Exception("정보수정에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	
}
