<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="inc/Common.jsp"%>
</head>
<body>

	<%@ include file="inc/Header2.jsp"%>
	<div class="page-header"></div>
	<div class="container">

			<div class="col-md-2" id="slide1">
				<h1>슬라이드1</h1>
			</div>



			<!-- 페이지 내용 영역(김양수 수정내용)-->
			<div class="col-md-8" Id="content">
				<div class="mypage-container">
					<div class="page-name">
						<h1>
							<strong>｜My Page</strong>
						</h1>
					</div>
					<div class="myinner-content">
						<!--마이 페이지 내에 4가지 영역을 감싸는 컨텐트-->
						<div class="myinner-content-info">
							<p>
							<h3>안녕하세요.강호성고객님</h3>
							</p>
							<p>
							<h5>마이페이지에서는 고객님의 활동 내역 및 정보를 확인할 수 있습니다.</h5>
							</p>
						</div>
						<!-- 페이지에 들어갈 4가지 메뉴시작-->
						<ul class="myinner-content-container" id="boxbody">
							<li class="mybox" id="mybox" onclick=window.open("InformationUpdate.jsp","_self")>
								<a href="http://www.naver.com"></a>
								<p>
									<img style="width: 40px; height: 40px;"  src="img/search.png">
								</p>
								<p>
								<h4>개인정보 수정</h4>
								</p>
								<p>
								<h6>고객님의 개인정보를 변경할 수 있습니다.</h6>
								</p>
							</li>
							<li class="mybox" id="mybox" onclick=window.open("MybookingList.jsp","_self")>
								<p>
									<img style="width: 40px; height: 40px;" src="img/search.png">
								</p>
								<p>
								<h4>장바구니</h4>
								</p>
								<p>
								<h6>고객님의 담으신 상품을 확인 할 수 있습니다.</h6>
								</p>
							</li>
							<li class="mybox" id="mybox" onclick=window.open("OrderList.jsp","_self")>
								<p>
									<img style="width: 40px; height: 40px;" src="img/search.png">
								</p>
								<p>
								<h4>결제확인</h4>
								</p>
								<p>
								<h6>고객님이 결제하신 상품을 확인할 수 있습니다.</h6>
								</p>
							</li>
							<li class="mybox" id="mybox" onclick=window.open("MyquestionList.jsp","_self")>
								<p>
									<img style="width: 40px; height: 40px;" src="img/search.png">
								</p>
								<p>
								<h4>상담내역</h4>
								</p>
								<p>
								<h6>상담한 내역을 확인 할 수 있습니다.</h6>
								</p>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="col-md-2" id="slide2">
				<h3>슬라이드2</h3>
			</div>
		</div>

	<!-- 하단 footer -->
	<%@ include file="inc/Footer.jsp"%>
</body>

</html>