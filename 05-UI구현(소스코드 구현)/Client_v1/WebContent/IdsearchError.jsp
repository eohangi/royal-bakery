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
			<p1> <strong><아이디 찾기에 문제를겪고계신가요?></strong></p1>
			<br /> <br />
			<hr />
			<h1>[RoyalBakery]</h1>
			<h1>입력하신 정보가 일치하지 않습니다.</h1>
			<h1> 고객센터 000-000-0000 으로</h1>
			<h1>직접 문의 주시기 바랍니다.</h1>
			<h1>불편을 끼쳐드려 죄송합니다.</h1>
		</div>
		<hr />
		<br />

		<form action="LoginPage.jsp">
		<div class="button">
			<input type="submit" class="btn btn-warning" value="돌아가기" />
		</div>
		</form>
	</div>


	<%@ include file="inc/Footer.jsp"%>
</body>

</html>
