<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>
	
	<%@ include file="/WEB-INF/inc/topbar2.jsp"%>
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
	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>
