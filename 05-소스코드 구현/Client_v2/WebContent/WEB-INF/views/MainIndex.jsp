<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar1.jsp"%>
	<!-- /.navbar-->
	<!-- 캐러셀 내용 -->
	<div class="carousel-contain">
		<div class="carousel-inner">
			<!-- 항목 (1) -->
			<div class="item active">
				<img src="${pageContext.request.contextPath}/assets/img/carousel/carousel2.png" alt="빵이상의">

			</div>
			<!-- 항목 (2) -->
			<div class="item">
				<img src="${pageContext.request.contextPath}/assets/img/carousel/carousel3.png" alt="한입">

			</div>
			<!-- 항목 (3) -->
			<div class="item">
				<img src="${pageContext.request.contextPath}/assets/img/carousel/carousel4.png" alt="최고">

			</div>

		</div>
		<!-- // 내용영역 구성 -->
	</div>
	<div class="carinner-content">
		<ul class="carinner-content-container" id="boxbody">
			<li class="mybox" id="mybox" onclick="location.href='LoginPage.jsp'">
				<p>
					<img style="width: 40px; height: 40px;" src="${pageContext.request.contextPath}/assets/img/search.png">
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
					<img style="width: 40px; height: 40px;" src="${pageContext.request.contextPath}/assets/img/search.png">
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
					<img style="width: 40px; height: 40px;" src="${pageContext.request.contextPath}/assets/img/search.png">
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
