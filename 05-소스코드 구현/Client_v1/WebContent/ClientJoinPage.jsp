<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="inc/Common.jsp"%>

</head>
<body>

	<%@ include file="inc/Header1.jsp"%>
	<div class="clientjoin">
		<h1 class="page-header">회원가입</h1>

		<!-- 가입폼 시작 -->
		<form class="form-horizontal" id="myform">

			<div class="form-group">
				<label for="user_id" class="col-md-2">아이디*</label>
				<div class="col-md-10 clearfix">
					<input type="text" name="user_id" id="user_id"
						class="form-control pull-left"
						style='width: 120px; margin-right: 5px' /> <input type="button"
						value="중복 확인" class="btn btn-warning" onclick=''
						style="float: left;" />
				</div>
			</div>
			<div class="form-group">
				<label for=user_pw " class="col-md-2">비밀번호*</label>
				<div class="col-md-10">
					<input type="password" name="user_pw" id="user_pw"
						class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="user_pw_re" class="col-md-2">비밀번호 확인*</label>
				<div class="col-md-10">
					<input type="password" name="user_pw_re" id="user_pw_re"
						class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-md-2">이름*</label>
				<div class="col-md-10">
					<input type="text" name="name" id="name" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-md-2">이메일*</label>
				<div class="col-md-10">
					<input type="text" name="email" id="email" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="tel" class="col-md-2">연락처*</label>
				<div class="col-md-10">
					<input type="text" name="tel" id="tel" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="birthdate" class="col-md-2">생년월일*</label>
				<div class="col-md-10">
					<input type="date" name="birthdate" id="sample2"
						class="form-control" placeholder="yyyy-mm-dd">
				</div>
				<!-- placeholder 는 설명구문 -->
			</div>
			<div class="form-group">
				<label for="gender1" class="col-md-2">성별*</label>
				<div class="col-md-10">
					<label class="radio-inline"> <input type="radio"
						name="gender" id="gender1" value="M" /> 남자
					</label> <label class="radio-inline"> <input type="radio"
						name="gender" id="gender2" value="F" /> 여자
					</label>
				</div>
			</div>
			<div class="form-group">
				<label for="postcode" class="col-md-2">우편번호</label>
				<div class="col-md-10 clearfix">
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
				<label for="addr1" class="col-md-2">주소</label>
				<div class="col-md-10">
					<input type="text" name="addr1" id="addr1" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="addr2" class="col-md-2">상세주소</label>
				<div class="col-md-10">
					<input type="text" name="addr2" id="addr2" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for=uaddr2 " class="col-md-2">질문</label>
				<fieldset>
					<div>
						<!-- 드롭다운 (싱글타입) -->
						<select name="telecom" id="telecom">
							<option>-----선택하세요-----</option>
							<option value="normal">가장 존경하는 인물은?</option>
							<option value="order">어머니의 고향은?</option>
							<option value="order">아버지의 고향은?</option>
						</select>
					</div>
				</fieldset>
			</div>
			<div class="form-group">
				<label for="addr2" class="col-md-2">답변</label>
				<div class="col-md-10">
					<input type="text" name="addr2" id="addr2" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-offset-2 col-md-10">
					<!-- 들여쓰기 -->
					<button type="button" class="btn btn-primary" onclick="location.href='LoginPage.jsp'" >회원가입</button>
					<button type="button" class="btn btn-danger" onclick="location.href='LoginPage.jsp'">취소</button>
				</div>
			</div>

		</form>
		<!-- 가입폼 끝 -->
	</div>


	<%@ include file="inc/Footer.jsp"%>
</body>

</html>

