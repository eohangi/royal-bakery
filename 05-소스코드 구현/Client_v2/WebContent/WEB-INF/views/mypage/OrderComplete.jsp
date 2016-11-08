<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="page-header"></div>
	<div class="container">

		<div class="row">


			<div class="join">
				<h1>결제 확인</h1>
				<hr />
				<!-- 가입폼 시작 -->
				<form class="form-horizontal" method="post"
					action="${pageContext.request.contextPath}/mypage/OrderCompleteOk.do">
					<p>
						<strong>[주문 정보]</strong>
					</p>
					<hr />
					<div class="form-group">
						<label for="OrderName" class="col-md-2">주문자</label>
						<div class="col-md-10">
							<input type="text" name="OrderName" id="OrderName"
								class="form-control" value="${OrderName}" readonly>
							<div class="col-md-10">
								<c:choose>
									<c:when test="${fn:length(cartlist) > 0}">
										<c:forEach var="cart" items="${cartlist}">
											<input type="hidden" name="ProName" class="form-control"
												value="${cart.proName}">
										</c:forEach>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${fn:length(cartlist2) > 0}">
										<c:forEach var="cart2" items="${cartlist2}">
											<input type="hidden" name="cuText" class="form-control"
												value="${cart2.cuText}">
										</c:forEach>
									</c:when>
								</c:choose>
							</div>

						</div>
					</div>
						<div class="form-group">
							<label for="tel" class="col-md-2">연락처</label>
							<div class="col-md-10">
								<input type="text" name="tel" id="tel" class="form-control"
									value="${OrderTel}" readonly>
							</div>
						</div>

						<div class="form-group">
							<label for="time" class="col-md-2">예약 시간</label>
							<fieldset>
								<div class="col-md-4 clearfix">
									<!-- 드롭다운 (싱글타입) -->
									<select name="time" id="time">
										<option>-----선택하세요-----</option>
										<option value="normal">15분후</option>
										<option value="order">30분후</option>
									</select>
								</div>
							</fieldset>
						</div>
						<div class="form-group">
							<label for="totalPrice" class="col-md-2">가격</label>
							<div class="col-md-10">
								<input type="text" name="totalPrice" id="totalPrice"
									class="form-control" value="${totalPrice}" readonly>
							</div>
						</div>

						<hr />
						<p>
							<strong>[결제 수단 선택]</strong>
						</p>
						<hr />
						<div class="form-group">
							<label for="paytype" class="col-md-2">결제수단</label>
							<div class="col-md-8">
								<label class="radio-inline"> <input type="radio"
									name="paytype" id="paytype" value="M" /> 신용카드
								</label> <label class="radio-inline"> <input type="radio"
									name="paytype" id="paytype" value="F" /> 무통장 입금
								</label>
							</div>
						</div>
						<hr />
						<div class="form-group">

							<!-- 들여쓰기 -->
							<button type="submit" class="btn btn-default">주문하기</button>
							<button type="button" class="btn btn-danger"
								onclick="history.back();">취소</button>

						</div>
				</form>
			</div>
			<!-- 가입폼 끝 -->
		</div>
	</div>
	</div>

	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>
