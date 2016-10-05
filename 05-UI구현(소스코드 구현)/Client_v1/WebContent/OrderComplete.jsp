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

		<div class="row">


			<div class="join">
				<h1>결제 확인</h1>
				<hr />
				<!-- 가입폼 시작 -->
				<form class="form-horizontal" id="myform">
					<p>
						<strong>[주문 정보]</strong>
					</p>
					<hr />
					<div class="form-group">
						<label for="user_id" class="col-md-2">주문자</label>
						<div class="col-md-10">
							<input type="text" name="user_id" id="user_id"
								class="form-control" placeholder="어한기" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-md-2">연락처</label>
						<div class="col-md-10">
							<input type="text" name="name" id="name" class="form-control"
								placeholder="010-3201-0999" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="uaddr2" class="col-md-2">예약 시간</label>
						<fieldset>
							<div class="col-md-4 clearfix">
								<!-- 드롭다운 (싱글타입) -->
								<select name="telecom" id="telecom">
									<option>-----선택하세요-----</option>
									<option value="normal">15분후</option>
									<option value="order">30분후</option>
								</select>
							</div>
						</fieldset>
					</div>
					<div class="form-group">
						<label for="tel" class="col-md-2">주문시 요청사항</label>
						<div class="col-md-10">
							<div class="col-md-10">
								<textarea name="body" id="body" class="Area" rows="4" cols="80"></textarea>
							</div>
						</div>
					</div>
					<hr />
					<p>
						<strong>[결제 수단 선택]</strong>
					</p>
					<hr />
					<div class="form-group">
						<label for="gender1" class="col-md-2">결제수단</label>
						<div class="col-md-8">
							<label class="radio-inline"> <input type="radio"
								name="gender" id="gender1" value="M" /> 신용카드
							</label> <label class="radio-inline"> <input type="radio"
								name="gender" id="gender2" value="F" /> 무통장 입금
							</label>
						</div>
					</div>

					<div class="form-group">
						<div class="button">
							<!-- 들여쓰기 -->
							<button type="button" class="btn btn-primary" onclick="location.href='OrderConfirmation.jsp'">결제하기</button>
							<button type="reset" class="btn btn-danger">취소</button>
						</div>
					</div>

				</form>
				<!-- 가입폼 끝 -->
			</div>
		</div>
	</div>

	<script src="assets/js/jquery-1.10.2.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<%@ include file="inc/Footer.jsp"%>
</body>

</html>
