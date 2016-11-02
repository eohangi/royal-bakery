package project.jsp.bakery.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.model.Document;
import project.jsp.bakery.model.Orders;
import project.jsp.bakery.service.OrderService;

public class OrderServiceImpl implements OrderService{
	
	/** 처리 결과를 기록할 Log4J객체 생성 */
	/** MyBatis */
	SqlSession sqlSession;
	Logger logger;

	


	public OrderServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override
	public void insertOrder(Orders orders) throws Exception {
		// TODO Auto-generated method stub
		try {
			int result = sqlSession.insert("OrderMapper.insertOrder", orders);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 게시물이 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 정보 등록에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	
		
	}

	@Override
	public List<Orders> selectOrderList(Orders orders) throws Exception {
		List<Orders> result = null;

		try {
			result = sqlSession.selectList("OrderMapper.selectOrderList", orders);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("글 목록 조회에 실패했습니다.");
		}

		return result;
		
	}

	@Override
	public Orders selectOrder(Orders orders) throws Exception {
		Orders result = null;

		try {
			result = sqlSession.selectOne("OrderMapper.selectOrder", orders);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 게시물이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public void updateOrder(Orders orders) throws Exception {
		try {
			int result = sqlSession.update("OrderMapper.updateOrder", orders);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 게시물에 대한 요청입니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수정에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		
	}

	@Override
	public int selectOrderCount(Orders orders) throws Exception {
		// TODO Auto-generated method stub
		
		int result = 0;
		try {
			result = sqlSession.selectOne("OrderMapper.selectOrderCount",orders);
			
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}
		return result;
	}
	
	

}
