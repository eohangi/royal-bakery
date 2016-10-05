<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
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


<!-- jQuery Framework 참조하기 -->
<script src="http://code.jquery.com/jquery.min.js"></script>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<script type="text/javascript">
	
</script>

<style type="text/css">

/** web18/10-titlebar.html 의 코드를 재활용 */
/** 기본 초기화 처리 */
.form-horizontal .form-group {
	margin-right: 0;
}

div.row {
	margin-right: 0;
	min-height: 950px;
}

/****************************** banner *********************/
.banner {
	text-align: center;
	background-color: #fff6cc;
}

/**  타이틀 바 영역의 배경 색상 그라데이션 처리 */
.titlebar {
	width: 100%;
	height: 45px;
	border-bottom: 1px solid #555;
	/** 웹킷에 대한 그라데이션 - 강의시간에는 구글 크롬만 대상으로 합니다. */
	background-image: -webkit-linear-gradient(top, rgb(255, 246, 204) 8%,
		rgb(255, 246, 204) 74%);
	text-align: -webkit-match-parent;
}
/** 리스트 항목 가로 배치 */
.navi>li {
	width: 16.5%;
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
	color: black;
	-webkit-transition: all 0.2s ease-in;
}

.list-unstyled {
	margin: 0;
}

/** 링크 마우스 오버 */
.navi>li:hover>a {
	color: #f60;
	position: relative;
	top: -1px;
}

/** 2depth 메뉴 컨테이너 */
.navi>li>ul {
	background: rgb(255, 246, 204);
	width: 100%;
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
	color: black;
	text-decoration: none;
}

/* 2depth 메뉴 컨테이너 각 항목 > 링크 마우스 오버 */
.navi ul>li>a:hover {
	color: orange;
	background: rgb(255, 246, 204);
}

/*****************************  content*************************** */
#slide1 h1 {
	
	text-indent: -10000px;
	padding-right: 0px;
}

#slide2 {
	
}

#slide2 h3 {
	
	text-indent: -10000px;
	padding-right: 0px;
}

#content {
	
}

.box1 {
	margin-top: 50px;
	width: 50%;
	height: 300px;
	float: left;
}

.box2 {
	width: 50%;
	height: 300px;
	float: left;
}

/******************** client join and update*************************** */
div.clientjoin {
	text-align: center;
	
	width: auto;
	height: auto;
	position: relative;
	margin-right: 130px;
	margin-left: 130px;
	margin: auto;
	width: auto;
	height: auto;
}

div.container {
	height: 700px;
	text-align: center;
	margin: auto;
	width: auto;
	height: auto;
	position: relative;
	padding-right: 0px;
}

.join {
	margin: auto;
	align: center;
	width: 70%;
	text-align: center;
	align: center;
}

.page-header {
	margin-top: 130px;
	text-align: center;
}

/********************** FAQ******************************/
.tab_menu1 {
	overflow: hidden;
	witdh: 250px;
	margin: 0 auto 20px;
	margin-top: 60px;
}

.tab_menu1 li {
	float: left;
	width: 49.85%;
	margin-left: 1px;
}

.tab_menu1 li:first-child {
	margin-left: 0;
}

.tab_menu1 li a {
	float: left;
	display: inline-block;
	width: 100%;
	height: 30px;
	padding: 0;
	border: 1px solid black;
	text-align: center;
	line-height: 2em;
}

.mgb_20 {
	margin-bottom: 20px !important;
}

.tab_menu1.tab3>li {
	width: 33.2% !important;
}

/***************************** inquire *************************************/
.Tarea {
	width: 70%;
}

.area {
	width: 70%;
	height: 300px;
}

.button {
	float: right;
}

/************************************** Idsearch *************************************/
.Idsearch {
	
	padding-top: 100px;
	margin-left: 300px;
	margin-right: 300px;
	text-align: center;
	padding-top: 100px;
}

/***************************** LoginPage *************************************/
.loginB {
	padding-top: 100px;
	margin-left: 300px;
	margin-right: 300px;
	min-height: 800px;
}

.Lbutton {
	float: left;
}

.joinB {
	float: right;
}

