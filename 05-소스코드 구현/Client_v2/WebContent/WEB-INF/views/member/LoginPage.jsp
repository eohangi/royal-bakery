<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>
	
	<%@ include file="/WEB-INF/inc/topbar1.jsp"%>
	
	
	<div class="page-header"></div>
	<div class="loginB">
		<form class="form1"  method="POST" action="MainIndex2.jsp">
			<fieldset>
				<legend>로그인</legend>
			
				<!-- 다음예제에서 반복됩니다. -->
				<div class="form-group">
					<label for="user_id">아이디</label> <input type="text" id="user_id"
						class="form-control login_form" placeholder="아이디를 입력하세요." />
				</div>

				<div class="form-group">
					<label for="user_pw">비밀번호</label> <input type="password"
						id="user_pw" class="form-control login_form" placeholder="비밀번호를 입력하세요." />
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
			<form class="joinA">
				<button type="button" class="btn btn-primary" onclick="location.href='ClientJoinPage.jsp'">회원가입</button>
				<button type="button" class="btn btn-primary" onclick="location.href='Idsearch.jsp'">아이디 찾기</button>
				<button type="button" class="btn btn-danger" onclick="location.href='Passwordsearch.jsp'">비밀번호 찾기</button>
			</form>
		</div>
	</div>


	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>