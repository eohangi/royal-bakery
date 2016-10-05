<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

<title>Royal</title>

<!-- Twitter Bootstrap3 & jQuery -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>



<style type="text/css">

/** web18/10-titlebar.html 의 코드를 재활용 */
/** 기본 초기화 처리 */
.top {
	
}

	div.container {
		text-align: center;
		min-height: 650px;
		margin: auto;
		width: auto;
		height: auto;
		position: relative;
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
/** 리스트 항목 가로 배치 */
.navi>li {
	width: 20%;
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

/**  content  */
div.sidebar1 {
	float: left;
	background: #f60;
	min-height: 650px;
	position: relative;
	width: 100px;
	height: auto;
}

div.sidebar2 {
	float: left;
	background: #f60;
	min-height: 650px;
	position: relative;
	width: 100px;
	height: auto;
}

div.content {
	float: left;
	background: #ff0;
	min-height: 650px;
	position: relative;
	width: 600px;
}

/**  header*/
	.header{
		padding-top: 70px;
	}

	.form-group{

	}

	.product {
		float: right;
	}


/** table */
.table-responsive {
	padding-top: 100px;
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
/** footer  */
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
</style>
</head>
<body>
<%@ include file = "Header.jsp" %>
	<div class="container">
		<div class="row">
					<div class="header">
							<div class="Search">
								<form class="form-inline">
									<fieldset>
										<div class="form-group">
											<label class="sr-only" for="search">검색할 단어를 입력하세요.</label>
											<input type="search" class="form-control" id="search" >
										</div>
										<button type="submit" class="btn btn-primary">검색</button>
									</fieldset>
								</form>

							</div>	

							<div class="product">
								<button type="submit" class="btn btn-primary">제품등록</button>
							</div>

						</div>

			<!-- 페이지 내용 영역 -->
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th class="text-center">생년월일</th>
							<th class="text-center">아이디</th>
							<th class="text-center">이름</th>
							<th class="text-center">성별</th>
							<th class="text-center">연락처</th>
							<th class="text-center">관리</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="text-center">1990-05-25</th>
							<th class="text-center">goodluck</th>
							<th class="text-center">이한별</th>
							<th class="text-center">남</th>
							<th class="text-center">010-7894-1234</th>
							<th class="text-center"><a href="1Admin_client_info_detail.jsp">보기</a> / 예약관리</th>
						</tr>
						<tr>
							<th class="text-center">1995-07-16</th>
							<th class="text-center">good</th>
							<th class="text-center">긁핵</th>
							<th class="text-center">남</th>
							<th class="text-center">010-4567-1234</th>
							<th class="text-center">보기 / 예약관리</th>
						</tr>
						<tr>
							<th class="text-center">1985-04-28</th>
							<th class="text-center">luck</th>
							<th class="text-center">읽핡볉</th>
							<th class="text-center">남</th>
							<th class="text-center">010-1237-7822</th>
							<th class="text-center">보기 / 예약관리</th>
						</tr>
						<tr>
							<th class="text-center">1985-04-28</th>
							<th class="text-center">luck</th>
							<th class="text-center">읽핡볉</th>
							<th class="text-center">남</th>
							<th class="text-center">010-1237-7822</th>
							<th class="text-center">보기 / 예약관리</th>
						</tr>
						<tr>
							<th class="text-center">1985-04-28</th>
							<th class="text-center">luck</th>
							<th class="text-center">읽핡볉</th>
							<th class="text-center">남</th>
							<th class="text-center">010-1237-7822</th>
							<th class="text-center">보기 / 예약관리</th>
						</tr>
						<tr>
							<th class="text-center">1990-05-25</th>
							<th class="text-center">goodluck</th>
							<th class="text-center">이한별</th>
							<th class="text-center">남</th>
							<th class="text-center">010-7894-1234</th>
							<th class="text-center">보기 / 예약관리</th>
						</tr>
						<tr>
							<th class="text-center">1990-05-25</th>
							<th class="text-center">goodluck</th>
							<th class="text-center">이한별</th>
							<th class="text-center">남</th>
							<th class="text-center">010-7894-1234</th>
							<th class="text-center">보기 / 예약관리</th>
						</tr>
						<tr>
							<th class="text-center">1990-05-25</th>
							<th class="text-center">goodluck</th>
							<th class="text-center">이한별</th>
							<th class="text-center">남</th>
							<th class="text-center">010-7894-1234</th>
							<th class="text-center">보기 / 예약관리</th>
						</tr>
						<tr>
							<th class="text-center">1990-05-25</th>
							<th class="text-center">goodluck</th>
							<th class="text-center">이한별</th>
							<th class="text-center">남</th>
							<th class="text-center">010-7894-1234</th>
							<th class="text-center">보기 / 예약관리</th>
						</tr>
						<tr>
							<th class="text-center">1990-05-25</th>
							<th class="text-center">goodluck</th>
							<th class="text-center">이한별</th>
							<th class="text-center">남</th>
							<th class="text-center">010-7894-1234</th>
							<th class="text-center">보기 / 예약관리</th>
						</tr>

					</tbody>
				</table>
			</div>

			<ul class="pagination">
				<li class="disabled"><a href="#">&laquo;</a></li>
				<!-- 활성화 버튼은 아래의 구조로 구성하시면 됩니다. sr-only는 스크린리더 전용 입니다 .-->
				<li class="active"><span>1 <span class="sr-only">(current)</span></span></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">&raquo;</a></li>
			</ul>
			<div></div>
		</div>
	</div>

	<div class="footer">
		<div class="footerWrap">
			<ul class="list-unstyled">
				<li>
					<address>copyright 2016</address>
				</li>
			</ul>
		</div>
	</div>

</body>

</html>