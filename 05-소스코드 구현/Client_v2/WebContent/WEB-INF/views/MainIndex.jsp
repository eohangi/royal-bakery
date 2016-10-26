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
	<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="2000">
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
		<div class="carinner-content">
			<ul class="carinner-content-container" id="boxbody">
				<li class="mybox" id="mybox" onclick="location.href='LoginPage.jsp'">
					<p>
						<img style="width: 40px; height: 40px;"
							src="${pageContext.request.contextPath}/assets/img/search.png">
					</p>
					<p>
					<h4>일반제품 예약</h4>
					</p>
					<p>
					<h6></h6>
					</p>
				</li>
				<li class="mybox" id="mybox" onclick="location.href='LoginPage.jsp'">
					<p>
						<img style="width: 40px; height: 40px;"
							src="${pageContext.request.contextPath}/assets/img/search.png">
					</p>
					<p>
					<h4>주문제작 예약</h4>
					</p>
					<p>
					<h6></h6>
					</p>
				</li>
				<li class="mybox" id="mybox" onclick="location.href='LoginPage.jsp'">
					<p>
						<img style="width: 40px; height: 40px;"
							src="${pageContext.request.contextPath}/assets/img/search.png">
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
		<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>
