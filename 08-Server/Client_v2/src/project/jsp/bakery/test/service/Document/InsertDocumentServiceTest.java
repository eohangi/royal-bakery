package project.jsp.bakery.test.service.Document;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Document;
import project.jsp.bakery.service.DocumentService;
import project.jsp.bakery.service.impl.DocumentServiceImpl;

public class InsertDocumentServiceTest {

	public static void main(String[] args) {
		
		Document document = new Document();
		document.setCategory("공지사항");
		document.setWriterName("임한종");
		document.setSubject("테스트3");
		document.setContent("테스트3입니다.");
		document.setRegDate("2016-10-19");
		document.setEditDate("2016-10-19");
		document.setIpAddr("192.168.0.1");
		document.setMemberId(1);
		document.setWriterPw("1234");
		
		/** 2) */
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
		Logger logger = LogManager.getFormatterLogger(InsertDocumentServiceTest.class.getName());
		DocumentService documentService = new DocumentServiceImpl(sqlSession, logger);
		
		/** (3) */
		try {
			documentService.insertDocument(document);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			return;
		} finally {
			sqlSession.close();
		}

		/** (4) */
		System.out.println(document.getId() + "번 데이터 저장됨");

	}

}
