<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/inc/topbar.jsp"%>
<!-- jQuery Framework 참조하기 -->
<script src="http://code.jquery.com/jquery.min.js"></script>



<style type="text/css">


div.container {
	min-height: auto;
}

/**  content  */
div.sidebar1 {
	float: left;
	background: #ccc;
	min-height: 500px;
	position: relative;
	width: 10%;
	height: auto;
}

div.sidebar2 {
	float: left;
	background: #ccc;
	min-height: 500px;
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
	<div class="container">
		<div class="row">
			<div class="sidebar1"></div>
			<!-- 페이지 내용 영역 -->
			<div class="content">
				<h2 class="page-header "
					style="text-align: left; padding-left: 30px">| 공지사항 - 읽기</h2>

				<!-- 제목, 작성자, 작성일시 -->
				<div class="alert alert-info">
					<h3 style="margin: 0">${readDocument.subject}<br /> 
						<small>${readDocument.writerName} / 작성일시 : ${readDocument.regDate} </small>
					</h3>
				</div>
				<!-- 내용 -->
				<section style="padding: 0 10px 20px 10px">
					${readDocument.content}
				</section>
				<!-- 다음글 이전글 -->
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th class="success">다음글</th>
							<td><c:choose>
									<c:when test="${nextDocument != null}">
										<c:url var="nextUrl" value="/bbs/notice_read.do">
											<c:param name="document_id" value="${nextDocument.id}" />
										</c:url>
										<a href="${nextUrl}">${nextDocument.subject}</a>
									</c:when>
									<c:otherwise>
										다음글이 없습니다.
									</c:otherwise>
								</c:choose></td>
						</tr>
						<tr>
							<th class="success">이전글</th>
							<td><c:choose>
									<c:when test="${prevDocument != null}">
										<c:url var="prevUrl" value="/bbs/notice_read.do">

											<c:param name="document_id" value="${prevDocument.id}" />
										</c:url>
										<a href="${prevUrl}">${prevDocument.subject}</a>
									</c:when>
									<c:otherwise>
										이전글이 없습니다.
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</tbody>
				</table>
				<!-- 버튼들 -->
				<div class="clearfix">
					<div class="pull-right">
						<a href="${pageContext.request.contextPath}/bbs/notice_list.do" class="btn btn-info">목록보기</a> 
						<a href="${pageContext.request.contextPath}/bbs/notice_write.do" class="btn btn-primary">글쓰기</a>
						<a href="${pageContext.request.contextPath}/bbs/notice_edit.do?document_id=${readDocument.id}" 
							class="btn btn-warning">수정하기</a> 
						<a href="${pageContext.request.contextPath}/bbs/notice_delete.do?document_id=${readDocument.id}"
							class="btn btn-danger">삭제하기</a>
					</div>
				</div>
			</div>

			<div class="sidebar2"></div>
		</div>
	</div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>

</html>
