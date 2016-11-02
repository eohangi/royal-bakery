<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/inc/head.jsp"%>

<script type="text/javascript">
	$(function() {
		$("#delete").click(function() {
			swal({
				title : "삭제",
				text : "이 회원을 삭제 하겠습니까?",
				type : "warning",
				showCancelButton : true,
				confirmButtonClass : "btn-primary",
				confirmButtonText : "삭제",

				cancelButtonClass : "btn-danger",
				cancelButtonText : "취소",
				closeOnConfirm : false,
				closeOnCancel : false
			}, function(isConfirm) {
				if (isConfirm) {
					location.href = "1Admin_client_info.jsp";
				} else {
					location.href = "1Admin_client_info_detail.jsp";
				}

			});
		});
	});
</script>


<style type="text/css">
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
</style>
</head>
<body>
	<%@ include file="Header.jsp"%>
	<div class='page-header'>
		<h1>회원 정보</h1>
	</div>
	<div class="container">

		<div class="row">
			<div class="join">

				<!-- 가입폼 시작 -->
				<form class="form-horizontal" id="myform">

					<div class="form-group">
						<label for="user_id" class="col-md-2">아이디*</label>
						<div class="col-md-10">
							<input type="text" name="user_id" id="user_id"
								class="form-control" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-md-2">이름*</label>
						<div class="col-md-10">
							<input type="text" name="name" id="name" class="form-control"
								placeholder="이한볅" disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-md-2">이메일*</label>
						<div class="col-md-10">
							<input type="text" name="email" id="email" class="form-control"
								disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="tel" class="col-md-2">연락처*</label>
						<div class="col-md-10">
							<input type="text" name="tel" id="tel" class="form-control"
								disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="birthdate" class="col-md-2">생년월일*</label>
						<div class="col-md-10">
							<input type="date" name="birthdate" id="sample2"
								class="form-control" placeholder="yyyy-mm-dd" disabled>
						</div>
						<!-- placeholder 는 설명구문 -->
					</div>
					<div class="form-group">
						<label for="gender1" class="col-md-2">성별*</label>
						<div class="col-md-10 clearfix">
							<!-- clearfix 는 마감제 속성 -->
							<input type="text" name="postcode" id="postcode"
								class="form-control pull-left"
								style='width: 120px; margin-right: 5px' placeholder="남자"
								disabled />
						</div>
					</div>
					<div class="form-group">
						<label for="postcode" class="col-md-2">우편번호</label>
						<div class="col-md-10 clearfix">
							<!-- clearfix 는 마감제 속성 -->
							<input type="text" name="postcode" id="postcode"
								class="form-control pull-left"
								style='width: 120px; margin-right: 5px' disabled />
						</div>
					</div>
					<div class="form-group">
						<label for="addr1" class="col-md-2">주소</label>
						<div class="col-md-10">
							<input type="text" name="addr1" id="addr1" class="form-control"
								disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="addr2" class="col-md-2">상세주소</label>
						<div class="col-md-10">
							<input type="text" name="addr2" id="addr2" class="form-control"
								disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="addr2" class="col-md-2">질문</label>
						<div class="col-md-10">
							<input type="text" name="addr2" id="addr2" class="form-control"
								disabled>
						</div>
					</div>
					<div class="form-group">
						<label for="addr2" class="col-md-2">답변</label>
						<div class="col-md-10">
							<input type="text" name="addr2" id="addr2" class="form-control"
								disabled>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-offset-2 col-md-10">
							<!-- 들여쓰기 -->
							<button type="button" class="btn btn-primary"
								onclick="location.href='1Admin_client_info.jsp'">확인</button>
							<button type="reset" class="btn btn-danger" id="delete">삭제</button>
						</div>
					</div>

				</form>
				<!-- 가입폼 끝 -->
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/inc/footer.jsp"%>

</body>

</html>
