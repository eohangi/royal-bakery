<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="inc/Common.jsp"%>
</head>
<body>

	<%@ include file="inc/Header1.jsp"%>
	<div class="page-header"></div>
	<div class="Idsearch">
		<div class="IdsearchText">
			<p1> <strong><안녕하세요. 이한볅 님></strong></p1>
			<br /> <br />
			<hr />
			<h1>새로운 비밀번호를 입력해 주세요.</h1>
		</div>
		<hr />
		<br />

		<div class="Search">
			<div class="form-group">
				<label for="user_name" class="col-md-2"></label>
				<div class="col-md-10 clearfix">
					<input type="text" name="user_name" id="user_name"
						class="form-control pull-left"
						style='width: 300px; margin-right: 5px'
						placeholder="새로운 비밀번호를 입력하세요." />
				</div>
			</div>

			<div class="form-group">
				<label for="user_pw" class="col-md-2"></label>
				<div class="col-md-10 clearfix">
					<input type="text" name="user_name" id="user_name"
						class="form-control pull-left"
						style='width: 300px; margin-right: 5px' placeholder="다시한번 입력해주세요." />
				</div>
			</div>
			<div class="button">
				<div class="col-md-8 clearfix">
					<input type="button" value="확 인" class="btn btn-warning" onclick="location.href='NewPasswordSetComplete.jsp'"
						style="float: right;" />

				</div>
			</div>
		</div>
	</div>


	<script src="assets/js/jquery-1.10.2.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<%@ include file="inc/Footer.jsp"%>
</body>

</html>
