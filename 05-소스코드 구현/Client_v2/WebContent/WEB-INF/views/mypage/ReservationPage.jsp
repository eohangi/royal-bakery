<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class='page-header'>
		<h1>구매 내역</h1>
	</div>
	<div class="container">

		<div class="row">
			<div class="join">


					<div class="form-group">
						<label for="user_id" class="col-md-2">종류*</label>
						<div class="col-md-10">
							<input type="text" name="user_id" id="user_id"
								class="form-control" placeholder=${readReservation.id}  disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-md-2">상품내용*</label>
						<div class="col-md-10">
							<input type="text" name="name" id="name" class="form-control"
								placeholder="바게트-1개-10000원  / 크림빵-2개-20000원" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-md-2">총금액*</label>
						<div class="col-md-10">
							<input type="text" name="email" id="email" class="form-control"
								placeholder="20000원" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="tel" class="col-md-2">주문자*</label>
						<div class="col-md-10">
							<input type="text" name="tel" id="tel" class="form-control"
								placeholder="이한볅" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="addr1" class="col-md-2">연락처</label>
						<div class="col-md-10">
							<input type="text" name="addr1" id="addr1" class="form-control"
								placeholder="010-1234-6789" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="addr2" class="col-md-2">결제방법</label>
						<div class="col-md-10">
							<input type="text" name="addr2" id="addr2" class="form-control"
								placeholder="신용카드" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="addr2" class="col-md-2">수령일시</label>
						<div class="col-md-10">
							<input type="text" name="addr2" id="addr2" class="form-control"
								placeholder="2016년9월13일15시30분" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="addr2" class="col-md-2">수령여부</label>
						<div class="col-md-10">
							<input type="text" name="addr2" id="addr2" class="form-control"
								placeholder="수령 완료" disabled>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-15">
							<!-- 들여쓰기 -->
							
							<a href="${pageContext.request.contextPath}/mypage/ReservationList.do?orderCategory=reservation"><button type="submit" class="btn btn-primary">확인</button></a>
						</div>
					</div>

			

			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>
