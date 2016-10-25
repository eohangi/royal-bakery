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
import project.jsp.bakery.service.DocumentService;
import project.jsp.bakery.service.MemberService;
import project.jsp.bakery.service.impl.DocumentServiceImpl;
import project.jsp.bakery.service.impl.MemberServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;

/**
 * Servlet implementation class OutOk
 */
@WebServlet("/member/OutOk.do")
public class OutOk extends BaseController {
	private static final long serialVersionUID = 3159170464176246064L;
	/**1)웹헬퍼 객체 선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	UploadHelper upload;
	MemberService memberService;
	DocumentService documentService;
	CommentService commentService;
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	/**2)객체 생성*/
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		memberService = new MemberServiceImpl(logger, sqlSession);
		documentService = new DocumentServiceImpl(sqlSession, logger);
		CommentService = new CommentServiceImpl(sqlSession, logger);
		
	/**3)로그인 여부*/
	//로그인 중이 아니라면 탈퇴할 수 없다.
		if(web.getSession("loginInfo") == null){
			web.redirect(web.getRootPath() + "/MainIndex.do", "로그인 후에 이용 가능합니다.");
			return null;
		}
	/**4)파라미터 받기*/
		String userPw = web.getString("mem_pw");
		logger.debug("mem_pw from OutOk.do = " + userPw);
		
		if(userPw == null) {
			sqlSession.close();
			web.redirect(null,"비밀번호를 입력하세요.");
			return null;
		}
	/**5)빈즈로 묶기*/
	//회원번호는 세션을 통해서 획득한 로그인 정보에서 취득
		Member loginInfo = (Member) web.getSession("loginInfo");
		Member member = new Member();
		member.setMem_id(loginInfo.getMem_id());
		member.setMem_pw(userPw);
	
	//게시판 참조 관계 해제
		Document document = new Document();
	//덧글 참조 관계 해제
		Comment comment = new Comment();
		comment.setMemberId(loginInfo.getId());
		
	/**6)서비스를 통한 탈퇴 시도*/
		try {
			//참조관계 해제
			documentService.updateDocumentMemberOut(document);
			commentService.updateCommentMemberOut(comment);
			//비밀번호 검사 ㅡ> 비밀번호가 잘못된 경우 예외 발생
			memberService.selectMemberPasswordCount(member);
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
		
		
		
	/**7)정상적으로 탈퇴된 경우 강제 로그아웃,페이지 이동*/
		web.removeAllSession();
		web.redirect(web.getRootPath() + "/MainIndex1.do","탈퇴되었습니다.");
		return null;
	}
	

}
