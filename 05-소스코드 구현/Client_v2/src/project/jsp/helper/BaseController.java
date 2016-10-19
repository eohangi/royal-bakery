package project.jsp.helper;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

// --> URL에 노출되는 @WebServlet은 자식 클래스에서 정의하도록 하고,
//     이 클래스는 추상클래스로 변경한다.
//@WebServlet("/BaseController")
public abstract class BaseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// Log4j 객체 생성
	// --> import org.apache.logging.log4j.Logger;
	public Logger logger = null;

    public BaseController() {
    	// 실행되는 주체를 확인하기 위해서 클래스 이름을 콘솔에 출력한다.
        String className = this.getClass().getName();
        //System.out.println(className);
        
        // import org.apache.logging.log4j.LogManager;
        logger = LogManager.getLogger(className);
    }

    /** Get 방식 요청이 들어오면 실행된다. */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// 공통 처리 메서드로 제어를 이동시킨다.
		this.pageInit(request, response);
	}

    /** Post 방식 요청이 들어오면 실행된다. */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// 공통 처리 메서드로 제어를 이동시킨다.
		this.pageInit(request, response);
	}
	
	/**
	 * Get, Post 방식에 상관 없이 공통 처리되는 메서드
	 * @param request	- JSP request 내장 객체
	 * @param response	- JSP response 내장 객체
	 */
	private void pageInit(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		// 페이지 형식 지정하기
        response.setContentType("text/html; charset=utf-8");
        // 파라미터 처리 형식 지정하기
        request.setCharacterEncoding("utf-8");
        
        // 현재 URL을 획득해서 로그에 출력한다.
        String url = request.getRequestURL().toString();
        if (request.getQueryString() != null) {
            url = url + "?" + request.getQueryString();
        }
        
        // GET방식인지, POST방식인지 조회한다.
        String methodName = request.getMethod();
    	logger.info("[" + methodName + "] " + url);

        // View의 이름을 얻기 위하여 doRun 메서드를 호출한다.
        String view = doRun(request, response);

        // 획득한 View가 존재한다면 화면 표시
        if (view != null) {
            // View를 생성한다.
            view = "/WEB-INF/views/" + view + ".jsp";
            logger.info("[View] " + view);
            RequestDispatcher dispatcher = request.getRequestDispatcher(view);
            dispatcher.forward(request, response);
        }
		
	}
	
	/**
	 * 웹 페이지 구성에 필요한 처리를 수행한 후, View의 이름을 리턴한다. 
	 * 이 메서드를 추상화 한다. 
	 * 이 클래스를 상속받는 자식 클래스는 반드시 이 메서드를 재정의 해야 한다.
	 */
	public abstract String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;
}
