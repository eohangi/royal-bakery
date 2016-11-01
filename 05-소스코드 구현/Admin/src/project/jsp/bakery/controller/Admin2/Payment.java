package project.jsp.bakery.controller.Admin2;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.jsp.helper.BaseController;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/Payment.do")
public class Payment extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5229680064969967494L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "2Admin_payment";
	}
	
}
