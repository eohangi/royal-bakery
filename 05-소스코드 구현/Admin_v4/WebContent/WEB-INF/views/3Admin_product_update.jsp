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
	$("#change").click(function(){
			swal({ 
			  title: "등록",
			  text: "이 제품을 수정 하겠습니까?",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonClass: "btn-primary",
			  confirmButtonText: "수정",
			
			  
			  
			  cancelButtonClass: "btn-danger",
			  cancelButtonText: "취소",
			  closeOnConfirm: false,
			  closeOnCancel: false,
			  debug:true
			},
			function(isConfirm){
				if(isConfirm){
					location.href="3Admin_order.jsp";
				}else{
					location.href="3Admin_order_update.jsp";
				}
			
			});  
	});
	
	
	$("#delete").click(function(){
		swal({
		  title: "삭제",
		  text: "이 제품을 삭제하겠습니까?",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonClass: "btn-primary",
		  confirmButtonText: "삭제",
		
		  
		  
		  cancelButtonClass: "btn-danger",
		  cancelButtonText: "취소",
		  closeOnConfirm: false,
		  closeOnCancel: false
		},
		function(isConfirm){
			if(isConfirm){
				location.href="3Admin_order.jsp";
			}else{
				location.href="3Admin_order_update.jsp";
			}
		
		});  
});
	
	$("#cancel").click(function(){
		swal({
		  title: "취소",
		  text: "제품 수정을 취소하겠습니까?",
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
				location.href="3Admin_order_update.jsp";
			}
		
		});  
});
});
</script>

<style type="text/css">

<%@ include file = "css/common.css" %>

.join {
	margin: auto;
	align: center;
	width: 70%;
	text-align: center;
	align: center;
}

.page-header {
	text-align: center;
}

.form-group2 {
	align: center;
	padding-bottom: 50px;
}

</style>
</head>
<body>
<%@ include file = "Header.jsp" %>
	<div class='page-header'>
		<h1>제 품 수 정</h1>
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
								<select name="telecom" id="telecom" disabled>
									<option value="normal">일반제품</option>
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
								<select name="telecom" id="telecom" disabled>
									<option>-----선택하세요-----</option>
									<option value="normal">쿠키</option>
									<option value="order">빵</option>
									<option value="order">케이크</option>
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
						<label for="email" class="col-md-2">제품 설명*</label>
						<div class="col-md-10">
							<input type="text" name="email" id="email" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="tel" class="col-md-2">가 격*</label>
						<div class="col-md-10">
							<input type="text" name="tel" id="tel" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="birthdate" class="col-md-2">수 량*</label>
						<div class="col-md-10">
							<input type="text" name="tel" id="tel" class="form-control">
						</div>
						<!-- placeholder 는 설명구문 -->
					</div>

					<hr color="black">
					<strong>< 영양성분 > </strong>
					<hr color="black">

					<div class="form-group">
						<label for="gender1" class="col-md-2">열량(kcal)*</label>
						<div class="col-md-10">
							<input type="text" name="tel" id="tel" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="gender1" class="col-md-2">당류 (g)*</label>
						<div class="col-md-10">
							<input type="text" name="tel" id="tel" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="gender1" class="col-md-2">단 백 질(g/%)*</label>
						<div class="col-md-10">
							<input type="text" name="tel" id="tel" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="addr1" class="col-md-2">포 화 지 방(g/%)*</label>
						<div class="col-md-10">
							<input type="text" name="addr1" id="addr1" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="addr2" class="col-md-2">나 트 륨 (mg/%)</label>
						<div class="col-md-10">
							<input type="text" name="addr2" id="addr2" class="form-control">
						</div>
					</div>
					<hr color="black">
					<div class="form-group">
						<label for="profile_img" class="col-md-2">이미지</label>
						<div class="col-md-10">
							<input type="file" name="profile_img" id="profile_img"
								class="form-control">
						</div>
					</div>
					<div class="form-group2">
						<div class="col-md-12">
							<!-- 들여쓰기 -->
							<button type="submit" class="btn btn-primary" id="change">수정 완료</button>
							<button type="submit" class="btn btn-primary" id="delete">삭  제</button>
							<button type="reset" class="btn btn-danger" id="cancel">취  소</button>
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
