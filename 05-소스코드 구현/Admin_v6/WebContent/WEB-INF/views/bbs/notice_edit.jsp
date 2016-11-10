<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
	
<%@ include file="/WEB-INF/inc/topbar.jsp"%>


<style type="text/css">


	div.container{
		min-height:auto;

	}

	/**  content  */
	div.sidebar1 {
		float:left;
		background: #ccc;
		min-height: 500px;
		position:relative;
		width:10%;
		height: auto;

	}

	div.sidebar2 {
		float:left;
		background: #ccc;
		min-height: 500px;
		position:relative;
		width:10%;
		height: auto;

	}

	div.content {
		float:left;
		padding-top: 20px;
		min-height: 500px;
		position:relative;
		width:80%;
		overflow:hidden;
	}


</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="sidebar1"></div>
			<!-- 페이지 내용 영역 -->
			<div class="content">
				<h2 class="page-header " style = "text-align : left; padding-left : 30px" >| 공지사항 수정 </h2>
				<form class="form-horizontal" id="myform" action="${pageContext.request.contextPath}/bbs/notice_edit_ok.do">
					
					<!-- 수정대상에 대한 상태유지 -->
					<input type="hidden" name="document_id" value="${readDocument.id}" />
					
					<div class="form-group">
						<label for="homepage" class="col-md-offset-2 col-md-10 text-left" >공지사항</label>
					</div>

					<div class="form-group">
						<label for="info" class="col-md-2">제목</label>
						<div class="col-md-9">
							<input type="text" name="subject" id="subject" class="form-control" style="margin: 0px;" 
								value="${readDocument.subject}">
						</div>
					</div>
		
					<div class="form-group">
						<label for="info" class="col-md-2">내용</label>
						<div class="col-md-9">
							<textarea id="content" name="content" class="ckeditor">
								${readDocument.content}</textarea>
						</div>
					</div>
		
					<div class="form-group">
						
						<div class="clearfix">
						<div class="col-md-offset-8 col-md-1" style="padding-left:-7px;">
							<button id="cancel" type="button" class="btn btn-warning pull-left" onclick="history.back()" >작성취소</button>
						</div>
						<div class="col-md-1" style="padding-left:50px;">
							<button type="submit" id="ok" class="btn btn-primary pull-left" >수정하기</button>
						</div>
						</div>
					</div>
		
				</form>
				

			</div>

			<div class="sidebar2"></div>
		</div>
	</div>
<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>

</html>
