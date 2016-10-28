<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>

<!doctype html>

<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="container">
		<h1>공지사항 - <small>글 삭제하기</small></h1>
		
		<form name="myform" method="post" action="${pageContext.request.contextPath}/bbs.notice/document_delete_ok.do">
			<!-- 카테고리와 게시글 번호 상태유지 -->
			
			<input type="hidden" name="document_id" value="${documentId}" />
			
			<div style='width: 300px; margin: 50px auto;'>
				<!-- 자신의 글인 경우와 아닌 경우에 대한 분기 -->
				<c:choose>
					<c:when test="${myDocument == true}">
						<!-- 자신의 글에 대한 삭제 -->
						<p>정말 이 게시물을 삭제하시겠습니까?</p>
					</c:when>
					<c:otherwise>
						<p>글 작성시 설정한 비밀번호를 입력해야 합니다.</p>
						<div class="form-group">
							<label for='writer_pw'>비밀번호</label>
							<input type="password" name="writer_pw" id="writer_pw" 
								class="form-control" />
						</div>
					</c:otherwise>
				</c:choose>
				<div class="form-group">
					<button type='submit' class='btn btn-danger btn-block'>삭제하기</button>
					<button type='button' class='btn btn-primary btn-block'
						onclick="history.back()">삭제취소</button>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>
</html>
