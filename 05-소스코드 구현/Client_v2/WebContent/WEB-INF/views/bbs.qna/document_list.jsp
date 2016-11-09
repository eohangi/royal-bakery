<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>

<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>

<body>

	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="container">
		<h1 class="page-header">문의하기 - <small>글 목록</small></h1>
		<!-- 글 목록 시작 -->
		
		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="text-center" style="width: 100px">번호</th>
						<th class="text-center">제목</th>
						<th class="text-center" style="width: 120px">작성자</th>
						<th class="text-center" style="width: 120px">작성일</th>
						<th class="text-center" style="width: 100px">답변여부</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(documentList) > 0}">
							<c:forEach var="document" items="${documentList}">
								<tr>
									<td class="text-center">${document.id}</td>
									<td>
										<c:url var="readUrl" value="/bbs.qna/document_read.do">
											<c:param name="category" value="${document.category}" />
											<c:param name="document_id" value="${document.id}" />
										</c:url>
										<a href="${readUrl}">${document.subject}</a>
									</td>
									<td class="text-center">${document.writerName}</td>
									<td class="text-center">${document.regDate}</td>
									<td class="text-center">${document.checks}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td  colspan="5" class="text-center" style="line-height: 100px;">
									아직 작성된 문의 사항이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		<%@ include file="/WEB-INF/inc/bbs_qna_bottom.jsp" %>
		</div>
		<!--// 글 목록 끝 -->
	</div>
	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>