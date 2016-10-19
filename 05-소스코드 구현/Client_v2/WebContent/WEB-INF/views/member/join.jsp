<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>

</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar1.jsp"%>
	<div class="clientjoin">
		<h1 class="page-header">회원가입</h1>

		<!-- 가입폼 시작 -->
		<form class="form-horizontal" id="myform" name="myform" method="post"
			action="${pageContext.request.contextPath}/member/JoinOk.do">

			<div class="form-group">
				<label for="mem_id" class="col-md-2">아이디*</label>
				<div class="col-md-10 clearfix">
					<input type="text" name="mem_id" id="mem_id"
						class="form-control pull-left"
						style='width: 120px; margin-right: 5px' />
					<button class="btn btn-primary pull-left" id="myform">중복구현할것</button>
				</div>
			</div>
			<div class="form-group">
				<label for='"mem_pw"' class="col-md-2">비밀번호*</label>
				<div class="col-md-10">
					<input type="password" name="mem_pw" id="mem_pw"
						class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for='mem_pw_re' class="col-md-2">비밀번호 확인*</label>
				<div class="col-md-10">
					<input type="password" name="mem_pw_re" id="mem_pw_re"
						class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for='mem_name' class="col-md-2">이름*</label>
				<div class="col-md-10">
					<input type="text" name="mem_name" id="mem_name" class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for='email' class="col-md-2">이메일*</label>
				<div class="col-md-10">
					<input type="email" name="email" id="email" class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for='phone_no' class="col-md-2">연락처*</label>
				<div class="col-md-10">
					<input type="tel" name="phone_no" id="phone_no" class="form-control"
						placeholder="'-'없이 입력" />
				</div>
			</div>

			<div class="form-group">
				<label for='birthdate' class="col-md-2">생년월일*</label>
				<div class="col-md-10">
					<input type="date" name="birthdate" id="birthdate"
						class="form-control" placeholder="yyyy-mm-dd" />
				</div>
			</div>

			<div class="form-group">
				<label for='gender1' class="col-md-2">성별*</label>
				<div class="col-md-10">
					<label class="radio-inline pull-left"><input type="radio"
						name="gender" id="gender1" value="M" />남자</label> <label
						class="radio-inline pull-left"><input type="radio"
						name="gender" id="gender2" value="F" />여자</label>
				</div>
			</div>

			<div class="form-group">
				<label for='postcode' class="col-md-2">우편번호</label>
				<div class="col-md-10 clearfix">
					<input type="text" name="postcode" id="postcode"
						class="form-control pull-left"
						style='width: 120px; margin-right: 5px' />
					<!-- 클릭 시, Javascript 함수 호출 : openDaumPostcode() -->
					<input type='button' value='우편번호 찾기'
						class='btn btn-warning pull-left'
						onclick='execDaumPostcode("postcode", "addr1", "addr2")' />

				</div>
			</div>

			<div class="form-group">
				<label for='addr1' class="col-md-2">주소</label>
				<div class="col-md-10">
					<input type="text" name="addr1" id="addr1" class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for='addr2' class="col-md-2">상세주소</label>
				<div class="col-md-10">
					<input type="text" name="addr2" id="addr2" class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<div class="col-md-offset-2 col-md-10">
					<button type="submit" class="btn btn-primary">가입하기</button>
					<button type="reset" class="btn btn-danger">다시작성</button>
				</div>
			</div>
		</form>
		<!-- 가입폼 끝 -->
	</div>


	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>

