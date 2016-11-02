package project.jsp.bakeryl.test.service.Custom;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Custom;
import project.jsp.bakery.service.CustomService;
import project.jsp.bakery.service.impl.CustomServiceImpl;

public class SelectCustomServiceViewItemTest {

	public static void main(String[] args) {
		Custom custom = new Custom();
		custom.setId(2);

		/** (2) */
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

		Logger logger = LogManager.getFormatterLogger(SelectCustomServiceViewItemTest.class.getName());

		CustomService customService = new CustomServiceImpl(sqlSession, logger);

		/** (3) */
		Custom item = null;
		try {
			item = customService.selectCustomItem(custom);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			return;
		} finally {
			sqlSession.close();
		}

		/** (4) */
		System.out.println(item.toString());

	}

}