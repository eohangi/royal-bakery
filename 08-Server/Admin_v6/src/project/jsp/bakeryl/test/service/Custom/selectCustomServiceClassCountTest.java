package project.jsp.bakeryl.test.service.Custom;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Custom;
import project.jsp.bakery.service.CustomService;
import project.jsp.bakery.service.impl.CustomServiceImpl;


public class selectCustomServiceClassCountTest {

	public static void main(String[] args) {

		/** (2) 데이터 조회 기능 호출하기 */
		Custom custom = new Custom();
		custom.setCuClassify("크림");

		/** (2) */
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

		Logger logger = LogManager.getFormatterLogger(selectCustomServiceClassCountTest.class.getName());

		CustomService customService = new CustomServiceImpl(sqlSession, logger);
		List<Custom> list = null;

		/** (3) */

		try {
			list = customService.selectCustomClassCount(custom);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			return;
		} finally {
			sqlSession.close();
		}

		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}

		// 글목록 조회와 비슷하다.

	}
}