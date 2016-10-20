<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar2.jsp"%>
	<div class="clientjoin">
		<h1 class="page-header">회원정보수정</h1>

		<!-- 가입폼 시작 -->
		<form class="form-horizontal" id="myform">

			<div class="form-group">
				<label for="mem_id" class="col-md-offset-1 col-md-2">아이디*</label>
				<div class="col-md-9">
					<input type="text" name="mem_id" id="mem_id" class="form-control"
						disabled>
				</div>
			</div>
			<div class="form-group">
				<label for=mem_pw " class="col-md-offset-1 col-md-2">비밀번호*</label>
				<div class="col-md-9">
					<input type="password" name="mem_pw" id="mem_pw"
						class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="mem_pw_re" class="col-md-offset-1 col-md-2">비밀번호
					확인*</label>
				<div class="col-md-9">
					<input type="password" name="mem_pw_re" id="mem_pw_re"
						class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="mem_name" class="col-md-offset-1 col-md-2">이름*</label>
				<div class="col-md-9">
					<input type="text" name="mem_name" id="mem_name" class="form-control"
						disabled>
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-md-offset-1 col-md-2">이메일*</label>
				<div class="col-md-9">
					<input type="text" name="email" id="email" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="phone_no" class="col-md-offset-1 col-md-2">연락처*</label>
				<div class="col-md-9">
					<input type="text" name="phone_no" id="phone_no" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="birthdate" class="col-md-offset-1 col-md-2">생년월일*</label>
				<div class="col-md-9">
					<input type="date" name="birthdate" id="sample2"
						class="form-control" placeholder="yyyy-mm-dd">
				</div>
				<!-- placeholder 는 설명구문 -->
			</div>
			<div class="form-group">
				<label for="gender1" class="col-md-offset-1 col-md-2">성별*</label>
				<div class="col-md-9 clearfix">
					<!-- clearfix 는 마감제 속성 -->
					<input type="text" name="postcode" id="postcode"
						class="form-control pull-left"
						style='width: 120px; margin-right: 5px' placeholder="남자" disabled />
				</div>
			</div>
			<div class="form-group">
				<label for="postcode" class="col-md-offset-1 col-md-2">우편번호</label>
				<div class="col-md-9 clearfix">
					<!-- clearfix 는 마감제 속성 -->
					<input type="text" name="postcode" id="postcode"
						class="form-control pull-left"
						style='width: 120px; margin-right: 5px' /> <input type="button"
						value="우편번호 찾기" class="btn btn-warning"
						onclick='execDaumPostcode("postcode", "addr1", "addr2")'
						style="float: left;" />
				</div>
			</div>
			<div class="form-group">
				<label for="addr1" class="col-md-offset-1 col-md-2">주소</label>
				<div class="col-md-9">
					<input type="text" name="addr1" id="addr1" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="addr2" class="col-md-offset-1 col-md-2">상세주소</label>
				<div class="col-md-9">
					<input type="text" name="addr2" id="addr2" class="form-control">
				</div>
			</div>

			<div class="form-group">
				<div class="col-md-offset-2 col-md-10">
					<!-- 들여쓰기 -->
					<button type="submit" class="btn btn-primary"
						onclick="location.href='MyPage.jsp'">정보수정</button>
					<button type="button" class="btn btn-danger"
						onclick="location.href='MyPage.jsp'">취소</button>
					<button type="button" class="btn btn-danger"
						onclick="location.href='QuitPage.jsp'">탈퇴</button>
				</div>
			</div>

		</form>
		<!-- 가입폼 끝 -->
	</div>


	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>
