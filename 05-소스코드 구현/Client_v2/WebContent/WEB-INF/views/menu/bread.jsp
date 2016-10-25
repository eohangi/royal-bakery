<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<head>
<%@ include file="/WEB-INF/inc/head.jsp"%>

<!-- ajax-helper -->
<link rel="stylesheet" href="../plugins/ajax/ajax_helper.css" />
<script src="/WebContent/plugins/ajax/ajax_helper.js"></script>
<!-- handlebars plugin -->
<script src="/WebContent/plugins/handlebars/handlebars-v4.0.5.js"></script>

</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar2.jsp"%>
	<div class="page-header"></div>


	<div class="row">


		<!-- 페이지 내용 영역 -->
		<div class="col-md-2" id="slide1">
			<h1>슬라이드1</h1>
		</div>
		<div class="col-md-8">
			<ul id="myTab" class="nav nav-tabs">
				<li class="col-md-4 col-sm-4 active"><a id="classify_a"	data-toggle="tab" href="#bread">bread</a></li>
				<li class="col-md-4 col-sm-4"><a id="classify_b" data-toggle="tab" href="#cake">cake</a></li>
				<li class="col-md-4 col-sm-4"><a id="classify_c" data-toggle="tab" href="#cookie">cookie</a></li>
			</ul>
			<!--// 탭 메뉴 끝 -->

			<!-- 탭 화면 시작 -->
			<div class="tab-content">
				<div class="tab-pane fade in active" id="bread">
					<!-- ajax를 이용한 내용영역 -->
				</div>
				
				<div class="tab-pane fade" id="cake">
					<!-- ajax를 이용한 내용영역 -->
				</div>
				
				<div class="tab-pane fade" id="cookie">
					<!-- ajax를 이용한 내용영역 -->
				</div>
			</div>
			<!--// 탭 화면 끝 -->
			
			<!-- template -->
			<script id="image_item_tmpl" type="text/x-handlebars-template">
			</script>
			
			<!-- 사용자 정의 스크립트 -->
			<script type="text/javascript">
			</script>
		</div>


		<!-- 슬라이드 2 -->
		<!---------------------------------------  장바구니   ----------------------------------- -->
		<form class="form-horizontal" id="inquireform">

			<div class="col-md-2" style="padding-right: 0px;">

				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th class="text-center" colspan="2"
								style="background-color: rgb(217, 204, 255)">장바구니</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<th class="text-center">
							<th class="text-center">삭제</th>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th class="text-center"
								style="background-color: rgb(209, 255, 204)"></th>
							<th class="text-center"
								style="background-color: rgb(209, 255, 204)">총금액</th>
						</tr>
						<tr>
							<th class="text-center" colspan="2"
								style="background-color: rgb(209, 255, 204)">
								<button type="submit" class="btn btn-primary" onclick=' '>예약하기</button>
							</th>
						</tr>
					</tfoot>
				</table>

			</div>
		</form>
		<!--------------------------------------  장바구니 ------------ ------------------------- -->
	</div>

	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>