<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>My JSP Page</title>
	<!-- Twitter Bootstrap3 & jQuery -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />
	<script src="http://code.jquery.com/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<!-- daum 우편번호 검색 스크립트 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="plugins/daumpostcode/daumpostcode.js"></script>


<!-- jQuery Framework 참조하기 -->
<script src="http://code.jquery.com/jquery.min.js"></script>
	
<link rel="stylesheet" href="plugins/sweetalert/sweetalert.css" />

<script src="plugins/sweetalert/sweetalert.min.js"></script>	

<script type="text/javascript">
$(function(){
	$("#ok").click(function(){
			swal({
			  title: "등록",
			  text: "등록 하겠습니까?",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonClass: "btn-primary",
			  confirmButtonText: "등록",
			
			  
			  
			  cancelButtonClass: "btn-danger",
			  cancelButtonText: "취소",
			  closeOnConfirm: false,
			  closeOnCancel: false
			},
			function(isConfirm){
				if(isConfirm){
					location.href="4Admin_com_info.jsp";
			}else{
				location.href="4Admin_com_info.jsp";
			}
			
			});  
	});
});
</script>


<style type="text/css">

	/** web18/10-titlebar.html 의 코드를 재활용 */
	/** 기본 초기화 처리 */
	* {
		padding:0 ;
		margin: 0;

	}

	html, body{
		height: 100%;
	}

	div.container {
		text-align: center;
		min-height: 650px;
		margin: auto;
		padding: 0;
		width: auto;
		height: auto;
		position: relative;
		overflow: hidden;
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

	div.container{
		min-height:auto;

	}

	/**  content  */
	div.sidebar1 {
		float:left;
		background: #ccc;
		min-height: 500px;
		position:relative;
		width:10%;
		height: auto;

	}

	div.sidebar2 {
		float:left;
		background: #ccc;
		min-height: 500px;
		position:relative;
		width:10%;
		height: auto;

	}

	div.content {
		float:left;
		padding-top: 20px;
		min-height: 500px;
		position:relative;
		width:80%;
		overflow:hidden;
	}

	/** footer  */
	.footer{
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
			<div class="sidebar1">슬라이드1</div>
			<!-- 페이지 내용 영역 -->
			<div class="content">

			<h2 class="page-header " style = "text-align : left; padding-left : 30px" >| 회사소개 </h2>
			<form class="form-horizontal" id="myform">
				<div class="form-group">
				<label for="postcode" class="col-md-2">우편번호</label>
				<div class="col-md-10 clearfix">
					<!-- clearfix 는 마감제 속성 -->
					<input type="text" name="postcode" id="postcode"
						class="form-control pull-left"
						style='width: 120px; margin-right: 5px' /> <input type="button"
						value="우편번호 찾기" class="btn btn-warning pull-left"
						onclick='execDaumPostcode("postcode", "addr1", "addr2")' />
				</div>

			</div>
			<div class="form-group">
				<label for="addr1" class="col-md-2">주소</label>
				<div class="col-md-9">
					<input type="text" name="addr1" id="addr1" class="form-control">
				</div>
			</div>

			<div class="form-group">
				<label for="Tel" class="col-md-2">전화</label>
				<div class="col-md-9">
					<input type="text" name="Tel" id="Tel" class="form-control">
				</div>
			</div>

			<div class="form-group">
				<label for="homepage" class="col-md-2">홈페이지</label>
				<div class="col-md-9">
					<input type="text" name="homepage" id="homepage" class="form-control">
				</div>
			</div>

			<div class="form-group">
				<label for="info" class="col-md-2">회사 소개</label>
				<div class="col-md-9">
					<input type="text" name="info" id="info" class="form-control" style="margin: 0px; height: 200px;">
				</div>
			</div>

			<div class="form-group">
				<label for="img" class="col-md-2">이미지</label>
				<div class="col-md-9">
					<input type="file" name="img" id="img"
						class="form-control">
				</div>
			</div>

			<div class="form-group">
				
				<div class="clearfix">
				<!-- <div class="col-md-offset-2 col-md-1">
					<input type="button"
						value="취소" class="btn btn-warning pull-left" />
				</div> -->
				<div class="col-md-offset-7 col-md-1">
					<input id="ok" type="button"
						value="등록" class="btn btn-primary pull-left" />
				</div>
				</div>
			</div>

			</form>
				

			</div>

			<div class="sidebar2">슬라이드2</div>
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