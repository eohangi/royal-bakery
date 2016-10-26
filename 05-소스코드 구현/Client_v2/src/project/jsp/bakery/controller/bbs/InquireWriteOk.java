//package project.jsp.bakery.controller.bbs;
//
//import java.io.IOException;
//import java.util.Map;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.apache.ibatis.session.SqlSession;
//import org.apache.logging.log4j.LogManager;
//import org.apache.logging.log4j.Logger;
//
//import project.jsp.bakery.dao.MyBatisConnectionFactory;
//import project.jsp.bakery.model.Document;
//import project.jsp.bakery.model.Member;
//import project.jsp.bakery.service.DocumentService;
//import project.jsp.bakery.service.impl.DocumentServiceImpl;
//import project.jsp.helper.BaseController;
//import project.jsp.helper.RegexHelper;
//import project.jsp.helper.UploadHelper;
//import project.jsp.helper.WebHelper;
//
//@WebServlet("/bbs/DocumentWriteOk.do")
//public class InquireWriteOk extends BaseController {
//	private static final long serialVersionUID = -2645541442907902748L;
//	
//	/** (1) 사용하고자 하는 Helper 객체 선언 */
//	// --> import org.apache.logging.log4j.Logger;
//	Logger logger;
//	// --> import org.apache.ibatis.session.SqlSession;
//	SqlSession sqlSession;
//	// --> import study.jsp.helper.WebHelper;
//	WebHelper web;
//	BBSCommon bbs;
//	// --> import study.jsp.helper.UploadHelper;
//	UploadHelper upload;
//	// --> import study.jsp.helper.RegexHelper;
//	RegexHelper regex;
//	// --> import study.jsp.mysite.service.BbsDocumentService;
//	DocumentService documentService;
//	// --> import study.jsp.mysite.service.BbsFileService;
//	
//
//	@Override
//	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
//		// --> import org.apache.logging.log4j.LogManager;
//		logger = LogManager.getFormatterLogger(request.getRequestURI());
//		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
//		sqlSession = MyBatisConnectionFactory.getSqlSession();
//		web = WebHelper.getInstance(request, response);
//		bbs = BBSCommon.getInstance();
//		upload = UploadHelper.getInstance();
//		regex = RegexHelper.getInstance();
//		// --> import study.jsp.mysite.service.impl.BbsDocumentServiceImpl;
//		documentService = new DocumentServiceImpl(sqlSession, logger);
//		// --> import study.jsp.mysite.service.impl.BbsFileServiceImpl;
//		
//
////		/** (3) 파일이 포함된 POST 파라미터 받기 */
////		try {
////			upload.multipartRequest(request);
////		} catch (Exception e) {
////			sqlSession.close();
////			web.redirect(null, "multipart 데이터가 아닙니다.");
////			return null;
////		}
//
//		/** (4) UploadHelper에서 텍스트 형식의 값을 추출 */
//		Map<String, String> paramMap = upload.getParamMap();
//		//String category = paramMap.get("category");
//		String writerName = paramMap.get("writer_name");
//		String writerPw = paramMap.get("writer_pw");
//		String subject = paramMap.get("subject");
//		String content = paramMap.get("content");
//		// 작성자 아이피 주소 가져오기
//		String ipAddr = web.getClientIP();
//		// 회원 일련번호 --> 비 로그인인 경우 0
//		int memberId = 0;
//
//		// 로그인 한 경우, 입력하지 않은 이름, 비밀번호, 이메일을 세션정보로 대체
//	/*	Member loginInfo = (Member) web.getSession("loginInfo");
//		if (loginInfo != null) {
//			writerName = loginInfo.getMem_name();
//			writerPw = loginInfo.getMem_pw();
//			memberId = loginInfo.getId();
//		}*/
//
//		// 전달된 파라미터는 로그로 확인한다.
//	//	logger.debug("category=" + category);
//		logger.debug("writer_name=" + writerName);
//		logger.debug("writer_pw=" + writerPw);
//	
//		logger.debug("subject=" + subject);
//		logger.debug("content=" + content);
//		logger.debug("ipAddress=" + ipAddr);
//		logger.debug("memberId=" + memberId);
//
////		/** (5) 게시판 카테고리 값을 받아서 View에 전달 */
////		// 파일이 첨부된 경우 WebHelper를 사용할 수 없다.
////		// String category = web.getString("category");
////		request.setAttribute("category", category);
////
////		/** (6) 존재하는 게시판인지 판별하기 */
////		try {
////			String bbsName = bbs.getBbsName(category);
////			request.setAttribute("bbsName", bbsName);
////		} catch (Exception e) {
////			sqlSession.close();
////			web.redirect(null, e.getLocalizedMessage());
////			return null;
////		}
//
//		/** (7) 입력 받은 파라미터에 대한 유효성 검사 */
//		// 이름 + 비밀번호
//		if (!regex.isValue(writerName)) {
//			sqlSession.close();
//			web.redirect(null, "작성자 이름를 입력하세요.");
//			return null;
//		}
//
//		if (!regex.isValue(writerPw)) {
//			sqlSession.close();
//			web.redirect(null, "비밀번호를 입력하세요.");
//			return null;
//		}
//
//		
//		// 제목 및 내용 검사
//		if (!regex.isValue(subject)) {
//			sqlSession.close();
//			web.redirect(null, "글 제목을 입력하세요.");
//			return null;
//		}
//
//		if (!regex.isValue(content)) {
//			sqlSession.close();
//			web.redirect(null, "내용을 입력하세요.");
//			return null;
//		}
//
//		/** (8) 입력 받은 파라미터를 Beans로 묶기 */
//		Document document = new Document();
//	//	document.setCategory(category);
//		document.setWriterName(writerName);
//		document.setWriterPw(writerPw);
//		document.setSubject(subject);
//		document.setContent(content);
//		document.setIpAddr(ipAddr);
//		document.setMemberId(memberId);
//		logger.debug("document >> " + document.toString());
//
//		/** (9) Service를 통한 게시물 저장 */
//		try {
//			//for (int i=1; i<=100; i++) {
//				//document.setSubject(subject + "(" + i + ")");
//				documentService.insertDocument(document);
//			//}
//		} catch (Exception e) {
//			sqlSession.close();
//			web.redirect(null, e.getLocalizedMessage());
//			return null;
//		}
//
//				
//		/** (11) 저장 완료 후 읽기 페이지로 이동하기 */
////		// 읽어들일 게시물을 식별하기 위한 게시물 일련번호값을 전달해야 한다.
////		String url = "%s/bbs/document_read.do?category=%s&document_id=%d";
////		url = String.format(url, web.getRootPath(), document.getCategory(), document.getId());
////		web.redirect(url, null);
//		return null;
//	}
//
//}
