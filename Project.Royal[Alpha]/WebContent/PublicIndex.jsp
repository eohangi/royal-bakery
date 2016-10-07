<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="inc/IndexCommon.jsp"%>
<style type="text/css">
.container {
	margin-top: 150px;
	background: blue;
	height: 700px;
}

#slide1 {
background: #f0f

}

#slide1 h1 {
min-height: 700px;
text-indent: -10000px;
}

#slide2 {
background: #f60
}

#slide2 h3 {
min-height: 700px;
text-indent: -10000px;
}

#content {
background: #ff0
}

#content h2 {
min-height: 700px;
text-indent: -10000px;
}

</style>
</head>
<body>
	<!-- 상단 메뉴바 -->
	<%@ include file="inc/Header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-2" id="slide1" ><h1>슬라이드1</h1></div>
			<!-- 페이지 내용 영역 -->
			<div class="col-md-8" Id="content" ><h2>본문</h2></div>

			<div class="col-md-2" id="slide2" ><h3>슬라이드2</h3></div>
		</div>
	</div>
	<!-- 하단 footer -->
	<%@ include file="inc/Footer.jsp"%>
</body>

</html>