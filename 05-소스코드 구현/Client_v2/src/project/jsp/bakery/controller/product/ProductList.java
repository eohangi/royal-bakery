package project.jsp.bakery.controller.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import project.jsp.helper.BaseController;

/**
 * Servlet implementation class ProductList
 */
@WebServlet("/product/productlist.do")
public class ProductList extends BaseController {
	
	/**1. 사용할 것들 선언*/
	
	SqlSession sqlSession;
	
	Logger logger;
	
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	

}
