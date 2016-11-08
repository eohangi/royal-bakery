package project.jsp.bakery.controller.bbsQna;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.jsp.helper.BaseController;
import project.jsp.helper.WebHelper;


@WebServlet("/bbs/comment_write.do")
public class CommentWrite extends BaseController {
	private static final long serialVersionUID = 33500846054563421L;

	
	WebHelper web;
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		web = WebHelper.getInstance(request, response);
		
		int documentId = web.getInt("Document_id");
		
		System.out.println(documentId);
		request.setAttribute("Document_id", documentId);

		
		return "bbs/comment_write";
		
	}

}
