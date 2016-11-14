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

				<h2 class="page-header "
					style="text-align: left; padding-left: 30px; padding-bottom: 20px">|
					Q n A</h2>




				<div class="container"
					style="padding-left: 30px; padding-right: 30px;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="text-center  col-md-1">번호</th>
								<th class="text-center  col-md-4">제목</th>
								<th class="text-center  col-md-2">등록일</th>
								
								<th class="text-center  col-md-2"></th>
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
											<td class="text-center">${document.subject}</td>
											<td class="text-center">${document.regDate}</td>
											
											<td class="text-center">
												<c:url var="readUrl" value="/bbs/qna_read.do">
												<c:param name="category" value="${document.category}" />
												<c:param name="document_id" value="${document.id}" />
												</c:url>
												<a href="${readUrl}"><input type="button" value="문의조회"
												class="btn btn-default" /></a>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" class="text-center"
											style="line-height: 100px;">조회된 질문 내역이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>

			<div class="sidebar2"></div>
		</div>
	</div>
<%@ include file="/WEB-INF/inc/bbs_qna_bottom.jsp" %>
<%@ include file="/WEB-INF/inc/footer.jsp"%>
	<!-- lightbox 플러그인 스크립트를 body 종료 직전에 적용 해야한다. -->
	<script src="plugins/lightbox/js/lightbox-plus-jquery.min.js"></script>
</body>

</html>
