<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>

<!doctype html>

<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>

<body>
	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="container">
		<h1 class="page-header">${bbsName} - <small>수정하기</small></h1>
		
		<form class="form-horizontal" method="post" enctype="multipart/form-data"
			action="${pageContext.request.contextPath}/bbs/document_edit_ok.do">
			<!-- 게시판 카테고리에 대한 상태 유지 -->
			<input type="hidden" name="category" value="${category}" />
			<!-- 수정 대상에 대한 상태유지 -->
			<input type="hidden" name="document_id" value="${readDocument.id}" />
			
			<!-- 작성자, 비밀번호는 자신의 글을 수정하는 경우만 생략한다. -->
			<c:if test="${loginInfo == null || loginInfo.id != readDocument.memberId}">
				<!-- 작성자 -->
				<div class="form-group">
					<label for="writer_name" class="col-sm-2 control-label">작성자</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="writer_name" 
							name="writer_name" value="${readDocument.writerName}">
					</div>
				</div>		
				<!-- 비밀번호 -->
				<div class="form-group">
					<label for="writer_pw" class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="writer_pw" name="writer_pw"
							placeholder="글 작성시 설정하신 비밀번호를 입력하세요."/>
					</div>
				</div>	
			</c:if>
			<!-- 제목 -->
			<div class="form-group">
				<label for="subject" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="subject" name="subject"
							value="${readDocument.subject}"/>
					</div>
			</div>
			<!-- 내용 -->
			<div class="form-group">
				<label for="writer_name" class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10">
						<textarea id="content" name="content" class="ckeditor">
							${readDocument.content}</textarea>
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
