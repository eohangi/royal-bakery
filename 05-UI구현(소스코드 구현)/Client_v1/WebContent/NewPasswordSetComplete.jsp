<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="inc/Common.jsp"%>
</head>
<body>

	<%@ include file="inc/Header1.jsp"%>
	<div class="page-header"></div>
	<div class="Idsearch">
		<div class="IdsearchText">
			<p1> <strong><안녕하세요. 이한볅 님></strong></p1>
			<br /> <br />
			<hr />
			<h1>비밀번호 변경이 완료되었습니다.</h1>
			<h1>새로운 비밀번호로 로그인해주세요.</h1>
		</div>
		<hr />
		<br />

						
			
			<div class="button">
				<div class="col-md-8 clearfix">
					<input type="button" value="로그인 페이지로" class="btn btn-warning" onclick="location.href='LoginPage.jsp'"
						style="float: right;" />

				</div>
			</div>
		</div>
	</div>


	<script src="assets/js/jquery-1.10.2.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<%@ include file="inc/Footer.jsp"%>
</body>

</html>
