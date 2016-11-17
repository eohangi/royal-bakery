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
import project.jsp.bakery.service.CommentService;
import project.jsp.bakery.service.impl.CommentServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.WebHelper;

@WebServlet("/bbs/comment_delete.do")
public class CommentDelete extends BaseController {
	private static final long serialVersionUID = -1887856620872249952L;

	/** 사용할 객체 선언 */
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	CommentService commentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		/** 사용하고자 하는 핼퍼 + 서비스 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		commentService = new CommentServiceImpl(sqlSession, logger);
		
		int commentId = web.getInt("comment_id");
		int documentId= web.getInt("document_id");
		
		if (commentId == 0) {
			sqlSession.close();
			web.redirect(null, "답변 번호가 없습니다.");
			return null;
		}
		
		Comment comment = new Comment();
		comment.setId(commentId);
		comment.setDocumentId(documentId);
		
		request.setAttribute("commentId", commentId);
		request.setAttribute("documentId", documentId);
		
		
		return "bbs/comment_delete";
	}
       
   

}
