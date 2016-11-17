<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>

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
		<form name="form-group" class="form-horizontal" method="POST"
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
			<a type="button" href="http://dlagkswhd.cafe24.com/Client_v2/MainIndex.do">사이트로 돌아가기</a>
		</div>
		<br /> <br />

	</div>

</body>
</html>