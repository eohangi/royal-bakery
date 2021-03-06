<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	min-height: 500px;
	position: relative;
	width: 10%;
	height: auto;
}

div.sidebar2 {
	float: left;
	min-height: 500px;
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

				<h2 class="page-header" style="text-align: left; padding-left: 30px; 
					padding-bottom: 20px">| 공지사항 </h2>
				<div class="container" style="padding-left: 30px; padding-right: 30px;">
					<table class="table table-hover" style="padding: 10px;">
						<thead>
							<tr>
								<th class="text-center  col-md-1">번호</th>
								<th class="text-center  col-md-5">제목</th>
								<th class="text-center  col-md-3">작성자</th>
								<th class="text-center  col-md-3">작성일</th>
							</tr>
						</thead>

						<tbody>
							<div id='glayLayer'></div>
							<div id='overLayer'></div>
							<c:choose>
								<c:when test="${fn:length(documentList) > 0}">
									<c:forEach var="document" items="${documentList}">
										<tr>
											<td class="text-center">${document.id}</td>
											<td><c:url var="readUrl"
													value="/bbs/notice_read.do">
													<c:param name="category" value="${document.category}" />
													<c:param name="document_id" value="${document.id}" />
												</c:url> <a href="${readUrl}">${document.subject}</a></td>
											<td class="text-center">${document.writerName}</td>
											<td class="text-center">${document.regDate}</td>
											<td class="text-center">${document.checks}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" class="text-center"
											style="line-height: 100px;">아직 작성된 공지사항이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
	<%@ include file="/WEB-INF/inc/bbs_notice_bottom.jsp" %>
				</div>
			</div>

			<div class="sidebar2"></div>
		</div>
		
	</div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
	<!-- lightbox 플러그인 스크립트를 body 종료 직전에 적용 해야한다. -->
	<script src="plugins/lightbox/js/lightbox-plus-jquery.min.js"></script>
</body>

</html>
