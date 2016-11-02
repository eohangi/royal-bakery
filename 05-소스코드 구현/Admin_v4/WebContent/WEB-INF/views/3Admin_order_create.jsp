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
$(function(){
	$("#put").click(function(){
			swal({
			  title: "등록",
			  text: "이 제품을 등록 하겠습니까?",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonClass: "btn-primary",
			  confirmButtonText: "등록",
			
			  
			  
			  cancelButtonClass: "btn-danger",
			  cancelButtonText: "취소",
			  closeOnConfirm: false,
			  closeOnCancel: false
			},
			function(isConfirm){
				if(isConfirm){
					location.href="3Admin_order.jsp";
				}else{
					location.href="3Admin_order_create.jsp";
				}
			
			});  
	});
	
	$("#cancel").click(function(){
		swal({
		  title: "취소",
		  text: "이 제품 등록을 취소하겠습니까?",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonClass: "btn-primary",
		  confirmButtonText: "확인",
		
		  
		  
		  cancelButtonClass: "btn-danger",
		  cancelButtonText: "취소",
		  closeOnConfirm: false,
		  closeOnCancel: false
		},
		function(isConfirm){
			if(isConfirm){
				location.href="3Admin_order.jsp";
			}else{
				location.href="3Admin_order_create.jsp";
			}
		
		});  
});
});
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
		<h1>제 품 등 록</h1>
	</div>
	<div class="container">

		<div class="row">
			<div class="join">
				<!-- 가입폼 시작 -->
				<form class="form-horizontal" id="myform">

					<div class="form-group">
						<label for="user_id" class="col-md-2">분 류*</label>
						<fieldset>
							<div>
								<!-- 드롭다운 (싱글타입) -->
								<select name="telecom" id="telecom">
									<option value="normal">주문제품</option>
								</select>
							</div>
						</fieldset>
					</div>
					<div class="form-group">
						<label for=user_pw " class="col-md-2">상 태*</label>
						<fieldset>
							<div>
								<!-- 드롭다운 (싱글타입) -->
								<select name="telecom" id="telecom">
									<option>-----선택하세요-----</option>
									<option value="normal">판매중</option>
									<option value="order">품절</option>
								</select>
							</div>
						</fieldset>
					</div>
					<div class="form-group">
						<label for="user_pw_re" class="col-md-2">상세 분류*</label>
						<fieldset>
							<div>
								<!-- 드롭다운 (싱글타입) -->
								<select name="telecom" id="telecom">
									<option>-----선택하세요-----</option>
									<option value="normal">초</option>
									<option value="order">크림</option>
									<option value="order">토핑</option>
								</select>
							</div>
						</fieldset>
					</div>
					<div class="form-group">
						<label for="name" class="col-md-2">제품명*</label>
						<div class="col-md-10">
							<input type="text" name="name" id="name" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="tel" class="col-md-2">가 격*</label>
						<div class="col-md-10">
							<input type="text" name="tel" id="tel" class="form-control">
						</div>
					</div>

					<div class="form-group">
						<label for="profile_img" class="col-md-2">이미지</label>
						<div class="col-md-10">
							<input type="file" name="profile_img" id="profile_img"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-offset-2 col-md-10">
							<!-- 들여쓰기 -->
							<button type="submit" class="btn btn-primary" id="put">제품등록</button>
							<button type="reset" class="btn btn-danger" id="cancel">취소</button>
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
