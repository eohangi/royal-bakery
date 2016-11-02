<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Form</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="assets/ico/favicon.ico" />
<link rel="apple-touch-icon-precomposed"
	href="assets/ico/apple-touch-icon-144-precomposed.png" />

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

<!-- Optional theme -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-

    theme.min.css" />

<script src="http://code.jquery.com/jquery.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css" />

<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css" href="assets/css/nanumfont.css" />

<!-- 반응형 웹을 지원하지 않을 경우 -->
<!-- <link rel="stylesheet" href="assets/css/non-responsive.css" /> -->

<!-- IE8 이하 버전 지원 -->
<!--[if lt IE 9]>
        <script type="text/javascript" src="assets/js/html5shiv.js"></script>
        <script type="text/javascript" src="assets/js/respond.min.js"></script>
        <![endif]-->

<!-- IE10 반응형 웹 버그 보완 -->
<!--[if gt IE 9]>
        <link rel="stylesheet" type="text/css" href="assets/css/ie10.css" />
        <script type="text/javascript" src="assets/js/ie10.js"></script>
        <![endif]-->

<style type="text/css">
.login {
	padding-top: 100px;
	margin-left: 300px;
	margin-right: 300px;
}

.button {
	float: left;
}

.join {
	float: right;
}

.form-control {
	width: 60%;
}
</style>
<%
	String gotomember = "http://localhost:8080/Client_v2/member/Index.do";
%>
</head>

<body>
	<div class="login">
		<form name="form-group" class="loginA" method="POST"
			action="${pageContext.request.contextPath}/ADMINLOGINOK.do">
			<fieldset>
				<legend>관리자 로그인 페이지</legend>

				<!-- 다음예제에서 반복됩니다. -->
				<div class="form-group">
					<label for="mem_id">아이디</label> <input type="text" name="mem_id"
						class="form-control" placeholder="아이디를 입력하세요." />
				</div>

				<div class="form-group">
					<label for="mem_pw">비밀번호</label> <input type="password"
						name="mem_pw" class="form-control" placeholder="비밀번호를 입력하세요." />
				</div>

				<div class="form-group">
					<input type="submit" class="btn btn-primary" value="로그인" />
				</div>
				<!--// 여기까지 입니다. -->
			</fieldset>
		</form>
		
		
		<div>
			<a type="button" href="<%=gotomember%>">사이트로 돌아가기</a>
		</div>
		<br /> <br />

	</div>

</body>
</html>