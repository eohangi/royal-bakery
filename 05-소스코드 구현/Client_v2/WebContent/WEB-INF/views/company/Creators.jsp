<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
<!-- CSS Global Compulsory-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/plugins/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/headers/header1.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/responsive.css">
<link rel="shortcut icon" href="favicon.ico">
<!-- CSS Implementing Plugins -->
<link rel="stylesheet"
	href="assets/plugins/font-awesome/css/font-awesome.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/plugins/flexslider/flexslider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/plugins/parallax-slider/css/parallax-slider.css">
<!-- CSS Theme -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/themes/default.css"
	id="style_color">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/themes/headers/default.css"
	id="style_color-header-1">
</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar.jsp"%>

	<div class="container">



		<!-- Recent Works -->
		<div class="headline" style="padding-top: 100px;">
			<h2>The Creators Project</h2>
		</div>
		<div class="row" style="text-align: center; padding-left: 130px;">
			<div class="col-md-2 col-sm-2">
				<div class="thumbnails thumbnail-style thumbnail-kenburn">
					<div class="thumbnail-img">
						<div class="overflow-hidden">
							<img class="img-responsive"
								src="${pageContext.request.contextPath}/assets/img/main/1.jpg"
								alt="" style="width: 150px; height: 248px;" />
						</div>
						<a class="btn-more hover-effect" href="#">read more +</a>
					</div>
					<div class="caption">
						<h3>
							<a class="hover-effect" href="#">김양수</a>
						</h3>
						<p>
							회원 과 일반제품 <br /> 관리 담당
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-sm-2">
				<div class="thumbnails thumbnail-style thumbnail-kenburn">
					<div class="thumbnail-img">
						<div class="overflow-hidden">
							<img class="img-responsive"
								src="${pageContext.request.contextPath}/assets/img/main/2.jpg"
								alt="" style="width: 150px; height: 248px;" />
						</div>
						<a class="btn-more hover-effect" href="#">read more +</a>
					</div>
					<div class="caption">
						<h3>
							<a class="hover-effect" href="#">임한종</a>
						</h3>
						<p>
							공지사항및 문의게시판 <br /> 관리 담당
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-sm-2">
				<div class="thumbnails thumbnail-style thumbnail-kenburn">
					<div class="thumbnail-img">
						<div class="overflow-hidden">
							<img class="img-responsive"
								src="${pageContext.request.contextPath}/assets/img/main/3.jpg"
								alt="" style="width: 150px; height: 248px;" />
						</div>
						<a class="btn-more hover-effect" href="#">read more +</a>
					</div>
					<div class="caption">
						<h3>
							<a class="hover-effect" href="#">권도엽</a>
						</h3>
						<p>
							주문제작 및 관리 와 <br /> 장바구니 기능 담당
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-sm-2">
				<div class="thumbnails thumbnail-style thumbnail-kenburn">
					<div class="thumbnail-img">
						<div class="overflow-hidden">
							<img class="img-responsive"
								src="${pageContext.request.contextPath}/assets/img/main/4.jpg"
								alt="" style="width: 150px; height: 248px;" />
						</div>
						<a class="btn-more hover-effect" href="#">read more +</a>
					</div>
					<div class="caption">
						<h3>
							<a class="hover-effect" href="#">어한기</a>
						</h3>
						<p>
							구매 및 주문내역 <br /> 결제 기능 담당
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-sm-2">
				<div class="thumbnails thumbnail-style thumbnail-kenburn">
					<div class="thumbnail-img">
						<div class="overflow-hidden">
							<img class="img-responsive"
								src="${pageContext.request.contextPath}/assets/img/main/5.jpg"
								alt="" style="width: 150px; height: 248px;" />
						</div>
						<a class="btn-more hover-effect" href="#">read more +</a>
					</div>
					<div class="caption">
						<h3>
							<a class="hover-effect" href="#">강호성</a>
						</h3>
						<p>
							일반제품 및 장바구니 <br /> 기능 구현 담당
						</p>
					</div>
				</div>
			</div>
		</div>
		<!--/row-->

		<div class="headline" style="padding-top: 50px; padding-bottom: 100px;">
			<h2>Special Thanks</h2>
			<p><br/><Strong>이광호 강사님</Strong></p>
		</div>

		<!-- End Recent Works -->

		<!-- JS Global Compulsory -->
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/assets/plugins/jquery-1.10.2.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/assets/plugins/jquery-migrate-1.2.1.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/assets/plugins/hover-dropdown.min.js"></script>
		<script type="text/javascript" src="assets/plugins/back-to-top.js"></script>
		<!-- JS Implementing Plugins -->
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/assets/plugins/flexslider/jquery.flexslider-min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/assets/plugins/parallax-slider/js/modernizr.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/assets/plugins/parallax-slider/js/jquery.cslider.js"></script>
		<!-- JS Page Level -->
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/assets/js/app.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/assets/js/pages/index.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function() {
				App.init();
				App.initSliders();
				Index.initParallaxSlider();
			});
		</script>
		<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <![endif]-->
</body>

</html>