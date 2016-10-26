<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>
	
	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	
	
	<div class="page-header"></div>
	<div class="loginB">
		<form name="myform" class="form1" method="POST" 
		action="${pageContext.request.contextPath}/member/LoginOk.do">
			<fieldset>
				<legend>로그인</legend>
			
				<!-- 다음예제에서 반복됩니다. -->
				<div class="form-group">
					<label for="mem_id">아이디</label> 
					<input type="text" id="mem_id" name="mem_id"
						class="form-control login_form" placeholder="아이디를 입력하세요." />
				</div>

				<div class="form-group">
					<label for="mem_pw">비밀번호</label> <input type="password"
						id="mem_pw" class="form-control login_form" 
						name="mem_pw" placeholder="비밀번호를 입력하세요." />
				</div>


				<!--// 여기까지 입니다. -->
				<div class="button">
					<label> <input type="checkbox">자동로그인 사용
					</label>
					<!-- 들여쓰기 -->
					<input type="submit" class="btn btn-primary" value="로그인" />
				</div>
			</fieldset>
		</form>
		<br /> <br />
		<div class="joinB">
			<ul class="joinA">
				<li href="${pageContext.request.contextPath}/Join.do"
					 class="btn btn-warning">회원가입</li>
				<li href="${pageContext.request.contextPath}/FindId.do"
					class="btn btn-info">아이디 찾기</li>
				<li href="${pageContext.request.contextPath}/FindPw.do"
					class="btn btn-info">비밀번호 찾기</li>
			</ul>
		</div>
	</div>


	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>