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
			<h1 class="page-header">비밀번호 확인</h1>
			<p>탈퇴를 위해서는 비밀번호를 입력해 주세요</p>
			
			<!-- 비번입력 폼 시작 -->
			<form id="myform" method="post"
			action="${pageContext.request.contextPath}/member/OutOk.do">
			 	<div class="form-group">
			 		<input type="password" name="mem_pw" class="form-control" />
			 	</div>
			 	<div class="form-group">
			 		<button type="submit" class="btn btn-danger btn-block">회원탈퇴</button>
			 	</div>
			 </form>
			<!-- //비번입력 폼 끝 -->
		</div>
		
	</div>
</div>
	<div style="margin-top: 100px;">
	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
	</div>
</body>
</html>
