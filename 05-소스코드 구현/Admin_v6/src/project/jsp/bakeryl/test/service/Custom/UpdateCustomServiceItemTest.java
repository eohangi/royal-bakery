package project.jsp.bakeryl.test.service.Custom;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Custom;
import project.jsp.bakery.service.CustomService;
import project.jsp.bakery.service.impl.CustomServiceImpl;

public class UpdateCustomServiceItemTest {

	public static void main(String[] args) {
		Custom custom = new Custom();
		custom.setId(30);
		custom.setCuName("asdasda");
		custom.setCuPrice(3000);


		/** (2) */
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

		Logger logger = LogManager.getFormatterLogger(UpdateCustomServiceItemTest.class.getName());

		CustomService customService = new CustomServiceImpl(sqlSession, logger);

		/** (3) */
		try {
			customService.updateCustomItem(custom);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			return;
		} finally {
			sqlSession.close();
		}

		/** (4) */
		System.out.println("수정되었습니다.");

	}

}
