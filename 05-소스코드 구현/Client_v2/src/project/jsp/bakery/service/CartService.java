package project.jsp.bakery.service;

import java.util.List;

import project.jsp.bakery.model.cart;

public interface CartService {

	/**
	 * 아이쳄 중복검사
	 * 
	 * @param custom
	 *            - 아이쳄
	 * @throws Exception
	 *             - 중복된 데이터인 경우 예외 발생함
	 */
	public int selectCartIdCount(cart cart) throws Exception;

	/**
	 * 주문 아이템 추가
	 * 
	 * @param custom
	 *            - 아이템번호를 제외한 모든 정보
	 * @throws Exception
	 */
	public void insertCartItem(cart cart) throws Exception;

	/**
	 * 일련번호에 의한 아이템정보 조회
	 * 
	 * @param custom
	 * @throws Exception
	 */
	public cart selectCartItem(cart cart) throws Exception;

	/**
	 * 아이템정보 수정
	 * 
	 * @param custom
	 * @throws Exception
	 */
	public void updateCartItem(cart cart) throws Exception;

	/**
	 * 삭제
	 * 
	 * @param custom
	 *            - 아이템 번호
	 * @throws Exception
	 */
	public void deleteCartItem(cart cart) throws Exception;

	public List<cart> selectCartList(cart cart) throws Exception;

	public List<cart> selectCartClassCount(cart cart) throws Exception;
	
	public List<cart> selectCartCountByMemberId(cart cart) throws Exception;
	
	public List<cart> selectCartProMemberId(cart cart) throws Exception;
	
	public List<cart> selectCartCuMemberId(cart cart) throws Exception;
}
