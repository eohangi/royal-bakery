<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>Royal</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

<!-- Optional theme -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" />

<script src="http://code.jquery.com/jquery.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- jQuery Framework 참조하기 -->
<script src="http://code.jquery.com/jquery.min.js"></script>


<link rel="stylesheet" href="plugins/sweetalert/sweetalert.css" />

<script src="plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/code39.js"></script>


<script type="text/javascript">


</script>

<style type="text/css">

<%@ include file = "css/common.css" %>

.join {
	margin: auto; align : center;
	width: 70%;
	text-align: center;
	align: center;
}

.page-header {
	text-align: center;
}


</style>
</head>
<body>
	<%@ include file = "Header.jsp" %>
	<div class='page-header'>
		<h1>예약 상세 정보</h1>
	</div>
<div class="container">

		<div class="row">


			<div class="join">
				
				<!-- 가입폼 시작 -->
				<form class="form-horizontal" id="myform">
			
					<div class="form-group row">
						<label for="user_id" class="col-md-2">상품 정보</label>
						<div class="col-md-10">
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="text-center">품명</th>
										<th class="text-center">수량</th>
										<th class="text-center">가격</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${fn:length(cartlist) > 0}">
											<c:forEach var="cart" items="${cartlist}">
												<tr align="center">	
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
													<td width="18%" class="text-center">${cart.cuText}</td>
													<td width="18%" class="text-center"></td>
													<td width="18%" class="text-center">${cart.cuPrice}</td>
												</tr>
											</c:forEach>
										</c:when>
										
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>

					
					<div class="form-group">
						<label for="OrderName" class="col-md-2">주문자</label>
						<div class="col-md-10">
							<input type="text" name="OrderName" id="OrderName"
								class="form-control" placeholder="${readOrder.orName}" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-md-2">주문일시</label>
						<div class="col-md-10">
							<input type="text" name="name" id="name" class="form-control"
								placeholder="${readOrder.orRegDate}" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-md-2">결제방법</label>
						<div class="col-md-10">
							<input type="text" name="name" id="name" class="form-control"
								placeholder="${type}" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="Time" class="col-md-2">수령시간</label>
						<div class="col-md-10">
							<input type="text" name="Time" id="Time" class="form-control"
								placeholder="${Time}" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-md-2">결제금액</label>
						<div class="col-md-10">
							<input type="text" name="name" id="name" class="form-control"
								placeholder="${readOrder.totalSum}" disabled>
						</div>
					</div>
					<hr />
					<p>생성된 바코드로 매장에서 주문 수령 가능합니다.</p>
					<hr />
					<!-- ---------------------------------------------- -->
					<div class="col-md-offset-3 col-md-10 col-sm-12">
						<div id="externalbox" style="width: 5in;">
							<!--  랜덤 숫자값 -->
							<div id="inputdata">${readOrder.barcode}</div>
						</div>

						<script type="text/javascript">
							/* <![CDATA[ */
							function get_object(id) {
								var object = null;
								if (document.layers) {
									object = document.layers[id];
								} else if (document.all) {
									object = document.all[id];
								} else if (document.getElementById) {
									object = document.getElementById(id);
								}
								return object;
							}
							get_object("inputdata").innerHTML = DrawCode39Barcode(
									get_object("inputdata").innerHTML, 1);
							/* ]]> */
						</script>

						<!-------------------------------------------------->
					</div>

					<br />

					<div class="button">
						<!-- 들여쓰기 -->
						<button type="button" class="btn btn-default">
							<a href="${pageContext.request.contextPath}/Reservation.do?orderCategory=reservation">확인</a></button>

					</div>


				</form>
				<!-- 가입폼 끝 -->
			</div>
		</div>
	</div>

<%@ include file = "inc/footer.jsp" %>

</body>

</html>
