<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>

<!doctype html>

<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>

<body>
	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="container">
		<h1 class="page-header">공지사항 - <small>글 읽기</small></h1>
		
		<!-- 제목, 작성자, 작성일시 -->
		<div class="alert alert-info">
			<h3 style="margin: 0">
				${readDocument.subject}<br/>
				<small>
					${readDocument.writerName} / 작성일시 : ${readDocument.regDate}
				</small>
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
					<td>
						<c:choose>
							<c:when test="${nextDocument != null}">
								<c:url var="nextUrl" value="/bbs.notice/document_read.do">
									
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
					<td>
						<c:choose>
							<c:when test="${prevDocument != null}">
								<c:url var="prevUrl" value="/bbs.notice/document_read.do">
								
									<c:param name="document_id" value="${prevDocument.id}" />
								</c:url>
								<a href="${prevUrl}">${prevDocument.subject}</a>
							</c:when>
							<c:otherwise>
								다음글이 없습니다.
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- 버튼들 -->
		<div class="clearfix">
			<div class="pull-right">
				<a href="${pageContext.request.contextPath}/bbs.notice/document_list.do" class="btn btn-info">목록보기</a>
				<a href="${pageContext.request.contextPath}/bbs.notice/document_write.do" class="btn btn-primary">글쓰기</a>
				<a href="${pageContext.request.contextPath}/bbs.notice/document_edit.do?document_id=${readDocument.id}" class="btn btn-warning">수정하기</a>
				<a href="${pageContext.request.contextPath}/bbs.notice/document_delete.do?document_id=${readDocument.id}" class="btn btn-danger">삭제하기</a>		
			</div>
		</div>
		<!-- 덧글 -->
	</div>
	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>
</html>
