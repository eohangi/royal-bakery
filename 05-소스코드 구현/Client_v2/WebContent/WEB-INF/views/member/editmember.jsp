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
				<h1 class="page-header"><font color="#f26b24">회원정보 수정</font></h1>
				<p>
					본인 확인을 위해 비밀번호를 다시한번 입력해 주세요.  
				</p>
				<!-- 비밀번호 입력 폼 시작 -->
				<form method="post" action="${pageContext.request.contextPath}
				/member/MemberEdit.do" class="myform">
				 <div class="form-group">
				 	<input type="text" name="mem_pw" class="form-control" />
				 </div>
				 <div class="form-group">
				 	<button type="submit" class="btn btn-primary btn-block" >
				 	 본인확인하기</button>
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
