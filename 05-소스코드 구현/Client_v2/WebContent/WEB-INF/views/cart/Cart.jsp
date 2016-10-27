<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar.jsp"%>

	<div class="container">

		<div class="col-md-2" id="slide1">
			<h1></h1>
		</div>


		<!-- 페이지 내용 영역(김양수 수정내용)-->
		<div class="col-md-8" Id="content">
			<!-- 페이지에서 보여지는 전체의 내용을 감싸는 박스 -->
			<div class="mypage-container">

				<!-- 해당 페이지의 이름을 보여주는 내용을 감싸는 박스 -->
				<div class="page-name">
					<h3>
						<strong>｜장바구니</strong>
					</h3>
				</div>
				<!-- /해당 페이지의 이름을 보여주는 내용을 감싸는 박스 -->




				<!-- 페이지 이름 아래로 표시되는 모든 내용을 감싸는 박스-->
				<div class="inner-content">


					<!--마이 페이지 안내 메시지를 감싸는 상단의 박스-->
					<!-- 없음 -->
					<!-- /마이 페이지 안내 메시지를 감싸는 상단의 박스-->


					<!-- 페이지에 들어갈 2가지 메뉴시작-->
					<ul class="myquestionlist">
						<li class="table list-unstyled">
							<table class="table table-hover">
								<thead style="background-color: #eee">
									<tr align="center">
										<td width="10%">전체선택<br /> <input type="checkbox"
											value="담기"></td>
										<td width="18%" align="center">상 품</td>
										<td width="18%" align="center">수 량</td>
										<td width="18%" align="center">가 격</td>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${fn:length(cartlist) > 0}">
											<c:forEach var="cart" items="${cartlist}">
												<tr align="center">
													<td><input type="checkbox" value="담기"></td>
													<td width="18%" class="text-center">${cart.proName}</td>
													<td width="18%" class="text-center">${cart.proCount}</td>
													<td width="18%" class="text-center">${cart.proPrice}</td>
												</tr>
											</c:forEach>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${fn:length(cartlist2) > 0}">
											<c:forEach var="cart" items="${cartlist2}">
												<tr align="center">
													<td><input type="checkbox" value="담기"></td>
													<td width="18%" class="text-center">${cart.cuText}</td>
													<td width="18%" class="text-center"></td>
													<td width="18%" class="text-center">${cart.cuPrice}</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="5" class="text-center"
													style="line-height: 100px;">조회된 글이 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</li>
					</ul>

					<ul class="cart_button" style="height: 40px;">

						<p class="continue pull-right btn-lg" id="continue">
							<input type="button" class="btn btn-default" value="주문하기"
								onclick="location.href='OrderComplete.jsp'">
						</p>

						<p class="orderall pull-right btn-lg" id="orderall">
							<input type="button" class="btn btn-default" value="계속 쇼핑하기"
								onclick="location.href='bread.jsp'">
						</p>

						<p class="remove pull-left btn-lg" id="remove">
							<input type="button" class="btn btn-default" value="선택 삭제"
								onclick="location.href='#'">
						</p>

					</ul>
					<!-- /페이지에 들어갈 2가지 메뉴시작-->



				</div>
				<!-- /페이지 이름 아래로 표시되는 모든 내용을 감싸는 박스-->
			</div>
			<!-- /페이지에서 보여지는 전체의 내용을 감싸는 박스 -->
		</div>


		<div class="col-md-2" id="slide2">
			<h3></h3>
		</div>
	</div>

	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>