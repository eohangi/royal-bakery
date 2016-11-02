package project.jsp.bakery.text.service.Order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Document;
import project.jsp.bakery.service.DocumentService;
import project.jsp.bakery.service.impl.DocumentServiceImpl;

public class SelectDocumentListServiceTest {

	public static void main(String[] args) {
		
		/** (2) */
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

		Logger logger = LogManager.getFormatterLogger(SelectDocumentListServiceTest.class.getName());

		DocumentService documentService = new DocumentServiceImpl(sqlSession, logger);

		/** (3) */
		List<Document> list = null;
		try {
			list = documentService.selectDocumentList(null);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			return;
		} finally {
			sqlSession.close();
		}

		/** (4) */
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).toString());
		}

	}

}