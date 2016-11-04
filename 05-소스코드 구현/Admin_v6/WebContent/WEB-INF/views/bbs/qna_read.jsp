<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/inc/head.jsp"%>

<link rel="stylesheet" href="plugins/sweetalert/sweetalert.css" />

<script src="plugins/sweetalert/sweetalert.min.js"></script>

<script type="text/javascript">
	$(function() {
		$("#cancel").click(function() {
			swal({
				title : "취소",
				text : "답변을 취소 하겠습니까?",
				type : "warning",
				showCancelButton : true,
				confirmButtonClass : "btn-primary",
				confirmButtonText : "확인",

				cancelButtonClass : "btn-danger",
				cancelButtonText : "취소",
				closeOnConfirm : false,
				closeOnCancel : false
			}, function(isConfirm) {
				if (isConfirm) {
					location.href = "4Admin_QA.jsp";
				} else {
					location.href = "4Admin_QA_detail.jsp";
				}

			});
		});

		$("#ok").click(function() {
			swal({
				title : "답변",
				text : "답변 하겠습니까?",
				type : "warning",
				showCancelButton : true,
				confirmButtonClass : "btn-primary",
				confirmButtonText : "확인",

				cancelButtonClass : "btn-danger",
				cancelButtonText : "취소",
				closeOnConfirm : false,
				closeOnCancel : false
			}, function(isConfirm) {
				if (isConfirm) {
					location.href = "4Admin_QA.jsp";
				} else {
					location.href = "4Admin_QA_detail.jsp";
				}

			});
		});
	});
</script>


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
				<section style="padding: 0 10px 20px 10px">
					${readDocument.content}
				</section>
				<section style="padding: 0 70px 40px 10px; background-color: #F2F2F2;" >
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
						<a href="${pageContext.request.contextPath}/bbs/qna_list.do" class="btn btn-info">목록보기</a> 
						<a href="${pageContext.request.contextPath}/bbs/comment_write.do" class="btn btn-primary">답변하기</a>
						
					</div>
				</div>

			</div>

			<div class="sidebar2"></div>
		</div>
	</div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>

</html>
