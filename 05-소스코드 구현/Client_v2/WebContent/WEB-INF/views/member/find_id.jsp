<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="page-header"></div>

	<div class="Idsearch">
		<div class="IdsearchText">
			<p> <h1><strong>아이디가기억나지않으세요?</strong></h1></p>
			<br /> <br />
			<hr />
			<h3>가입시 입력하셨던 이름과 이메일로</h3>
			<h3>아이디 확인이 가능합니다.</h3>
		</div>
		<hr />
		<br />
		<form method="post" action="${pageContext.request.contextPath}
				/member/FindIdOk.do" class="myform">
			<div class="Search" style="height: 300px;">
				<div class="form-group">
					<label for="mem_name" class="col-md-2">이름*</label>
					<div class="col-md-10 clearfix">
						<input type="text" name="mem_name" id="mem_name"
							class="form-control pull-left"
							style='width: 200px; margin-right: 5px' placeholder="이름을 입력하세요." />
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="col-md-2">이메일*</label>
					<div class="col-md-4 clearfix">
						<input type="email" name="email" id="email" class="form-control"
							placeholder="가입시 기입하셨던 이메일을 입력하세요.">
					</div>
				</div>
				<div class="button">
					<div class="form-group col-md-4 clearfix">
						<button type="submit" class="btn btn-primary btn-block"
							style="float: right;">아이디 찾기</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div style="margin-top: 100px;">
		<%@ include file="/WEB-INF/inc/Footer.jsp"%>
	</div>
</body>

</html>