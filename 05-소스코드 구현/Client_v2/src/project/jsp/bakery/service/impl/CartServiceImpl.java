package project.jsp.bakery.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.model.cart;
import project.jsp.bakery.service.CartService;

public class CartServiceImpl implements CartService {

	/** 처리 결과를 기록할 Log4J 객체 생성 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
	public CartServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override
	public int selectCartIdCount(cart cart) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertCartItem(cart cart) throws Exception {

		// 데이터 저장처리 = 가입
		// not null로 설정된 값이 설정되지 않았다면 예외 발생됨.
		try {
			int result = sqlSession.insert("CartMapper.insertCartItem", cart);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 회원정보가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("아이템 추가가 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public cart selectCartItem(cart cart) throws Exception {
		cart result = null;

		try {
			result = sqlSession.selectOne("CartMapper.selectCartItem", cart);

			// 리턴값은 저장된 행의 수
			if (result == null) {
				// 저장된 행이 없다면 강제로 예외를 발생시킨다.
				// --> 이 예외를 처리 가능한 catch블록으로 제어가 이동한다.
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			// 에러가 발생했으므로 SQL 수행 내역을 되돌림
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {

			logger.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public void updateCartItem(cart cart) throws Exception {
		try {
			int result = sqlSession.update("CartMapper.updateCartItem", cart);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("변경된 장바구니가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("장바구니가 수정에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public void deleteCartItem(cart cart) throws Exception {
		try {
			int result = sqlSession.delete("CartMapper.deleteCartItem", cart);
			// 삭제된 데이터가 없다는 것은 WHERE절의 조건값이 맞지 않다는 의미.
			// 이 경우, 첫 번째 WHERE조건에서 사용되는 id값에 대한 회원을 찾을 수 없다는 의미
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("이미 삭제된 장바구니 입니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("장바구니 삭제에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public List<cart> selectCartList(cart cart) throws Exception {
		List<cart> result = null;

		try {
			result = sqlSession.selectList("CartMapper.selectCartList", cart);

			// 리턴값은 저장된 행의 수
			if (result == null) {
				// 저장된 행이 없다면 강제로 예외를 발생시킨다.
				// --> 이 예외를 처리 가능한 catch블록으로 제어가 이동한다.
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			// 에러가 발생했으므로 SQL 수행 내역을 되돌림
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {

			logger.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public List<cart> selectCartClassCount(cart cart) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<cart> selectCartCountByMemberId(cart cart) throws Exception {
		List<cart> result = null;

		try {
			result = sqlSession.selectList("CartMapper.selectCartCountByMemberId", cart);

			// 리턴값은 저장된 행의 수
			if (result == null) {
				// 저장된 행이 없다면 강제로 예외를 발생시킨다.
				// --> 이 예외를 처리 가능한 catch블록으로 제어가 이동한다.
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			// 에러가 발생했으므로 SQL 수행 내역을 되돌림
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {

			logger.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public List<cart> selectCartProMemberId(cart cart) throws Exception {
		List<cart> result = null;

		try {
			result = sqlSession.selectList("CartMapper.selectCartProCountId", cart);

			// 리턴값은 저장된 행의 수
			if (result == null) {
				// 저장된 행이 없다면 강제로 예외를 발생시킨다.
				// --> 이 예외를 처리 가능한 catch블록으로 제어가 이동한다.
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			// 에러가 발생했으므로 SQL 수행 내역을 되돌림
			
		} catch (Exception e) {

			logger.error(e.getLocalizedMessage());
			
		}
		return result;
	}

	@Override
	public List<cart> selectCartCuMemberId(cart cart) throws Exception {
		List<cart> result = null;

		try {
			result = sqlSession.selectList("CartMapper.selectCartCuCountId", cart);

			// 리턴값은 저장된 행의 수
			if (result == null) {
				// 저장된 행이 없다면 강제로 예외를 발생시킨다.
				// --> 이 예외를 처리 가능한 catch블록으로 제어가 이동한다.
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			// 에러가 발생했으므로 SQL 수행 내역을 되돌림
			
		} catch (Exception e) {

			logger.error(e.getLocalizedMessage());
			
		}
		return result;
	}
	
	@Override
	public int selectCartTotalPrice(cart cart) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = sqlSession.selectOne("CartMapper.selectCartTotalPrice",cart);
			
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}
		return result;

	}

	@Override
	public void updateCartItemOrder(cart cart) throws Exception {
		try {
			int result = sqlSession.update("CartMapper.updateCartItemOrder", cart);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("변경된 장바구니가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("장바구니가 수정에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		
	}

	@Override
	public void updateCartItemOrder2(cart cart) throws Exception {
		try {
			int result = sqlSession.update("CartMapper.updateCartItemOrder2", cart);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("변경된 장바구니가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("장바구니가 수정에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		
	}

	@Override
	public List<cart> selectCartOrder1(cart cart) throws Exception {
		List<cart> result = null;

		try {
			result = sqlSession.selectList("CartMapper.selectCartOrder1", cart);

			// 리턴값은 저장된 행의 수
			if (result == null) {
				// 저장된 행이 없다면 강제로 예외를 발생시킨다.
				// --> 이 예외를 처리 가능한 catch블록으로 제어가 이동한다.
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			// 에러가 발생했으므로 SQL 수행 내역을 되돌림
			
		} catch (Exception e) {

			logger.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	
	}

	@Override
	public List<cart> selectCartOrder2(cart cart) throws Exception {
		List<cart> result = null;

		try {
			result = sqlSession.selectList("CartMapper.selectCartOrder2", cart);

			// 리턴값은 저장된 행의 수
			if (result == null) {
				// 저장된 행이 없다면 강제로 예외를 발생시킨다.
				// --> 이 예외를 처리 가능한 catch블록으로 제어가 이동한다.
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			// 에러가 발생했으므로 SQL 수행 내역을 되돌림
			
		} catch (Exception e) {

			logger.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

}
