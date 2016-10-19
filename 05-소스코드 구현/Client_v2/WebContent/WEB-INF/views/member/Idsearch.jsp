<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar1.jsp"%>
	<div class="page-header"></div>

	<div class="Idsearch">
		<div class="IdsearchText">
			<p1> <strong><아이디가기억나지않으세요?></strong></p1>
			<br /> <br />
			<hr />
			<h1>가입시 입력하셨던 이름과 생년월일로</h1>
			<h2>아이디 확인이 가능합니다.</h2>
		</div>
		<hr />
		<br />

		<div class="Search" style="height: 300px;">
			<div class="form-group">
				<label for="user_name" class="col-md-2">이름*</label>
				<div class="col-md-10 clearfix">
					<input type="text" name="user_name" id="user_name"
						class="form-control pull-left"
						style='width: 200px; margin-right: 5px' placeholder="이름을 입력하세요." />
				</div>
			</div>

			<div class="form-group">
				<label for="user_pw" class="col-md-2">생년월일*</label>
				<div class="col-md-4 clearfix">
					<input type="date" name="birthdate" id="sample2"
						class="form-control" placeholder="yyyy-mm-dd">
				</div>
			</div>
			<div class="button">
				<div class="col-md-4 clearfix">
					<input type="button" value="확  인" class="btn btn-warning"
						onclick="location.href='IdsearchError.jsp'" style="float: right;" />

				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>