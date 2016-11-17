package project.jsp.bakery.controller.bbsNotice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.jsp.helper.BaseController;
import project.jsp.helper.WebHelper;

@WebServlet("/bbs/notice_write.do")
public class NoticeWrite extends BaseController {
	private static final long serialVersionUID = 8968363087252712454L;

	/** 1) 사용하고자 하는 핼퍼 객체 선언 */
	WebHelper web;
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			
		
		//** 2 사용하고자 하는 핼퍼+서비스 객체 생성 *//*
		
		web = WebHelper.getInstance(request, response);
		
		
	
		
		return "bbs/notice_write";	
		
	}
}
