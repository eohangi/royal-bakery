<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/code39.js"></script>

</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar.jsp"%>

	<div class="page-header"></div>
	<div class="container">

		<div class="row">


			<div class="join">
				<h1>주문 완료</h1>
				<hr />
				<!-- 가입폼 시작 -->
				<form class="form-horizontal" id="myform">
					<p>${readOrder.orName}고객님의주문이정상적으로처리되었습니다.</p>
					<p>Royal Bakery를 선택해 주셔서 감사합니다.</p>
					<hr />
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
													<td width="18%" class="text-center">${cart.cuCount}</td>
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

						<a href="${pageContext.request.contextPath}/MainIndex.do">
							<button type="button" class="btn btn-primary">메인으로</button>
						</a> <a
							href="${pageContext.request.contextPath}/product/productBread.do">
							<button type="button" class="btn btn-danger">계속쇼핑하기</button>
						</a>

					</div>


				</form>
				<!-- 가입폼 끝 -->
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>