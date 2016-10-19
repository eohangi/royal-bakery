<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>My JSP Page</title>
<!-- Twitter Bootstrap3 & jQuery -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>


<!-- jQuery Framework 참조하기 -->
<script src="http://code.jquery.com/jquery.min.js"></script>
	
<link rel="stylesheet" href="plugins/sweetalert/sweetalert.css" />

<script src="plugins/sweetalert/sweetalert.min.js"></script>	

<script type="text/javascript">
$(function(){
	$("#cancel").click(function(){
			swal({
			  title: "취소",
			  text: "취소 하겠습니까?",
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
					location.href="4Admin_banner.jsp";
				}else{
					location.href="4Admin_banner_detail.jsp";
				}
			
			});  
	});
	
	$("#ok").click(function(){
		swal({
		  title: "등록",
		  text: "이 배너를 등록 하겠습니까?",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonClass: "btn-primary",
		  confirmButtonText: "등록",
		
		  
		  
		  cancelButtonClass: "btn-danger",
		  cancelButtonText: "취소",
		  closeOnConfirm: false,
		  closeOnCancel: false
		},
		function(isConfirm){
			if(isConfirm){
				location.href="4Admin_banner.jsp";
		}else{
			location.href="4Admin_banner_detail.jsp";
		}
		
		});  
});
});
</script>


<style type="text/css">

/** web18/10-titlebar.html 의 코드를 재활용 */
/** 기본 초기화 처리 */
<%@ include file = "css/common.css" %>


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
<%@ include file = "Header.jsp" %>
	<div class="container">
		<div class="row">
			<div class="sidebar1"></div>
			<!-- 페이지 내용 영역 -->
			<div class="content">

				<h2 class="page-header "
					style="text-align: left; padding-left: 30px">| 배너관리 - 수정</h2>
				<form class="form-horizontal" id="myform">


					<div class="form-group">
						<label for="Tel" class="col-md-2">출력 순서</label>
						<div class="btn-group col-md-2">
							<button type="button" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown">
								Action <span class="caret"></span>
							</button>
							<!-- 재사용될 코드 입니다. -->
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">순서</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
							</ul>
							<!--// 재사용될 코드 입니다. -->
						</div>
					</div>

					<div class="form-group">
						<label for="homepage" class="col-md-2">제목</label>
						<div class="col-md-9">
							<input type="text" name="homepage" id="homepage"
								class="form-control">
						</div>
					</div>



					<div class="form-group">
						<label for="img" class="col-md-2">이미지</label>
						<div class="col-md-9">
							<input type="file" name="img" id="img" class="form-control">
						</div>
					</div>

					<div class="form-group">

						<div class="clearfix">
							<div class="col-md-offset-2 col-md-1">
								<input id="cancel"  type="button" value="취소"
									class="btn btn-warning pull-left" />
							</div>
							<div class="col-md-offset-7 col-md-1">
								<input id="ok" type="button" value="등록"
									class="btn btn-primary pull-left" />
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