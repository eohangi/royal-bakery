package project.jsp.bakery.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.jsp.helper.BaseController;

/**
 * Servlet implementation class BrandStory
 */
@WebServlet("/story.do")
public class BrandStory extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3620795657672923316L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = null;
		
		view="company/Story";
		return view;
	}

}
