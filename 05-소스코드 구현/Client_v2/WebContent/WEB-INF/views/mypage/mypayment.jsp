<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar.jsp"%>

	<div class="page-header"></div>
	<div class="container">

		<div class="col-md-2" id="slide1">
			<h1>슬라이드1</h1>
		</div>


		<!-- 페이지 내용 영역(김양수 수정내용)-->
		<div class="col-md-8" Id="content">
			<!-- 페이지에서 보여지는 전체의 내용을 감싸는 박스 -->
			<div class="mypage-container">

				<!-- 해당 페이지의 이름을 보여주는 내용을 감싸는 박스 -->
				<div class="page-name">
					<h1>
						<strong>｜결제확인</strong>
					</h1>
				</div>
				<!-- /해당 페이지의 이름을 보여주는 내용을 감싸는 박스 -->




				<!-- 페이지 이름 아래로 표시되는 모든 내용을 감싸는 박스-->
				<div class="payinner-content">


					<!--마이 페이지 안내 메시지를 감싸는 상단의 박스-->
					<div class="payinner-content-info">
						<p>
						<h3>안녕하세요. 강호성고객님</h3>
						</p>
						<p>
						<h5>마이페이지에서는 고객님의 활동 내역 및 정보를 확인할 수 있습니다.</h5>
						</p>
					</div>
					<!-- /마이 페이지 안내 메시지를 감싸는 상단의 박스-->


					<!-- 페이지에 들어갈 2가지 메뉴시작-->
					<ul class="payinner-content-container" id="boxbody">
						<li class="mybox" id="mybox" >
						<a href="${pageContext.request.contextPath}/mypage/ReservationList.do?orderCategory=reservation">
							<p>
								<img style="width: 40px; height: 40px;" src="${pageContext.request.contextPath}/assets/img/search.png">
							</p>
							<p>
							<h4>예약확인</h4>
							</p>
							<p>
							<h6>고객님이 결제하신 상품을 확인 할 수 있습니다.</h6>
							</p>
							</a>

						</li>
						<li class="mybox" id="mybox" >
						<a href="${pageContext.request.contextPath}/mypage/OrderList.do?orderCategory=pay">
							<p>
								<img style="width: 40px; height: 40px;" src="${pageContext.request.contextPath}/assets/img/search.png">
							</p>
							<p>
							<h4>구매내역</h4>
							</p>
							<p>
							<h6>고객님이 받아가신 상품을 확인 할 수 있습니다.</h6>
							</p>
							</a>
						</li>
					</ul>
					<!-- /페이지에 들어갈 2가지 메뉴시작-->



				</div>
				<!-- /페이지 이름 아래로 표시되는 모든 내용을 감싸는 박스-->
			</div>
			<!-- /페이지에서 보여지는 전체의 내용을 감싸는 박스 -->
		</div>


		<div class="col-md-2" id="slide2">
			<h3>슬라이드2</h3>
		</div>
	</div>

	<!-- 하단 footer -->
	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>