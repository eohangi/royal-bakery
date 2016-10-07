<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="inc/Common.jsp"%>
</head>
<body>

	<%@ include file="inc/Header1.jsp"%>

	<div class="Idsearch" >
		<div class="IdsearchText">
			<p1> <strong><비밀번호를잊으셨나요??></strong></p1>
			<br /> <br />
			<hr />
			<h1>가입시 입력하신 아이디, 질문과 답변으로</h1>
			<h2>비밀번호 재설정이 가능합니다.</h2>
		</div>
		<hr />
		<br />

		<div class="Search">
			<div class="form-group">
				<label for="user_name" class="col-md-2">아이디*</label>
				<div class="col-md-4 clearfix">
					<input type="text" name="user_name" id="user_name"
						class="form-control pull-left"
						style='width: 200px; margin-right: 5px' placeholder="아이디를 입력하세요." />
				</div>
			</div>

			<div class="form-group">
				<label for="uaddr2" class="col-md-2">질문</label>
				<fieldset>
					<div class="col-md-4 clearfix">
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
				<label for="user_pw" class="col-md-2">답변*</label>
				<div class="col-md-3 clearfix">
					<input type="text" name="user_name" id="user_name"
						class="form-control pull-left"
						style='width: 200px; margin-right: 5px' placeholder="답변을 입력하세요." />
				</div>
			</div>
			<div class="button">
				<div class="col-md-4 clearfix">
					<input type="button" value="확  인" class="btn btn-warning"
						onclick="location.href='PasswordSearchError.jsp'"
						style="float: right;" />

				</div>
			</div>
		</div>
	</div>

<div style="margin-top: 100px;">
	<%@ include file="inc/Footer.jsp"%>
	</div>
</body>

</html>