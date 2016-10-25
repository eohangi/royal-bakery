<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar2.jsp"%>

<!-- 주문제작 상세 페이지 -->
	<div class='page-header'>
		<h1>예약 확인</h1>
	</div>
	<div class="container">

		<div class="row">
			<div class="join">

				<!-- 가입폼 시작 -->
				<form class="form-horizontal" id="myform">

					<div class="form-group">
						<label for="user_id" class="col-md-2">종류*</label>
						<div class="col-md-10">
							<input type="text" name="user_id" id="user_id"
								class="form-control" placeholder="일 반 제 품" disabled>
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
						<label for="addr2" class="col-md-2">결제일시</label>
						<div class="col-md-10">
							<input type="text" name="addr2" id="addr2" class="form-control"
								placeholder="2016년9월13일13시50분" disabled>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<img src="./img/code.jpg">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-15">
							<!-- 들여쓰기 -->
							<button type="submit" class="btn btn-primary">확인</button>
						</div>
					</div>

				</form>
				<!-- 가입폼 끝 -->
			</div>
		</div>
	</div>


	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>