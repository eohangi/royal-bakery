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

@WebServlet("/bbs/notice_write_ok.do")
public class NoticeWriteOk extends BaseController {
	private static final long serialVersionUID = -3301561954298336038L;
	/** 1) 사용하고자 하는 핼퍼 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	UploadHelper upload;
	RegexHelper regex;
	DocumentService documentService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// ** 2 사용하고자 하는 핼퍼+서비스 객체 생성 *//*
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		regex = RegexHelper.getInstance();
		documentService = new DocumentServiceImpl(sqlSession, logger);

		String writerName = web.getString("writer_name");
		String writerPw = web.getString("writer_pw");
		String subject = web.getString("subject");
		String content = web.getString("content");
		
		// 작성자 아이피 주소 가져오기
		String ipAddr = web.getClientIP();
		int memberId =0 ;

		// 로그인 한 경우 입력하지 않은 이름, 비밀번호 세션정보로 대체
		Member loginInfo = (Member) web.getSession("loginInfo");

			writerName = loginInfo.getMem_name();
			writerPw = loginInfo.getMem_pw();
			memberId = loginInfo.getId();

		// 전달된 파라미터 로그로 확인
		logger.debug("writerName=" + writerName);
		logger.debug("writerPw=" + writerPw);
		logger.debug("memberId=" + memberId);
		logger.debug("subject=" + subject);
		logger.debug("content=" + content);
		logger.debug("ipAddr=" + ipAddr);
		

		/** (7) 입력 받은 파라미터에 대한 유효성 검사 */

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

		/** 입력받은 파라미터를 Bean로 묶기 */
		Document document = new Document();
		
		document.setWriterName(writerName);
		document.setWriterPw(writerPw);
		document.setCategory("notice");
		document.setSubject(subject);
		document.setContent(content);
		document.setIpAddr(ipAddr);
		document.setMemberId(memberId);
		logger.debug("document >> " + document.toString());

		/** 서비스를 통한 게시물 저장 */
		try {
			documentService.insertDocument(document);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}

		/** 저장후 읽기 페이지로 이동하기 */
		// 읽어들일 게시물을 식별하기 위한 게시물 일련번호 값을 전달해야 한다.
		String url = "%s/bbs/notice_read.do?document_id=%d";
		url = String.format(url, web.getRootPath(), document.getId());
		web.redirect(url, null);
		return null;

	}
}
