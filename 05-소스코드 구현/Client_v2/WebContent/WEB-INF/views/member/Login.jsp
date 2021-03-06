<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="page-header"
	><h1><font color="#f26b24">Login Member</font></h1></div>
	<div class="loginB" >
		<form name="myform" class="form1" method="POST" 
		action="${pageContext.request.contextPath}/member/LoginOk.do">
			<fieldset>
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
				<div class="button pull-left">
					<label> <input type="checkbox">자동로그인 사용
					</label>
					<!-- 들여쓰기 -->
					<input type="submit" class="btn btn-primary" value="로그인" />
				</div>
			</fieldset>
		</form>
		<div class="joinB">
			<span class="joinA pull-left style=">
				<a type="button" href="${pageContext.request.contextPath}/member/Join.do"
					 class="btn btn-warning">회원가입</a>
				<a type="button" href="${pageContext.request.contextPath}/member/FindId.do"
					class="btn btn-info">아이디 찾기</a>
				<a type="button" href="${pageContext.request.contextPath}/member/FindPw.do"
					class="btn btn-info">비밀번호 찾기</a>
			</span>
		</div>
	</div>


	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>