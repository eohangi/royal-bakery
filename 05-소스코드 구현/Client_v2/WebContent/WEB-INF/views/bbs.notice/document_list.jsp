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
		<h1 class="page-header">공지사항 - <small>글 목록</small></h1>
		
		<!-- 글 목록 시작 -->
		
		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="text-center" style="width: 100px">번호</th>
						<th class="text-center">제목</th>
						<th class="text-center" style="width: 120px">작성자</th>
						<th class="text-center" style="width: 120px">작성일</th>
					</tr>
				</thead>
				<tbody class="panel-group" id="accordion">
					<c:choose>
						<c:when test="${fn:length(documentList) > 0}">
							<c:forEach var="document" items="${documentList}">
								<tr class="collapsible">
									<td class="text-center">${document.id}</td>
									<td>
										<c:url var="readUrl" value="/bbs.notice/document_read.do">
											<c:param name="category" value="${document.category}" />
											<c:param name="document_id" value="${document.id}" />
										</c:url>
										<a class="accordion-toggle" data-toggle="collapse" data-parent="#accodion" href="#${document.id}">${document.subject}</a>
									</td>
									<td class="text-center">${document.writerName}</td>
									<td class="text-center">${document.regDate}</td>
								</tr>
								
								<tr id="${document.id}" class="panel-collapse collapse">
									<td class="panel-body" colspan="4" >${document.content}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td  colspan="5" class="text-center" style="line-height: 100px;">
									조회된 글이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<!--// 글 목록 끝 -->
		<%@ include file="/WEB-INF/inc/bbs_notice_bottom.jsp" %>
	</div>
	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>