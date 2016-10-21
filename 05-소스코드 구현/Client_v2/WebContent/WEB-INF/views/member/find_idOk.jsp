<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String mem_name = request.getParameter("mem_name");
	String mem_id = request.getParameter("mem_id");
%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/inc/topbar1.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h1 class="page-header">아이디찾기</h1>
				<p>
							회원조회 결과
				</p>
				<!-- 이메일 주소 입력 폼 시작 -->
				<p><h2><%=mem_name%>님</h2>이 가입하신 아이디는
				<h1><strong><%=mem_id%></strong></h1>입니다 
			</div>
		</div>
	</div>
	<div style="margin-top: 100px;">
	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
	</div>
</body>
</html>
