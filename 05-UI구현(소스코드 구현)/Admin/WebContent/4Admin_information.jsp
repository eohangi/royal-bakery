<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport"
content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
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

<!--lightbox plugin  -->
<link rel="stylesheet" href="plugins/lightbox/css/lightbox.min.css" />

<!-- jQuery Framework 참조하기 -->
<script src="http://code.jquery.com/jquery.min.js"></script>
	
<link rel="stylesheet" href="plugins/sweetalert/sweetalert.css" />

<script src="plugins/sweetalert/sweetalert.min.js"></script>	

<script type="text/javascript">
$(function(){
	$("#all_delete").click(function(){
			swal({
			  title: "전체 삭제",
			  text: "질문을 전체 삭제 하겠습니까?",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonClass: "btn-primary",
			  confirmButtonText: "삭제",
			
			  
			  
			  cancelButtonClass: "btn-danger",
			  cancelButtonText: "취소",
			  closeOnConfirm: false,
			  closeOnCancel: false
			},
			function(isConfirm){
				if(isConfirm){
					location.href="4Admin_information.jsp";
			}else{
				location.href="4Admin_information.jsp";
			}
			
			});  
	});
	
	$("#select_delete").click(function(){
		swal({
		  title: "삭제",
		  text: "이 질문을 삭제 하겠습니까?",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonClass: "btn-primary",
		  confirmButtonText: "삭제",
		
		  
		  
		  cancelButtonClass: "btn-danger",
		  cancelButtonText: "취소",
		  closeOnConfirm: false,
		  closeOnCancel: false
		},
		function(isConfirm){
			if(isConfirm){
				location.href="4Admin_information.jsp";
			}else{
				location.href="4Admin_information.jsp";
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
			<div class="content" >

				<h2 class="page-header " style = "text-align : left; padding-left : 30px; padding-bottom:20px" >| 글쓰기 </h2>



		<div class="container" style="padding-left : 30px; padding-right:30px;">

				<table class="table table-hover"  style="padding : 10px;">
					<thead>
						<tr>
							<th class="text-center  col-md-1">
								<input type="checkbox" name="check" id="check" style=" width: 18%;">

							</th>
							<th class="text-center  col-md-1" >#</th>
							<th class="text-center  col-md-4" >제목</th>
							<th class="text-center  col-md-1" >글쓴이</th>
							<th class="text-center  col-md-2" >등록일</th>
							
							<th class="text-center  col-md-2" >수정하기</th>
						</tr>
					</thead>

					<tbody>
						<div id='glayLayer'></div>
						<div id='overLayer'></div>
						<tr>
							<td class="text-center" style=" width: 18%;"><input type="checkbox" name="check" id="check"></td>
							<td class="text-center">1</td>
							<td>베너 이미지 1</td>
							<td class="text-center" >어한기</td>
							<td class="text-center" >13/10/15</td>

							<td class="text-center" ><a href="4Admin_information_detail.jsp"><input type="button"
								value="수정하기" class="btn btn-default" /></a>
							</td>
						</tr>
						<tr>
							<td class="text-center"><input type="checkbox" name="check" id="check"></td>
							<td class="text-center">2</td>
							<td>베너 이미지 2</td>
							<td class="text-center" >어한기</td>
							<td class="text-center">13/11/15</td>

							<td class="text-center"><input type="button"
								value="수정하기" class="btn btn-default" />
							</td>
						</tr>
						<tr>
							<td class="text-center"><input type="checkbox" name="check" id="check"></td>
							<td class="text-center">3</td>
							<td>베너 이미지 3</td>
							<td class="text-center" >어한기</td>
							<td class="text-center">13/12/15</td>

							<td class="text-center"><input type="button"
								value="수정하기" class="btn btn-default" />
							</td>
						</tr>
					</tbody>
				</table>
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

				<div class="form-group">

					<div class="clearfix">
						<div >
							<input id="select_delete" type="button"
							value="선택 삭제" class="btn btn-default pull-left" />
						</div>
						<div>
							<input id="all_delete" type="button" value="전체 삭제" class="btn btn-default pull-left" />
						</div>

						<div style="padding-right : 40px;">
							<a href="4Admin_information_create.jsp"><input type="button" value="글쓰기" class="btn btn-default pull-right"  /></a>
						</div>
					</div>
				</div>


			</div>
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

	<!-- lightbox 플러그인 스크립트를 body 종료 직전에 적용 해야한다. -->
	<script src="plugins/lightbox/js/lightbox-plus-jquery.min.js"></script>
</body>

</html>
