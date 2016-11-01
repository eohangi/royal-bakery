package project.jsp.bakery.controller.Admin2;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.jsp.helper.BaseController;

/**
 * Servlet implementation class ReservationDetail
 */
@WebServlet("/ReservationDetail.do")
public class ReservationDetail extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6293315836986417676L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "2Admin_reservation_detail";
	}
	

}
