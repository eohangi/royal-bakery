package project.jsp.bakery.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.jsp.helper.BaseController;

/**
 * Servlet implementation class Join
 */
@WebServlet("/member/Join.do")
public class Join extends BaseController {

	private static final long serialVersionUID = -7996253087261581362L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		return "member/join";
	}
	
}
