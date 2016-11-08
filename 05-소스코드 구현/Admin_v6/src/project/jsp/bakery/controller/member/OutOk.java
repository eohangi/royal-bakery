package project.jsp.bakery.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Comment;
import project.jsp.bakery.model.Document;
import project.jsp.bakery.model.Member;
import project.jsp.bakery.service.AdminService;
import project.jsp.bakery.service.CommentService;
import project.jsp.bakery.service.DocumentService;
import project.jsp.bakery.service.impl.AdminServiceImpl;
import project.jsp.bakery.service.impl.CommentServiceImpl;
import project.jsp.bakery.service.impl.DocumentServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;

/**
 * Servlet implementation class OutOk
 */
@WebServlet("/OUTOK.do")
public class OutOk extends BaseController {
	private static final long serialVersionUID = 3159170464176246064L;
	/**1)웹헬퍼 객체 선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	UploadHelper upload;
	AdminService memberService;
	DocumentService documentService;
	CommentService commentService;
	/*CommentService commentService;*/
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	/**2)객체 생성*/
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		memberService = new AdminServiceImpl(logger, sqlSession);
		documentService = new DocumentServiceImpl(sqlSession, logger);
		commentService = new CommentServiceImpl(sqlSession, logger);
		
	/**4)파라미터 받기 */
		String mem_id = request.getParameter("mem_id");
		logger.debug("파라미터로 넘어온 값 >>>>>>>>>>>>>>>>>>>>>>" + mem_id);
		
		
	/**5)빈즈로 묶기*/
		Member member = new Member();
		member.setMem_id(mem_id);
	
	/**해당 아이디를 조회해서 참조키 값 받아오기*/
		try {
			member = memberService.HandleMember(member);
		} catch (Exception e1) {
			e1.printStackTrace();
			web.redirect(null, e1.getLocalizedMessage());
		}
		
	//게시판 참조 관계 해제를 위한 아이디값 받기
		Document document = new Document();
		document.setMemberId(member.getId());
	//덧글 참조 관계 해제를 위한 아이디값 받기 
		Comment comment = new Comment();
		comment.setMemberId(member.getId());
		
	/**6)서비스를 통한 탈퇴 시도*/
		try {
			//참조관계 해제
			documentService.updateDocumentMemberOut(document);
			commentService.updateCommentMemberOut(comment);
			/*commentService.updateCommentMemberOut(comment);*/
			//탈퇴처리
			memberService.deleteMember(member);
		} catch (Exception e) {
			e.printStackTrace();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		
		
		/**	우리는 안쓴다.
		//탈퇴되었다면 프로필 이미지를 삭제한다.
		upload.removeFile(loginInfo.getProfile_img());	*/
		
		
		
	/**7)정상적으로 탈퇴된 경우 페이지 이동*/
		web.redirect(web.getRootPath() + "/1Adminclientinfo.do","탈퇴되었습니다.");
		return null;
	}
	

}
