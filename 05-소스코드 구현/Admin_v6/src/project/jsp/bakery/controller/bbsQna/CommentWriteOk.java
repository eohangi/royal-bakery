package project.jsp.bakery.controller.bbsQna;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Comment;
import project.jsp.bakery.model.Document;
import project.jsp.bakery.service.CommentService;
import project.jsp.bakery.service.impl.CommentServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.WebHelper;


@WebServlet("/bbs/comment_write_ok.do")
public class CommentWriteOk extends BaseController {
	private static final long serialVersionUID = -6514612938000369644L;
	
	//** 객체 선언 *//*
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	CommentService commentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//** 객체 생성 *//*
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		commentService = new CommentServiceImpl(sqlSession, logger);
		
		//** 파라미터 받기 *//*
		
		int documentId = 0;
		int memberId = web.getInt("Member_id");
		String content = web.getString("content");
		
		Document docInfo = (Document) web.getSession("docInfo");
			Document temp = new Document();
			temp.setId(documentId);
			
			documentId = docInfo.getId();
			
	
		// 파라미터 로그로 확인
		logger.debug("document_id=" + documentId);
		logger.debug("Member_id=" + memberId);
		logger.debug("co_content=" + content);
		
				
		//** 파라미터를 빈즈로 묶기*//*
		
		
		Comment comment = new Comment();
		comment.setDocumentId(documentId);
		comment.setCoContent(content);
		comment.setMemberId(1);
		
		/** 서비스를 통한 게시물 저장 */
		try {
			commentService.insertComment(comment);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** 저장후 읽기 페이지로 이동하기 */
		// 읽어들일 게시물을 식별하기 위한 게시물 일련번호 값을 전달해야 한다.
		String url = "%s/bbs/qna_read.do?document_id=%d";
		url = String.format(url, web.getRootPath(), comment.getId());
		web.redirect(url, null);
		return null;
	}


}
