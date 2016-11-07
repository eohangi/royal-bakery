<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<html>
<head>
<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>

<style type="text/css">
.a{
	
	text-decoration: none;
	color: #222;
	
}

.a:hover {

	text-decoration: none;
	color: #222;
}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar.jsp"%>

	<div class="container">

		<div class="col-md-2" id="slide1">
			<h1>슬라이드1</h1>
		</div>



		<!-- 페이지 내용 영역(김양수 수정내용)-->
		<div class="col-md-8" style="padding-bottom:20px; " id="content">
			<div class="mypage-container clearfix">
				<div class="page-namer">
					<h1>
						<strong>｜My Page</strong>
					</h1>
				</div>
				<div class="myinner-content ">
					<!--마이 페이지 내에 4가지 영역을 감싸는 컨텐트-->
					<div class="myinner-content-info">
						<p>
						<h3 >안녕하세요.${login} 고객님</h3>
						</p>
						<p>
						<h5>마이페이지에서는 고객님의 활동 내역 및 정보를 확인할 수 있습니다.</h5>
						</p>
					</div>
					<div class="clearfix">
					<!-- 페이지에 들어갈 4가지 메뉴시작-->
					<ul class="myinner-content-container " id="boxbody">
					
						<li class="mybox " style="width:22%;" id="mybox" >
						<a href="${pageContext.request.contextPath}/mypage/UpdateInfo.do" class="a">

							<p>
								<img style="width: 40px; height: 40px;"
									src="${pageContext.request.contextPath}/assets/img/search.png">
							</p>
							<p >
							<h4><font color="#054931"><strong>개인정보 수정<strong></font></h4>
							</p>
							<p>
							<h6>본인확인 후에  <br/>정보변경이 가능합니다.</h6>
							</p>
							</a>
						</li>
						<li class="mybox " style="width:22%;" id="mybox" >
						<a href="${pageContext.request.contextPath}/cart/CartView.do" class="a">
							<p>
								<img style="width: 40px; height: 40px;"
									src="${pageContext.request.contextPath}/assets/img/search.png">
							</p>
							<p>
							<h4><font color="#054931"><strong>장바구니<strong></font></h4>
							</p>
							<p>
							<h6>고객님의 담으신 상품을  <br/>확인 할 수 있습니다.</h6>
							</p>
							</a>
						</li>
						
						<li class="mybox " style="width:22%;" id="mybox">
						<a href="${pageContext.request.contextPath}/mypage/mypayment.do" class="a">
							<p>
								<img style="width: 40px; height: 40px;"
									src="${pageContext.request.contextPath}/assets/img/search.png">
							</p>
							<p>
							<h4><font color="#054931"><strong>결제확인<strong></font></h4>
							</p>
							<p>
							<h6>고객님이 결제하신 상품을 <br/> 확인할 수 있습니다.</h6>
							</p>
							</a>
						</li>
						<li class="mybox " style="width:22%;" id="mybox">
						<a href="${pageContext.request.contextPath}/bbs.qna/document_list.do" class="a">
								<p>
									<img style="width: 40px; height: 40px;"
										src="${pageContext.request.contextPath}/assets/img/search.png">
								</p>
								<p>
								<h4><font color="#054931"><strong>상담내역<strong></font></h4>
								</p>
								<p>
								<h6>상담한 내역을 <br/>확인 할 수 있습니다.</h6>
								</p>
						</a></li>
						
					</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-2" style="padding-bottom:20px;" id="slide2">
			<h3>슬라이드2</h3>
		</div>
		
	</div>
<!-- 하단 footer -->
	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
	
</body>

</html>