<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar.jsp"%>

	<div class="container">



		<!-- 페이지 내용 영역(김양수 수정내용)-->
		<div Id="content">
			<!-- 페이지에서 보여지는 전체의 내용을 감싸는 박스 -->
			<div class="mypage-container col-md-offset-2 col-md-8">

				<!-- 해당 페이지의 이름을 보여주는 내용을 감싸는 박스 -->
				<div class="page-name">
					<h3>
						<strong>| 브랜드 스토리</strong>
					</h3>
				</div>
				<!-- /해당 페이지의 이름을 보여주는 내용을 감싸는 박스 -->




				<!-- 페이지 이름 아래로 표시되는 모든 내용을 감싸는 박스-->
				<div class="inner-content row">

					<div class="thumbnail col-md-6">
						<img src="${pageContext.request.contextPath}/assets/img/brand.jpg"
							alt="사진" style="width: 500; , height: 300">
					</div>
					<div class="thumbnail col-md-6" style="width: 300; , height: 300;">

						<p class="intro">
							<strong> &#60;회사 소개 &#62;</strong> <br> <br> 갓 구운 신선함이
							매장을 가득 채웁니다.<br> <br> 오븐에서 방금 꺼낸 빵이 가장 맛있다는 것을 알기에,
							뚜레쥬르는 지금도 더욱 따뜻하고 촉촉한 갓 구운 빵을 제공하기 위해 끊임없이 노력합니다. 매장에서 직접 굽는 것에
							그치지 않고, 언제라도 따끈한 빵을 만날 수 있게 더욱 자주 굽고, 고객들이 필요한 시간에 맞춰 굽는 등 세심하고
							배려가 담긴 서비스도 준비하고 있습니다. 갓 구워낸 빵은 고소한 향기와 따스한 온기로 매장을 가득 채우고,
							고객들에게는 가장 맛있는 빵을 맛보는 행복을 선물합니다.
						</p>
						<br> <br>선별된 좋은 재료를 사용하여 더욱 건강한 제품을 제공하고자 합니다.<br>
						<br>
						<p>소중한 가족과 이웃에게 드리는 빵이기에, 뚜레쥬르의 빵과 케이크는 들어가는 모든 재료를 하나 하나 꼼꼼히
							선별해서 사용합니다. 빵에 들어가는 소량의 소금도 미네랄이 많은 신안의 고급 천일염을 사용하는 고집부터, 빵에 가장
							많이 쓰이는 우유와 치즈를 유기농 우유, 자연치즈로 바꿔보기도 하고, 각 지역의 싱싱한 제철 식재와 과일 등 자연의
							기운을 담은 순수한 재료를 사용하는 등. 항상 좋은 재료가 기본이 되는 건강하고 정직한 빵과 케이크를 만들고자 노력
							합니다.</p>


					</div>
					<!-- thumbnail 종료 -->

				</div>
				<!-- /페이지 이름 아래로 표시되는 모든 내용을 감싸는 박스-->
				<!-- 페이지 이름 아래로 표시되는 모든 내용을 감싸는 박스-->
				<div class="inner-content row">

					<div class="thumbnail col-md-6">
						<img src="${pageContext.request.contextPath}/assets/img/map2.jpg"
							alt="사진" style="width: 90%;">
					</div>
					<div class="thumbnail col-md-6" style="height: 230px;">
						<br> <br> <br>
						<p class="address">도로명주소 : 서울시 서초구 서초대로 77길 3 아라타워 1층 뚜레쥬르
							지번주소 : 서울시 서초구 서초동 1317-20 아라타워 1층</p>
						<p class="tel">전화 : 02-0000-0000</p>

						<p class="intro">
							<strong>찾아오시는길.</strong>
						</p>

					</div>
					<!-- thumbnail 종료 -->

				</div>
				<!-- /페이지 이름 아래로 표시되는 모든 내용을 감싸는 박스-->
			</div>
			<!-- /페이지에서 보여지는 전체의 내용을 감싸는 박스 -->
		</div>


	</div>

	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>