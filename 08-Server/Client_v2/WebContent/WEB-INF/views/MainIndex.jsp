<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>

</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<!-- /.navbar-->
	<!-- 캐러셀 내용 -->
	<div id="myCarousel" class="carousel slide myCarousel" data-ride="carousel" data-interval="2000">
		<ol class="carousel-indicators">
		    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		    <li data-target="#myCarousel" data-slide-to="1"></li>
		    <li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<!-- 항목 (1) -->
			<div class="item active">
				<img
					src="${pageContext.request.contextPath}/assets/img/carousel/carousel2.png"
					alt="빵이상의">

			</div>
			<!-- 항목 (2) -->
			<div class="item">
				<img
					src="${pageContext.request.contextPath}/assets/img/carousel/carousel3.png"
					alt="한입">

			</div>
			<!-- 항목 (3) -->
			<div class="item">
				<img
					src="${pageContext.request.contextPath}/assets/img/carousel/carousel4.png"
					alt="최고">

			</div>
			<!--이동 버튼-->
			<a href="#carousel-example-generic" data-slide="prev"
				class="left carousel-control"> <span class="icon-prev"></span></a> 
			<a	href="#carousel-example-generic" data-slide="next"
				class="right carousel-control"> <span class="icon-next"></span></a>
			<!-- // 내용영역 구성 -->
		</div>
	</div>
	<div class="carinner-content" 
		style="height: 463px; width: 1400px;				
				background: url('${pageContext.request.contextPath}/assets/img/background.png') no-repeat;
				background-size: 100% 100%">
			
			<!-- 캐러셀 내용 -->
	   <a href="${pageContext.request.contextPath}/product/productBread.do"> <div id="productCarousel" class="carousel slide carousel-fade productCarousel" data-ride="carousel" data-interval="2000">
			
			<div class="carousel-inner" role="listbox">
				<!-- 항목 (1) -->
				<div class="item active">
					<img
						src="${pageContext.request.contextPath}/assets/img/bread/b001.jpg"
						alt="빵이상의">
	
				</div>
				<!-- 항목 (2) -->
				<div class="item">
					<img
						src="${pageContext.request.contextPath}/assets/img/bread/b005.jpg"
						alt="한입">
	
				</div>
				<!-- 항목 (3) -->
				<div class="item">
					<img
						src="${pageContext.request.contextPath}/assets/img/bread/b006.jpg"
						alt="최고">
	
				</div>
				<!-- 항목 (4) -->
				<div class="item">
					<img
						src="${pageContext.request.contextPath}/assets/img/bread/b008.jpg"
						alt="최고">
	
				</div>
				<!-- 항목 (5) -->
				<div class="item">
					<img
						src="${pageContext.request.contextPath}/assets/img/cake/k011.jpg"
						alt="최고">
	
				</div>
				<!-- 항목 (6) -->
				<div class="item">
					<img
						src="${pageContext.request.contextPath}/assets/img/cake/k014.jpg"
						alt="최고">
	
				</div>
			</div>
		</div></a>
  </div>
<script type="text/javascript">
	$(function(){
		$('#carouselFade').carousel({
			  interval: 3000,
			  pause: false
			})
	});
</script>
	</div>
		<br />
		<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>
