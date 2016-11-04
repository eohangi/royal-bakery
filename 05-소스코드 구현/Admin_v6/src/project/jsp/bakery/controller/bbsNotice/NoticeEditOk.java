package project.jsp.bakery.controller.bbsNotice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Document;
import project.jsp.bakery.model.Member;
import project.jsp.bakery.service.DocumentService;
import project.jsp.bakery.service.impl.DocumentServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.RegexHelper;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;

@WebServlet("/bbs/notice_edit_ok.do")
public class NoticeEditOk extends BaseController {
	private static final long serialVersionUID = 4200652972043447385L;

	/** 사용하고자 하는 핼퍼 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	UploadHelper upload;
	DocumentService documentService;
	RegexHelper regex;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		/** 사용하고자 하는 핼퍼+서비스 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		regex = RegexHelper.getInstance();
		documentService = new DocumentServiceImpl(sqlSession, logger);
		
	
		// 글 번호 가져오기 --> Map에서 가져오는 모든 값은 String 이므로 형변환이 필요
		int documentId = 0;
		try {
			documentId = Integer.parseInt(web.getString("document_id"));
		} catch (NumberFormatException e) {
			web.redirect(null, "글 번호가 올바르지 않습니다.");
			return null;
		}
		
		String writerName = web.getString("writer_name");
		String writerPw = web.getString("writer_pw");
		String subject = web.getString("subject");
		String content = web.getString("content");
		// 작성자 아이피 주소 가져오기
		String ipAddr = web.getClientIP();
		// 회원 일연번호 --> 비 로그인인 경우 0
		int memberId = 0;
		
			
		/** 로그인 한 경우 자신의 글이라면 입력하지 않은 정보를 세션 데이터로 대체한다. */
		// 소유권 검사정보
		boolean myDocument = false;
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			try {
				// 소유권 판정을 위하여 사용하는 임시 객체
				Document temp = new Document();
				temp.setId(documentId);
				temp.setMemberId(loginInfo.getId());
				temp.setCategory("notice");
				if (documentService.selectDocumentCountByMemberId(temp) > 0) {
					// 소유권을 의미하는 변수 변경
					myDocument = true;
					// 입력되지 않은 정보들을 갱신
					writerName = loginInfo.getMem_name();
					writerPw = loginInfo.getMem_pw();
					memberId = loginInfo.getId();
				}
			} catch (Exception e) {
				sqlSession.close();
				web.redirect(null, e.getLocalizedMessage());
				return null;
			}
		}
		
		// 전달된 파라미터는 로그로 확인한다.
		logger.debug("documentId=" + documentId);
		logger.debug("writer_name=" + writerName);
		logger.debug("writer_pw=" + writerPw);
		logger.debug("subject=" + subject);
		logger.debug("content=" + content);
		logger.debug("ipAddr=" + ipAddr);
		logger.debug("memberId=" + memberId);
		
		/** 입력받은 파라미터에 대한 유효성 검사 */
		// 이름 + 비밀번호
			if (!regex.isValue(writerName)) {
				sqlSession.close();
				web.redirect(null, "작성자 이름를 입력하세요.");
				return null;
			}
				if (!regex.isValue(writerPw)) {
				sqlSession.close();
				web.redirect(null, "비밀번호를 입력하세요.");
				return null;
			}
			
			// 제목 및 내용 검사
			if (!regex.isValue(subject)) {
				sqlSession.close();
				web.redirect(null, "글 제목을 입력하세요.");
				return null;
			}
				if (!regex.isValue(content)) {
				sqlSession.close();
				web.redirect(null, "내용을 입력하세요.");
				return null;
			}

		/** 입력받은 파라미터를 Beans로 묶기 */
		Document document = new Document();
		// UPDATE 문의 WHERE 절에 사용해야 하므로 글 번호 추가
		// --> 글 번호는 숫자로 변환해서 처리해야 한다.
		document.setCategory("notice");
		document.setId(documentId);
		document.setWriterName(writerName);
		document.setWriterPw(writerPw);
		document.setSubject(subject);
		document.setContent(content);
		document.setIpAddr(ipAddr);
		document.setMemberId(memberId);
		logger.debug(document.toString());
		
		/** 게시물 변경을 위한 서비스 기능을 호출 */
		try {
			// 자신의 글이 아니라면 비밀번호 검사를 먼저 수행한다.
			if (!myDocument) {
				documentService.selectDocumentCountByPw(document);
			}
			documentService.updateDocument(document);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** 모든 절차가 종료되었으므로 DB접속 해제후 페이지 이동 */
		sqlSession.close();
		
		/** 모든 절차가 종료되었으므로 DB접속 해제후 페이지 이동 */
		sqlSession.close();
		
		String url = "%s/bbs/notice_read.do?&document_id=%d";
		url = String.format(url, web.getRootPath(), documentId);
		web.redirect(url, null);
				
		return null;
	}
}
