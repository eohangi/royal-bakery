package project.jsp.bakeryl.test.service.Custom;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Custom;
import project.jsp.bakery.service.CustomService;
import project.jsp.bakery.service.impl.CustomServiceImpl;

public class InsertCustomServiceItemTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Custom custom = new Custom();
		custom.setCuClassify("크림");
		custom.setCuName("모카크림");
		custom.setCuPrice(3000);
		// custom.setCuEditDate("2016-10-11");
		// custom.setCuRegDate("2016-10-11");
		/** (2) */
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

		Logger logger = LogManager.getFormatterLogger(InsertCustomServiceItemTest.class.getName());

		CustomService customService = new CustomServiceImpl(sqlSession, logger);

		/** (3) */
		try {
			customService.insertCustomItem(custom);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			return;
		} finally {
			sqlSession.close();
		}

		/** (4) */
		System.out.println(custom.getId() + "번 데이터 저장됨");

	}

}
