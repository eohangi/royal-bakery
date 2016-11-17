<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
					style="text-align: left; padding-left: 30px">| Q n A 게시판</h2>
				<!-- 제목, 작성자, 작성일시 -->
				<div class="alert alert-info">
					<h3 style="margin: 0">${readDocument.subject}<br /> <small>${readDocument.writerName}
							/ 작성일시 : ${readDocument.regDate} </small>
					</h3>
				</div>
				<!-- 내용 -->
				<section style="padding: 0 10px 20px 10px; word-wrap: break-word;">
					${readDocument.content}
				</section>
				<section style="padding: 0 70px 40px 10px; background-color: #F2F2F2; word-wrap: break-word;" >
					${readComment.coContent}
				</section>
								
				<!-- 다음글 이전글 -->
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th class="success">다음글</th>
							<td><c:choose>
									<c:when test="${nextDocument != null}">
										<c:url var="nextUrl" value="/bbs/qna_read.do">
											<c:param name="document_id" value="${nextDocument.id}" />
										</c:url>
										<a href="${nextUrl}">${nextDocument.subject}</a>
									</c:when>
									<c:otherwise>
										다음글이 없습니다.
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th class="success">이전글</th>
							<td><c:choose>
									<c:when test="${prevDocument != null}">
										<c:url var="prevUrl" value="/bbs/qna_read.do">

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
						<a href="${pageContext.request.contextPath}/bbs/qna_list.do" class="btn btn-info">목록보기</a>
							<c:choose>
								<c:when test="${readComment.coContent != null}">
									<c:url var="editUrl" value="/bbs/comment_edit.do">
										<c:param name="document_id" value="${readDocument.id}" />
										<c:param name="comment_id" value="${readComment.id}" />
									</c:url>
									<a href="${editUrl}" class="btn btn-warning">답변수정</a>
									<c:url var="deleteUrl" value="/bbs/comment_delete.do">
										<c:param name="document_id" value="${readDocument.id}" />
										<c:param name="comment_id" value="${readComment.id}" />
									</c:url>
									<a href="${deleteUrl}" class="btn btn-danger">답변삭제</a>
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/bbs/comment_write.do?document_id=${readDocument.id}" class="btn btn-success">답변하기</a>
								</c:otherwise>
							</c:choose>
											
					</div>
				</div>

			</div>

			<div class="sidebar2"></div>
		</div>
	</div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>

</html>
