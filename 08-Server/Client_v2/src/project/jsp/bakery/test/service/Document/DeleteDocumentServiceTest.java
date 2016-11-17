package project.jsp.bakery.test.service.Document;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Document;
import project.jsp.bakery.service.DocumentService;
import project.jsp.bakery.service.impl.DocumentServiceImpl;

public class DeleteDocumentServiceTest {

	public static void main(String[] args) {

		Document document = new Document();
		document.setId(5);

		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

		Logger logger = LogManager.getFormatterLogger(DeleteDocumentServiceTest.class.getName());

		DocumentService documentService = new DocumentServiceImpl(sqlSession, logger);

		/** (3) */
		try {
			documentService.deleteDocument(document);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			return;
		} finally {
			sqlSession.close();
		}
		/** (4) */
		System.out.println("제거되었습니다.");

	}
}