.form-control {
	width: 60%;
}

/************************************** myorderlist  *************************************/
.page-name { /** 장바구니 */
	color: rgb(29, 135, 115);
	text-align: left;
	margin-top: 130px;
}

.inner-content {
	padding-top: 15px;
	padding-bottom: 0px;
	background-color: white;
	border: 1px solid #eee;
	height: auto;
}

/************************************** mypage  *************************************/
.page-name {
	color: rgb(29, 135, 115);
	text-align: left;
}

.mybox h6 { /**박스 안 글자가 너무 붙은거 같아서 떨어뜨렸음.*/
	padding-top: 20px;
}

.myinner-content {
	background-color: white;
	border: solid 2px #eee;
	border-bottom: 0px;
	height: 350px;
}

.myinner-content-container {
	padding: 0px;
	height: 200px;
	background-color: white;
	border: solid 0px #eee;
	border-top: 0px;
	margin: 0;
}

.myinner-content-info h5 {
	padding-bottom: 60px;
}

#mybox {
	border: 1px solid #eee;
}

.myinner-content .myinner-content-container .mybox {
	/** 메뉴박스4개 링크영역 확장+마우스호버*/
	padding: 0px;
	margin: 0;
	height: 160px;
	display: inline-block;
	width: 20%;
	text-align: center;
	border: 1px solid #eee;
	cursor: pointer;
	margin: 5px;
}

/************************************** mypayment  *************************************/
.payinner-content {
	background-color: white;
	border: solid 2px #eee;
	border-bottom: 0px;
	height: 350px;
}

.payinner-content-container {
	height: 155px;
	background-color: white;
	border: solid 0px #eee;
	border-top: 0px;
	margin: 0;
}

.payinner-content-info h5 {
	padding-bottom: 60px;
}

.payinner-content .payinner-content-container .mybox {
	/** 메뉴에 구현한 예약확인,구매확인 선택 박스 
		디스플레이 인라인-블럭으로 링크영역 확장 후
		커서 포인트로 링크영역 마우스 호버시 손가락 모양으로 바뀌게 하였다.
	*/
	display: inline-block;
	width: 40%;
	text-align: center;
	border: 1px solid #eee;
	cursor: pointer;
	height: 160px;
	margin: 5px;
}

/************************************** mysquestionlist *************************************/
.myquestion-container {
	margin: 0;
	height: auto;
}

.qeinner-content {
	padding-top: 15px;
	padding-bottom: 0px;
	background-color: white;
	border: solid 2px #eee;
	border-bottom: 1px solid #eee;
	height: auto;
}

.qeinner-content-container {
	height: 155px;
	background-color: white;
	border: solid 0px #eee;
	border-top: 0px;
	margin: 0;
}

.myquestionlist {
	border-bottom: 1px solid #eee;
	padding: 10px;
}

.qeinner-content-info-text {
	padding-bottom: 30px;
}

.button_my_question {
	/* 페이지 하단에 있는 문의하기 삭제하기 버튼*/
	padding: 20px;
}

/************************************** orderList *************************************/
div.content {
	float: left;
	min-height: 750px;
	position: relative;
	width: 600px;
}

.product {
	float: right;
}

/** table */
.table-responsive {
	padding-top: 100px;
	padding-left: 130px;
	padding-right: 130px;
}

.table-striped>tbody>tr:nth-child(odd)>td, .table-striped>tbody>tr:nth-child(odd)>th
	{
	background-color: white !important;
}

.table-striped>tbody>tr:hover>td, .table-striped>tbody>tr:hover>th {
	background-color: orange !important;
}

.pagination {
	margin: 0;
}

/************************************** footer  *************************************/
.footer {
	padding-bottom: 0;
	height: 100px;
	position: relative;
	bottom: 0;
	width: 100%;
	/* Set the fixed height of the footer here */
	background-color: #f5f5f5;
	height: 100px;
}

.family_site {
	
}

.footerWrap {
	padding-bottom: 0;
	height: 100px;
	position: relative;
	bottom: 0;
	width: 100%;
	height: 100px;
	background-color: #5f5353;
}
</style>