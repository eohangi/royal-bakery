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

	
@WebServlet("/bbs/comment_delete_ok.do")
public class CommentDeleteOk extends BaseController {
	private static final long serialVersionUID = -3677161495882035979L;
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	CommentService commentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** 핼퍼 서비스 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		commentService = new CommentServiceImpl(sqlSession, logger);
		
		/** 덧글 번호 받기 */
		int commentId = web.getInt("comment_id");
		
		if (commentId == 0) {
			sqlSession.close();
			web.redirect(null, "답변 번호가 없습니다.");
		}
		
		/** 파라미터 묶기 */
		Comment comment = new Comment();
		comment.setId(commentId);
		
		/** 데이터 삭제처리 */
		try {
			commentService.deleteComment(comment);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** 페이지 이동 */
		String url = "%s/bbs/qna_list.do";
		url = String.format(url, web.getRootPath());
		
		web.redirect(url, "삭제되었습니다.");
		
		return null;
	}
	

}
