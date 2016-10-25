package project.jsp.bakery.controller.mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.jsp.helper.BaseController;

/**
 * Servlet implementation class OrderConfirmation
 */
@WebServlet("/mypage/OrderConfirmation.do")
public class OrderConfirmation extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7381080922281498701L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "mypage/OrderConfirmation";
	}
	

}
