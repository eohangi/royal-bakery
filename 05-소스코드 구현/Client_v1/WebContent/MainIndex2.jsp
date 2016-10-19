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


<!-- daum 우편번호 검색 스크립트 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="plugins/daumpostcode/daumpostcode.js"></script>

<!-- pickadate plugin -->
<link rel="stylesheet" href="plugins/pickadate/themes/default.css" />
<link rel="stylesheet" href="plugins/pickadate/themes/default.date.css" />
<link rel="stylesheet" href="plugins/pickadate/themes/default.time.css" />
<script src="plugins/pickadate/picker.js"></script>
<script src="plugins/pickadate/picker.date.js"></script>
<script src="plugins/pickadate/picker.time.js"></script>
<script src="plugins/pickadate/translations/ko_KR.js"></script>

<!--  validate 플러그인 참조-->
<script type="text/javascript"
	src="plugins/validate/dist/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="plugins/validate/dist/additional-methods.min.js"></script>
<!--  sweet alert -->
<link rel="stylesheet" href="plugins/sweetalert/dist/sweetalert.css" />
<script src="plugins/sweetalert/dist/sweetalert.min.js"></script>




<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<script type="text/javascript">
	
</script>

<style type="text/css">
/** 기본 초기화 처리 */
.form-horizontal .form-group {
	margin-right: 0;
}

div.row {
	margin-right: 0;
	min-height: 750px;
}

/****************************** banner *********************/
.banner {
	text-align: center;
	background-color: #fff6cc
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

/***********************************  ***********************************************/
.carousel {
	height: 500px;
	margin-bottom: 60px;
}

.carousel-inner>.item>img {
	min-width: 100%;
	height: 500px;
}

.carousel-inner .carousel-caption {
	padding-left: 30px;
	padding-right: 30px;
	background-color: rgba(0, 0, 0, 0.5) !important;
}

/************************************ *********************************/
.carinner-content-container {
	padding: 0px;
	height: 200px;
	background-color: white;
	border: solid 0px #eee;
	border-top: 0px;
	margin: 0;
}

.carinner-content-info h5 {
	padding-bottom: 60px;
}

#mybox {
	border: 1px solid #eee;
}

.carinner-content .carinner-content-container .mybox {
	/** 메뉴박스4개 링크영역 확장+마우스호버*/
	padding: 0px;
	margin: 0;
	height: 160px;
	display: inline-block;
	width: 32%;
	text-align: center;
	border: 1px solid #eee;
	cursor: pointer;
	margin: 5px;
}

/************************************ *********************************/
.footer {
	height: 100px;
	position: relative;
	bottom: 0;
	width: 100%;
	/* Set the fixed height of the footer here */
	background-color: #f5f5f5;
}

.family_site {
	
}

.footerWrap {
	height: 100%;
	background-color: #5f5353;
}
F
</style>
</head>
<body>

	<%@ include file="inc/Header2.jsp"%>
	<!-- /.navbar-->
	<!-- 캐러셀 내용 -->
	<div class="carousel-contain">
		<div class="carousel-inner">
			<!-- 항목 (1) -->
			<div class="item active">
				<img src="img/main1.jpg" alt="꽃(1)">

			</div>
			<!-- 항목 (2) -->
			<div class="item">
				<img src="img/main2.jpg" alt="꽃(2)">

			</div>
			<!-- 항목 (3) -->
			<div class="item">
				<img src="img/main3.jpg" alt="꽃(3)">

			</div>

		</div>
		<!-- // 내용영역 구성 -->
	</div>
	<div class="carinner-content">
		<ul class="carinner-content-container" id="boxbody">
			<li class="mybox" id="mybox" onclick="location.href='bread.jsp'">
				<a href="http://www.naver.com"></a>
				<p>
					<img style="width: 40px; height: 40px;" src="img/search.png">
				</p>
				<p>
				<h4>일반제품 예약</h4>
				</p>
				<p>
				<h6></h6>
				</p>
			</li>
			<li class="mybox" id="mybox" onclick="location.href='CustomOrder.jsp'">
				<p>
					<img style="width: 40px; height: 40px;" src="img/search.png">
				</p>
				<p>
				<h4>주문제작 예약</h4>
				</p>
				<p>
				<h6></h6>
				</p>
			</li>
			<li class="mybox" id="mybox" onclick="location.href='MybookingList.jsp'">
				<p>
					<img style="width: 40px; height: 40px;" src="img/search.png">
				</p>
				<p>
				<h4>장바구니</h4>
				</p>
				<p>
				<h6></h6>
				</p>
			</li>
		</ul>
	</div>
	<%@ include file="inc/Footer.jsp"%>
</body>

</html>
