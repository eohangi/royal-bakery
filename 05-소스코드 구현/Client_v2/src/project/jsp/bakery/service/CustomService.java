package project.jsp.bakery.service;

import java.util.List;

import project.jsp.bakery.model.Custom;

public interface CustomService {

	/**
	 * 아이쳄 중복검사
	 * 
	 * @param custom
	 *            - 아이쳄
	 * @throws Exception
	 *             - 중복된 데이터인 경우 예외 발생함
	 */
	public int selectCustomIdCount(Custom custom) throws Exception;

	/**
	 * 주문 아이템 추가
	 * 
	 * @param custom
	 *            - 아이템번호를 제외한 모든 정보
	 * @throws Exception
	 */
	public void insertCustomItem(Custom custom) throws Exception;

	/**
	 * 일련번호에 의한 아이템정보 조회
	 * 
	 * @param custom
	 * @throws Exception
	 */
	public Custom selectCustomItem(Custom custom) throws Exception;

	/**
	 * 아이템정보 수정
	 * 
	 * @param custom
	 * @throws Exception
	 */
	public void updateCustomItem(Custom custom) throws Exception;

	/**
	 * 삭제
	 * 
	 * @param custom
	 *            - 아이템 번호
	 * @throws Exception
	 */
	public void deleteCustomItem(Custom custom) throws Exception;

	public List<Custom> getCustomList(Custom custom) throws Exception;

	public List<Custom> selectCustomClassCount(Custom custom) throws Exception;
}
