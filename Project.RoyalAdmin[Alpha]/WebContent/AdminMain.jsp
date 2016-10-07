<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>Royal</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

<!-- Optional theme -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" />

<script src="http://code.jquery.com/jquery.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />


<!-- jQuery Framework 참조하기 -->
<script src="http://code.jquery.com/jquery.min.js"></script>

<style type="text/css">
.top {
	background: gray;
	min-height: 70px;
	text-align: center;
}

.container {
	text-align: center;
	height: 650px;
	margin: 0;
	padding: 0;
	width: auto;
}

/** web18/10-titlebar.html 의 코드를 재활용 */
/** 기본 초기화 처리 */

* {
	padding: 0;
	margin: 0;
}

body {
	background-color: #eee;
}

/**  타이틀 바 영역의 배경 색상 그라데이션 처리 */
.titlebar {
	width: 100%;
	height: 45px;
	border-bottom: 1px solid #555;
	/** 웹킷에 대한 그라데이션 - 강의시간에는 구글 크롬만 대상으로 합니다. */
	background-image: -webkit-linear-gradient(top, rgb(89, 189, 212) 8%,
		rgb(40, 142, 168) 74%);
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.7);
}
/** 목록 정의 초기화 */
ul {
	list-style: none;
}

/** 리스트 항목 가로 배치 */
.navi>li {
	width: 25%;
	float: left;
	height: 45px;
}

/** float 처리 마감제 */
.navi:after {
	color: '';
	display: block;
	float: none;
	clear: both;
}

/** 링크의 사이즈 처리 및 텍스트 꾸밈 */
.navi>li>a {
	text-decoration: none;
	display: block;
	width: auto;
	height: 45px;
	text-align: center;
	font-weight: bold;
	line-height: 45px;
	color: white;
	text-shadow: 0 1px 1px black;
	-webkit-transition: all 0.2s ease-in;
}

/** 링크 마우스 오버 */
.navi>li:hover>a {
	color: #f60;
	position: relative;
	top: -1px;
}

/** 2depth 메뉴 컨테이너 */
.navi>li>ul {
	background: rgb(89, 189, 212);
	width: 100%;
	box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.5);
	/** 타이틀바 보다 작은 값 */
	z-index: 100;
	/** 숨김 처리 */
	opacity: 0;
	visibility: hidden;
	position: relative;
}

/* 2depth메뉴 보이기 처리 */
.navi>li:hover>ul {
	opacity: 1;
	visibility: visible;
	-webkit-transition: all 0.5s;
	position: relative;
	top: 0px;
}

/* 2depth 메뉴 컨테이너 각 항목 > 링크 */
.navi ul>li>a {
	display: block;
	text-align: center;
	height: 30px;
	font-weight: normal;
	font-size: 11px;
	line-height: 30px;
	color: #fff;
	text-decoration: none;
}

/* 2depth 메뉴 컨테이너 각 항목 > 링크 마우스 오버 */
.navi ul>li>a:hover {
	color: #ff0;
	background: rgb(89, 179, 192);
}

#slide1 {
	background: #f0f;
	min-height: 650px;
}

#slide2 {
	background: #f60;
	min-height: 650px;
}

#content {
	background: #ff0;
}

div.footer {
	height: 100px;
}

.family_site {
	
}

.footerWrap {
	height: 100%;
	background-color: #5f5353;
}
</style>
</head>
<body>
	<div class="top" id="header">
		<Strong>관리자</Strong>
	</div>
	<div class="titlebar">
		<ul class="navi">
			<li><a href="#">회원관리</a></li>
			<li><a href="#">예약관리</a>
				<ul>
					<li><a href="#">주문내역</a></li>
					<li><a href="#">예약관리</a></li>
				</ul></li>
			<li><a href="#">제품관리</a>
				<ul>
					<li><a href="#">일반제품</a></li>
					<li><a href="#">주문제품</a></li>
				</ul></li>
			<li><a href="#">게시판관리</a>
				<ul>
					<li><a href="#">회사소개 관리</a></li>
					<li><a href="#">문의사항</a></li>
					<li><a href="#">공지사항 관리</a></li>
					<li><a href="#">배너 관리</a></li>
				</ul></li>
		</ul>
	</div>
	<div class="container" id="content">
		<div class="row">
			<div class="col-md-2" id="slide1">
				<h1>슬라이드1</h1>
			</div>
			<!-- 페이지 내용 영역 -->
			<div class="col-md-8" Id="content">
				<h2>본문</h2>
			</div>

			<div class="col-md-2" id="slide2">
				<h3>슬라이드2</h3>
			</div>
		</div> 
		</div>
	<%@ include file="inc/Footer.jsp"%>
</body>

</html>
