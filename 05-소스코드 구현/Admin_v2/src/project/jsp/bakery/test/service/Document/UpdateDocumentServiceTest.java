package project.jsp.bakery.test.service.Document;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Document;
import project.jsp.bakery.service.DocumentService;
import project.jsp.bakery.service.impl.DocumentServiceImpl;

public class UpdateDocumentServiceTest {

	public static void main(String[] args) {
		
		Document document = new Document();
		document.setId(6);
		document.setCategory("질문답변");
		document.setWriterName("운영자");
		document.setSubject("테스트5");
		document.setContent("테스트5입니다.");
		document.setEditDate("2016-10-19");
		document.setIpAddr("192.168.0.1");
		
		/** 2) */
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
		Logger logger = LogManager.getFormatterLogger(UpdateDocumentServiceTest.class.getName());
		DocumentService documentService = new DocumentServiceImpl(sqlSession, logger);
		
		/** 3) */
		try {
			documentService.updateDocument(document);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
			return;
		} finally {
			sqlSession.close();
		}
		
		/** 4) */
		System.out.println("수정되었습니다.");
	}

}
