<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar2.jsp"%>

	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<h1 class="page-header">비밀번호 확인</h1>
			<p>탈퇴를 위해서는 비밀번호를 입력해 주세요.</p>

			<!-- 비밀번호 입력 폼 시작 -->
			<form name="myform" method="post" action="LoginPage.jsp">
				<div class="form-group">
					<input type="password" name="user_pw" class="form-control" />
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-danger btn-block">
						회원탈퇴</button>
				</div>
			</form>
			<!--// 비밀번호 입력 폼 끝 -->

		</div>
	</div>

	<div style="margin-top: 100px;">
		<%@ include file="/WEB-INF/inc/Footer.jsp"%>
	</div>
</body>

</html>