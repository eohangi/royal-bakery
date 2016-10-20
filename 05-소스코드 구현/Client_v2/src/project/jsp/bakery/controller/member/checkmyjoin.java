package project.jsp.bakery.controller.member;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Member;
import project.jsp.bakery.service.MemberService;
import project.jsp.bakery.service.impl.MemberServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;

/**
 * Servlet implementation class Join

@WebServlet("/member/Check.do")
public class checkmyjoin extends BaseController {

	private static final long serialVersionUID = -1263778137693399846L;
	SqlSession sqlSession;
	MemberService memberService;
	UploadHelper upload;
	WebHelper web;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		upload = UploadHelper.getInstance();
		memberService = new MemberServiceImpl(logger, sqlSession);
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);

		Map<String, String> paraMap = upload.getParamMap();
		String userId = paraMap.get("user_id");
		String email = paraMap.get("email");

		Member member = new Member();
		member.setUser_id(userId);
		member.setEmail(email);

		try {
			memberService.selectUserIdCount(member);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, "이미 사용중인 아이디입니다.");
			return null;
		}

		try {
			memberService.selectEmailCount(member);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, "이미 사용중인 이메일입니다.");
			return null;
		}

		return null;
	}
 
}
 */
