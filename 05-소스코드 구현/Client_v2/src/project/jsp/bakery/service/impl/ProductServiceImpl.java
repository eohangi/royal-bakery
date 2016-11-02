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

	/*한기 수량 업데이트*/
	@Override
	public void updateProductStock(Product product) throws Exception {
		// TODO Auto-generated method stub
		try {
			int result = sqlSession.update("ProductMapper.updateProductStock", product);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("변경된 값이 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("수량 변경에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	/*한기 수량 셀렉트*/
	@Override
	public Product selectProductOneName(Product product) throws Exception {
		// TODO Auto-generated method stub
		Product result = null;

		try {
			result = sqlSession.selectOne("ProductMapper.selectProductOneName", product);
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

}
