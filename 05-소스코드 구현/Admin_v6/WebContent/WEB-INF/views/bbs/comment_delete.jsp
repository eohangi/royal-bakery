<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
	<%@ include file="/WEB-INF/inc/topbar.jsp"%>

<style type="text/css">
div.container {
	min-height: auto;
}
/**  content  */
div.sidebar1 {
	float: left;
	position: relative;
	width: 10%;
	height: auto;
}

div.sidebar2 {
	float: left;
	position: relative;
	width: 10%;
	height: auto;
}

div.content {
	float: left;
	padding-top: 20px;
	min-height: 500px;
	position: relative;
	width: 80%;
	overflow: hidden;
}
</style>

</head>
<body>
<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="container">
		<h1>Q n A - <small>글 삭제하기</small></h1>
		
		<form name="myform" method="post" action="${pageContext.request.contextPath}/bbs/comment_delete_ok.do">
			<!-- 카테고리와 게시글 번호 상태유지 -->
			
			<input type="hidden" name="document_id" value="${documentId}" />
			<input type="hidden" name="comment_id" value="${commentId}" />
			
			<div style='width: 300px; margin: 50px auto;'>
				<!-- 자신의 글인 경우와 아닌 경우에 대한 분기 -->
			
						<!-- 자신의 글에 대한 삭제 -->
						<p>정말 답변을 삭제하시겠습니까?</p>
					
					
				<div class="form-group">
					<button type='submit' class='btn btn-danger btn-block'>삭제하기</button>
					<button type='button' class='btn btn-primary btn-block'
						onclick="history.back()">삭제취소</button>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>