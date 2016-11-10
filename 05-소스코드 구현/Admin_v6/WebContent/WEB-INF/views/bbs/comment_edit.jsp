<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
	
<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	
<link rel="stylesheet" href="plugins/sweetalert/sweetalert.css" />

<script src="plugins/sweetalert/sweetalert.min.js"></script>	

<script type="text/javascript">
$(function(){
	$("#cancel").click(function(){
			swal({
			  title: "취소",
			  text: "게시물 등록을 취소 하겠습니까?",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonClass: "btn-primary",
			  confirmButtonText: "확인",
			
			  
			  
			  cancelButtonClass: "btn-danger",
			  cancelButtonText: "취소",
			  closeOnConfirm: false,
			  closeOnCancel: false
			},
			function(isConfirm){
				if(isConfirm){
					location.href="4Admin_information.jsp";
			}else{
				location.href="4Admin_information_detail.jsp";
			}
			
			});  
	});
	
	$("#ok").click(function(){
		swal({
		  title: "등록",
		  text: "게시물을 등록 하겠습니까?",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonClass: "btn-primary",
		  confirmButtonText: "확인",
		
		  
		  
		  cancelButtonClass: "btn-danger",
		  cancelButtonText: "취소",
		  closeOnConfirm: false,
		  closeOnCancel: false
		},
		function(isConfirm){
			if(isConfirm){
				location.href="4Admin_information.jsp";
			}else{
				location.href="4Admin_information_detail.jsp";
			}
		
		});  
	});
});
</script>

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
<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="sidebar1"></div>
			<!-- 페이지 내용 영역 -->
			<div class="content">
				<h2 class="page-header " style = "text-align : left; padding-left : 30px" >| 답변내용 수정 </h2>
				<form class="form-horizontal" id="myform" method="post" action="${pageContext.request.contextPath}/bbs/comment_edit_ok.do">
					
					<!-- 수정대상에 대한 상태유지 -->
					<input type="hidden" name="comment_id" value="${readComment.id}" />
					<input type="hidden" name="domment_id" value="${documentId}" />
					
					<div class="form-group">
						<label for="homepage" class="col-md-offset-2 col-md-10 text-left" >답변 수정</label>
					</div>

							
					<div class="form-group">
						<label for="info" class="col-md-2">내용</label>
						<div class="col-md-9">
							<textarea id="content" name="content" class="ckeditor">
								${readComment.coContent}</textarea>
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
