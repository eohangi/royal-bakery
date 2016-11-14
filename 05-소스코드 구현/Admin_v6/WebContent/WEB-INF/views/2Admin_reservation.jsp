<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>

<%@ include file="/WEB-INF/inc/topbar.jsp"%>
<style type="text/css">

	/**  header*/ .header {
	padding-top: 70px;
}

.form-group {
	
}

.product {
	float: right;
}

/** table */
.table-responsive {
	padding-top: 40px;
}

.table-striped>tbody>tr:nth-child(odd)>td, .table-striped>tbody>tr:nth-child(odd)>th
	{
	background-color: white !important;
}

.table-striped>tbody>tr:hover>td, .table-striped>tbody>tr:hover>th {
	background-color: orange !important;
}

.pagination {
	margin: 0;
}
</style>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="header">
				<div class="clearfix">
					<h1 class="page-header pull-left col-md-offset-1">주문 내역</h1>
				</div>
				<div class="search col-md-offset-10">
					<form action="${pageContext.request.contextPath}/Reservation.do"
						method="get" style="width: 200px">
						<input type="hidden" name="orderCategory" value="${orderCategory}" />
						<div class="input-group">
							<input type="text" name="keyword" class="form-control"
								placeholder="구매자 검색" value="${keyword}" /> <span
								class="input-group-btn">
								<button type="submit" class="btn btn-primary">검색</button>
							</span>
						</div>
					</form>
				</div>

			</div>
			<!-- 페이지 내용 영역 -->
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th class="text-center">번호</th>
							<th class="text-center">종류</th>
							<th class="text-center">상품 내용</th>
							<th class="text-center">주문자</th>
							<th class="text-center">결제금액</th>
							<th class="text-center">결제일</th>
							<th class="text-center">확인</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(reservationList)>0}">
								<c:forEach var="reservation" items="${reservationList}">
									<tr>
										<td class="text-center">${reservation.id}</td>
										<td class="text-center">${reservation.orderNo}</td>
										<td><c:url var="reservationUrl"
												value="/ReservationDetail.do">
												<c:param name="OrderCategory"
													value="${reservation.orderCategory}" />
												<c:param name="OrderNo" value="${reservation.orderNo}" />
												<c:param name="OrderId" value="${reservation.memberId}" />
											</c:url> <a href="${reservationUrl}">${reservation.orTitle}</a></td>
										<td class="text-center">${reservation.orName}</td>
										<td class="text-center">${reservation.totalSum}</td>
										<td class="text-center">${reservation.orRegDate}</td>
										<td class="text-center">
											<a href="${pageContext.request.contextPath}/ReservationOk.do?order_no=${reservation.orderNo}&orderCategory=${reservation.orderCategory}"><button>버튼</button></a>
										</td>
									</tr>
								</c:forEach>

							</c:when>

							<c:otherwise>
								<tr>
									<td class="text-center" colspan="6" style="line-height: 100px;">조회된
										글이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>

					</tbody>
				</table>
			</div>
			<!-- 페이지 번호 시작 -->
			<nav class="text-center">
				<ul class="pagination">
					<!-- 이전 그룹으로 이동 -->
					<c:choose>
						<c:when test="${pageHelper.prevPage > 0}">
							<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
							<!-- 이전 그룹으로 이동하기 위한 URL을 생성해서 "prevUrl"에 저장 -->
							<c:url var="prevUrl" value="/Reservation.do">
								<c:param name="orderCategory" value="${orderCategory}"></c:param>
								<c:param name="keyword" value="${keyword}"></c:param>
								<c:param name="page" value="${pageHelper.prevPage}"></c:param>
							</c:url>

							<li><a href="${prevUrl}">&laquo;</a></li>
						</c:when>

						<c:otherwise>
							<!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
							<li class='disabled'><a href="#">&laquo;</a></li>
						</c:otherwise>
					</c:choose>

					<!-- 페이지 번호 -->
					<!-- 현재 그룹의 시작페이지~끝페이지 사이를 1씩 증가하면서 반복 -->
					<c:forEach var="i" begin="${pageHelper.startPage}"
						end="${pageHelper.endPage}" step="1">

						<!-- 각 페이지 번호로 이동할 수 있는 URL을 생성하여 page_url에 저장 -->
						<c:url var="pageUrl" value="/Reservation.do">
							<c:param name="orderCategory" value="${orderCategory}"></c:param>
							<c:param name="keyword" value="${keyword}"></c:param>
							<c:param name="page" value="${i}"></c:param>
						</c:url>

						<!-- 반복중의 페이지 번호와 현재 위치한 페이지 번호가 같은 경우에 대한 분기 -->
						<c:choose>
							<c:when test="${pageHelper.page == i}">
								<li class='active'><a href="#">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageUrl}">${i}</a></li>
							</c:otherwise>
						</c:choose>

					</c:forEach>

					<!-- 다음 그룹으로 이동 -->
					<c:choose>
						<c:when test="${pageHelper.nextPage > 0}">
							<!-- 다음 그룹에 대한 페이지 번호가 존재한다면? -->
							<!-- 다음 그룹으로 이동하기 위한 URL을 생성해서 "nextUrl"에 저장 -->
							<c:url var="nextUrl" value="/Reservation.do">
								<c:param name="orderCategory" value="${orderCategory}"></c:param>
								<c:param name="keyword" value="${keyword}"></c:param>
								<c:param name="page" value="${pageHelper.nextPage}"></c:param>
							</c:url>

							<li><a href="${nextUrl}">&raquo;</a></li>
						</c:when>

						<c:otherwise>
							<!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
							<li class='disabled'><a href="#">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
			<!--// 페이지 번호 끝 -->


		</div>
	</div>

		<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>

</html>