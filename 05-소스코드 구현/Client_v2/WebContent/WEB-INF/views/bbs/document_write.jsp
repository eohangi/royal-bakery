<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>

<!doctype html>

<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>

<body>
	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="container">
		<h1 class="page-header">${bbsName} - <small>새 글 쓰기</small></h1>
		
		<form class="form-horizontal" method="post" enctype="multipart/form-data"
			action="${pageContext.request.contextPath}/bbs/document_write_ok.do">
			<!-- 게시판 카테고리에 대한 상태 유지 -->
			<input type="hidden" name="category" value="${category}" />
			<!-- 작성자, 비밀번호는 로그인 하지 않은 경우만 입력한다. -->
			<c:if test="${loginInfo == null}">
				<!-- 작성자 -->
				<div class="form-group">
					<label for="writer_name" class="col-sm-2 control-label">작성자</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="writer_name" name="writer_name"/>
					</div>
				</div>		
				<!-- 비밀번호 -->
				<div class="form-group">
					<label for="writer_pw" class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="writer_pw" name="writer_pw"/>
					</div>
				</div>	
			</c:if>
			<!-- 제목 -->
			<div class="form-group">
				<label for="subject" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="subject" name="subject"/>
					</div>
			</div>
			<!-- 내용 -->
			<div class="form-group">
				<label for="writer_name" class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10">
						<textarea id="content" name="content" class="ckeditor"></textarea>
					</div>
			</div>
			<!-- 버튼들 -->
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">저장하기</button>
					<button type="button" class="btn btn-danger" onclick="history.back();">작성취소</button>
				</div>
			</div>	
		</form>
	</div>
	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>
</html>
