package project.jsp.bakery.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.helper.BaseController;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;



@WebServlet("/download.do")
public class Download extends BaseController {
	private static final long serialVersionUID = 788977139083197914L;

	/** (1) 사용하고자 하는 Helper + Service 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.helper.UploadHelper;
	UploadHelper upload;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		
		/** (3) 파라미터 받기 */
		// 서버상에 저장되어 있는 파일경로 (필수)
		String filePath = web.getString("file");
		// 원본 파일이름 (미필수)
		String orginName = web.getString("orgin");

		/** (4) 다운로드 스트림 출력하기 */
		if (filePath != null) {
			try {
				logger.debug("Create Thumbnail Image --> " + filePath);
				upload.printFileStream(response, filePath, orginName);
			} catch (IOException e) {
				logger.debug(e.getLocalizedMessage());
			}
		}
		
		return null;
	}
}
