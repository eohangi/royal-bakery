<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>My JSP Page</title>
	<!-- Twitter Bootstrap3 & jQuery -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />
	<script src="http://code.jquery.com/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<!-- jQuery Framework 참조하기 -->
<script src="http://code.jquery.com/jquery.min.js"></script>
	
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
<%@ include file = "css/common.css" %>


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
<%@ include file = "Header.jsp" %>
	<div class="container">
		<div class="row">
			<div class="sidebar1"></div>
			<!-- 페이지 내용 영역 -->
			<div class="content">

			<h2 class="page-header " style = "text-align : left; padding-left : 30px" >| 글쓰기 - 수정 </h2>
			<form class="form-horizontal" id="myform">
				

			<div class="form-group">
				<label for="homepage" class="col-md-offset-2 col-md-10 text-left" >공지사항</label>
				
			</div>

			<div class="form-group">
				<label for="info" class="col-md-2">제목</label>
				<div class="col-md-9">
					<input type="text" name="info" id="info" class="form-control" style="margin: 0px; " placeholder="사용자가 질문한 내용">
				</div>
			</div>

			<div class="form-group">
				<label for="info" class="col-md-2">내용</label>
				<div class="col-md-9">
					<input type="text" name="info" id="info" class="form-control" style="margin: 0px; height: 100px;">
				</div>
			</div>

			<div class="form-group">
				
				<div class="clearfix">
				<div class="col-md-offset-8 col-md-1" style="padding-left:100px;">
					<input id="cancel" type="button"
						value="취소" class="btn btn-warning pull-left" />
				</div>
				<div class="col-md-1" style="padding-left:50px;">
					<input type="button" id="ok"
						value="작성하기" class="btn btn-primary pull-left" />
				</div>
				</div>
			</div>

			</form>
				

			</div>

			<div class="sidebar2"></div>
		</div>
	</div>
<%@ include file = "inc/footer.jsp" %>
</body>

</html>
