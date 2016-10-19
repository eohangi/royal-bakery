<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

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
							<input type="text" name="email" id="email" class="form-control" placeholder="20000원" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="tel" class="col-md-2">주문자*</label>
						<div class="col-md-10">
							<input type="text" name="tel" id="tel" class="form-control" placeholder="이한볅" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="addr1" class="col-md-2">연락처</label>
						<div class="col-md-10">
							<input type="text" name="addr1" id="addr1" class="form-control" placeholder="010-1234-6789" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="addr2" class="col-md-2">결제방법</label>
						<div class="col-md-10">
							<input type="text" name="addr2" id="addr2" class="form-control" placeholder="신용카드" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="addr2" class="col-md-2">결제일시</label>
						<div class="col-md-10">
							<input type="text" name="addr2" id="addr2" class="form-control" placeholder="2016년9월13일13시50분" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="addr2" class="col-md-2">이미지</label>
						<div class="col-md-10">
							<input type="text" name="addr2" id="addr2" class="form-control"
								disabled>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-15">
							<!-- 들여쓰기 -->
							<button id="okay" class="btn btn-primary"><a href="2Admin_reservation.jsp">확인</a></button>
						</div>
					</div>

				</form>
				<!-- 가입폼 끝 -->
			</div>
		</div>
	</div>

<%@ include file = "inc/footer.jsp" %>

</body>

</html>
