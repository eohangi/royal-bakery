<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>My JSP Page</title>
<!-- Twitter Bootstrap3 & jQuery -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<!-- daum 우편번호 검색 스크립트 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="plugins/daumpostcode/daumpostcode.js"></script>

<!--lightbox plugin  -->
<link rel="stylesheet" href="plugins/lightbox/css/lightbox.min.css" />


<!-- jQuery Framework 참조하기 -->
<script src="http://code.jquery.com/jquery.min.js"></script>

<style type="text/css">


<%@ include file = "css/common.css" %>

div.container {

	min-height: auto;
}

/**  content  */
div#glayLayer {
	display: none;
	position: fixed;
	left: 0;
	top: 0;
	height: 100%;
	width: 100%;
	background: black;
	filter: alpha(opacity = 60);
	opacity: 0.60;
}

#overLayer {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	margin-top: -244px;
	margin-left: -325px;
}




div.content {
	float: left;
	padding-top: 20px;
	min-height: 500px;
	position: relative;
	width: 80%;
	overflow: hidden;
}


</style>

<!-- jQuery Framework 참조하기 -->
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<!-- 사용자 스크립트 블록 -->
<script type="text/javascript">
	$(function() {
		$("a.model").click(function() {
			$("#glayLayer").fadeIn(300);

			$("#overLayer").fadeIn(200);

			$("#overLayer").html("<img src='" + $(this).attr("href") + "' />");

			return false;
		});
		$("#glayLayer").click(function() {
			$(this).fadeOut(300);

			$("#overLayer").fadeOut(200);
		});
	});
</script>

</head>
<body>
<%@ include file = "Header.jsp" %>


	<div class="container">
		<div class="row">
			<div class="sidebar1"></div>
			<!-- 페이지 내용 영역 -->
			<div class="content">

				<h2 class="page-header "
					style="text-align: left; padding-left: 30px">| 배너 관리</h2>

				<p class="text-left " style="text-align: left; padding-left: 30px">*
					배너는 3개로 제한 합니다.</p>


				<div class="container"
					style="padding-left: 30px; padding-right: 30px;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="text-center  col-md-1">#</th>
								<th class="text-center  col-md-4">이미지 제목</th>
								<th class="text-center  col-md-2">이미지 확인</th>
								<th class="text-center  col-md-2">등록일</th>
								<th class="text-center  col-md-1">출력 순서</th>
								<th class="text-center  col-md-2">관리</th>
							</tr>
						</thead>

						<tbody>
							<div id='glayLayer'></div>
							<div id='overLayer'></div>
							<tr>
								<td class="text-center">1</td>
								<td>베너 이미지 1</td>
								<td><a href="img/1.jpg" class="model"><input
										type="button" value="이미지 확인" class="btn btn-warning" /></td>
								<td class="text-center">13/10/15</td>
								<td class="text-center">1</td>
								<td class="text-center"><a href="4Admin_banner_detail.jsp"><input type="button" value="수정"
									class="btn btn-default btn-xs" /></a></td>
							</tr>
							<tr>
								<td class="text-center">2</td>
								<td>베너 이미지 2</td>
								<td><a href="img/2.jpg" class="model"><input
										type="button" value="이미지 확인" class="btn btn-warning" /></a></td>
								<td class="text-center">13/11/15</td>
								<td class="text-center">2</td>
								<td class="text-center"><input type="button" value="수정"
									class="btn btn-default btn-xs" /></td>
							</tr>
							<tr>
								<td class="text-center">3</td>
								<td>베너 이미지 3</td>
								<td><a href="img/3.jpg" class="model"><input
										type="button" value="이미지 확인" class="btn btn-warning" /></td>
								<td class="text-center">13/12/15</td>
								<td class="text-center">3</td>
								<td class="text-center"><input type="button" value="수정"
									class="btn btn-default btn-xs" /></td>
							</tr>
						</tbody>
					</table>


				</div>
			</div>

			<div class="sidebar2"></div>
		</div>
	</div>
<%@ include file = "inc/footer.jsp" %>

	<!-- lightbox 플러그인 스크립트를 body 종료 직전에 적용 해야한다. -->
	<script src="plugins/lightbox/js/lightbox-plus-jquery.min.js"></script>
</body>

</html>
