//package project.jsp.bakery.controller.bbs;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import project.jsp.helper.BaseController;
//import project.jsp.helper.WebHelper;
//
//
//@WebServlet("/Inquire/Inquire.do")
//public class InquireWrite extends BaseController {
//	private static final long serialVersionUID = 2980862150462009454L;
//	
//	//** 1) 사용하고자 하는 헬퍼 객체 선언 *//*
//	WebHelper web;
//	BBSCommon bbs;
//	
//	@Override
//	public String doRun(HttpServletRequest request, HttpServletResponse response) 
//			throws ServletException, IOException {
//		
//		//** 2)사용하고자 하는 핼퍼 + 서비스 객체생성 *//*
//		web = WebHelper.getInstance(request, response);
//		bbs = BBSCommon.getInstance();
//		
////		//** 3) 게시판 카테고리값을 받아서 view에 전달 *//*
////		String category = web.getString("category");
////		request.setAttribute("category", category);
////		
////		//** 4) 존재하는 게시판인지 판별하기 *//*
////		try {
////			String bbsName = bbs.getBbsName(category);
////			request.setAttribute("bbsName", bbsName);
////		} catch (Exception e) {
////			web.redirect(null, e.getLocalizedMessage());
////			return null;
////		}
//		
//		return "/Inquire/Inquire";
//	}
//
//}
