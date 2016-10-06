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


<!--lightbox plugin  -->
<link rel="stylesheet" href="plugins/lightbox/css/lightbox.min.css" />


<!-- jQuery Framework 참조하기 -->
<script src="http://code.jquery.com/jquery.min.js"></script>
	
<link rel="stylesheet" href="plugins/sweetalert/sweetalert.css" />

<script src="plugins/sweetalert/sweetalert.min.js"></script>	

<script type="text/javascript">
$(function(){
	$("#all_delete").click(function(){
			swal({
			  title: "전체 삭제",
			  text: "질문을 전체 삭제 하겠습니까?",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonClass: "btn-primary",
			  confirmButtonText: "삭제",
			
			  
			  
			  cancelButtonClass: "btn-danger",
			  cancelButtonText: "취소",
			  closeOnConfirm: false,
			  closeOnCancel: false
			},
			function(isConfirm){
				if(isConfirm){
					location.href="4Admin_QA.jsp";
			}else{
				location.href="4Admin_QA.jsp";
			}
			
			});  
	});
	
	$("#select_delete").click(function(){
		swal({
		  title: "삭제",
		  text: "이 질문을 삭제 하겠습니까?",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonClass: "btn-primary",
		  confirmButtonText: "삭제",
		
		  
		  
		  cancelButtonClass: "btn-danger",
		  cancelButtonText: "취소",
		  closeOnConfirm: false,
		  closeOnCancel: false
		},
		function(isConfirm){
			if(isConfirm){
				location.href="4Admin_QA.jsp";
			}else{
				location.href="4Admin_QA.jsp";
			}
		
		});  
});
});
</script>
<style type="text/css">
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
					style="text-align: left; padding-left: 30px; padding-bottom: 20px">|
					문의하기</h2>




				<div class="container"
					style="padding-left: 30px; padding-right: 30px;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="text-center  col-md-1"><input type="checkbox"
									name="check" id="check" style="width: 18%;"></th>
								<th class="text-center  col-md-1">#</th>
								<th class="text-center  col-md-4">제목</th>
								<th class="text-center  col-md-2">등록일</th>
								<th class="text-center  col-md-1">답변 유무</th>
								<th class="text-center  col-md-2">답변하기</th>
							</tr>
						</thead>

						<tbody>
							<div id='glayLayer'></div>
							<div id='overLayer'></div>
							<tr>
								<td class="text-center" style="width: 18%;"><input
									type="checkbox" name="check" id="check"></td>
								<td class="text-center">1</td>
								<td>베너 이미지 1</td>

								<td class="text-center">13/10/15</td>
								<td class="text-center">Y</td>
								<td class="text-center"><a href="4Admin_QA_detail.jsp"><input type="button" value="답변하기"
									class="btn btn-default" /></a></td>
							</tr>
							<tr>
								<td class="text-center"><input type="checkbox" name="check"
									id="check"></td>
								<td class="text-center">2</td>
								<td>베너 이미지 2</td>

								<td class="text-center">13/11/15</td>
								<td class="text-center">N</td>
								<td class="text-center"><input type="button" value="답변하기"
									class="btn btn-default" /></td>
							</tr>
							<tr>
								<td class="text-center"><input type="checkbox" name="check"
									id="check"></td>
								<td class="text-center">3</td>
								<td>베너 이미지 3</td>

								<td class="text-center">13/12/15</td>
								<td class="text-center">N</td>
								<td class="text-center"><input type="button" value="답변하기"
									class="btn btn-default" /></td>
							</tr>
						</tbody>
					</table>
					<ul class="pagination">
				<li class="disabled"><a href="#">&laquo;</a></li>
				<!-- 활성화 버튼은 아래의 구조로 구성하시면 됩니다. sr-only는 스크린리더 전용 입니다 .-->
				<li class="active"><span>1 <span class="sr-only">(current)</span></span></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">&raquo;</a></li>
			</ul>

					<div class="form-group">

						<div class="clearfix">
							<div>
								<input id="select_delete" type="button" value="선택 삭제"
									class="btn btn-default pull-left" />
							</div>
							<div>
								<input id="all_delete" type="button" value="전체 삭제"
									class="btn btn-default pull-left" />
							</div>
						</div>
					</div>


				</div>
			</div>

			<div class="sidebar2"></div>
		</div>
	</div>
<%@ include file = "inc/footer.jsp" %>

	<!-- lightbox 플러그인 스크립트를 body 종료 직전에 적용 해야한다. -->
	<script src="plugins/lightbox/js/lightbox-plus-jquery.min.js"></script>
</body>

</html>
