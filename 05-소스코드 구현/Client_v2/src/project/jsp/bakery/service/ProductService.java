package project.jsp.bakery.service;

import java.util.List;

import project.jsp.bakery.model.Product;

public interface ProductService {
	/**
	 * 하나의 빵 정보를 읽어들다.
	 * @param document - 읽얻르일 게시물 일련번호가 저장된 Beans
	 * @return BbsDocument - 읽어 들일 게심루 일련번호가 저장된 Beans
	 * @throws Exception
	 */
	public Product selectProduct (Product product) throws Exception;
	
	/*한기 빵 갯수 셀렉트*/
	public Product selectProductOneName(Product product) throws Exception;
	
	/**
	 * 제품 목록 조회
	 * @param product - Classify 정보가 저장된 Beans
	 * @return  게시물 목록
	 * @throws Exception
	 */
	public List<Product> selectProductList(Product product) throws
	 Exception;
	
	/**
	 * 전체 제품 수 조회
	 * @param document
	 * @return
	 * @throws Exception
	 */
	public int selectProductCount(Product product) throws
	 Exception;
	
	/*한기 빵 갯수 업데이트*/
	public void updateProductStock(Product product) throws
	 Exception;
}
