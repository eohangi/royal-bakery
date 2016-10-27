<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h1 class="page-header">비밀번호 재설정</h1>
				<p>
					가입시 입력한 이메일 주소를 입력하세요.
					임시 비밀번호를 이메일로 보내드립니다.
				</p>
				<!-- 이메일 주소 입력 폼 시작 -->
				<form method="post" action="${pageContext.request.contextPath}
				/member/FindPwOk.do" class="myform">
				 <div class="form-group">
				 	<input type="text" name="email" class="form-control" />
				 </div>
				 <div class="form-group">
				 	<button type="submit" class="btn btn-primary btn-block" >
				 	 비밀번호 재설정하기</button>
				 </div>
				 </form>
				 <!-- 폼 끝 -->
			</div>
		</div>
	</div>
	<div style="margin-top: 100px;">
	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
	</div>
</body>
</html>
