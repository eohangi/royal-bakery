<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar1.jsp"%>


	<div class="Idsearch clearfix">
		<div class="IdsearchText">
			<p1> <strong><아이디찾기에문제를겪고계신가요?></strong></p1>
			<br /> <br />
			<hr />
			<h1>[RoyalBakery]</h1>
			<h1>입력하신 정보가 일치하지 않습니다.</h1>
			<h1>고객센터 000-000-0000 으로</h1>
			<h1>직접 문의 주시기 바랍니다.</h1>
			<h1>불편을 끼쳐드려 죄송합니다.</h1>

			<hr />
			<br />

			<form action="LoginPage.jsp">
				<div class="button">
					<input type="submit" class="btn btn-warning" value="돌아가기" />
				</div>
			</form>
		</div>

	</div>

	<br />
	<br />
	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>
