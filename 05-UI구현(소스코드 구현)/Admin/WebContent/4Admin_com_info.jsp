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
<!-- daum 우편번호 검색 스크립트 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="plugins/daumpostcode/daumpostcode.js"></script>


<!-- jQuery Framework 참조하기 -->
<script src="http://code.jquery.com/jquery.min.js"></script>
	
<link rel="stylesheet" href="plugins/sweetalert/sweetalert.css" />

<script src="plugins/sweetalert/sweetalert.min.js"></script>	

<script type="text/javascript">
$(function(){
	$("#ok").click(function(){
			swal({
			  title: "등록",
			  text: "등록 하겠습니까?",
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
					location.href="4Admin_com_info.jsp";
			}else{
				location.href="4Admin_com_info.jsp";
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

		min-height: 500px;
		position:relative;
		width:10%;
		height: auto;

	}

	div.sidebar2 {
		float:left;

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

			<h2 class="page-header " style = "text-align : left; padding-left : 30px" >| 회사소개 </h2>
			<form class="form-horizontal" id="myform">
				<div class="form-group">
				<label for="postcode" class="col-md-2">우편번호</label>
				<div class="col-md-10 clearfix">
					<!-- clearfix 는 마감제 속성 -->
					<input type="text" name="postcode" id="postcode"
						class="form-control pull-left"
						style='width: 120px; margin-right: 5px' /> <input type="button"
						value="우편번호 찾기" class="btn btn-warning pull-left"
						onclick='execDaumPostcode("postcode", "addr1", "addr2")' />
				</div>

			</div>
			<div class="form-group">
				<label for="addr1" class="col-md-2">주소</label>
				<div class="col-md-9">
					<input type="text" name="addr1" id="addr1" class="form-control">
				</div>
			</div>

			<div class="form-group">
				<label for="Tel" class="col-md-2">전화</label>
				<div class="col-md-9">
					<input type="text" name="Tel" id="Tel" class="form-control">
				</div>
			</div>

			<div class="form-group">
				<label for="homepage" class="col-md-2">홈페이지</label>
				<div class="col-md-9">
					<input type="text" name="homepage" id="homepage" class="form-control">
				</div>
			</div>

			<div class="form-group">
				<label for="info" class="col-md-2">회사 소개</label>
				<div class="col-md-9">
					<input type="text" name="info" id="info" class="form-control" style="margin: 0px; height: 200px;">
				</div>
			</div>

			<div class="form-group">
				<label for="img" class="col-md-2">이미지</label>
				<div class="col-md-9">
					<input type="file" name="img" id="img"
						class="form-control">
				</div>
			</div>

			<div class="form-group">
				
				<div class="clearfix">
				<!-- <div class="col-md-offset-2 col-md-1">
					<input type="button"
						value="취소" class="btn btn-warning pull-left" />
				</div> -->
				<div class="col-md-offset-10 col-md-1">
					<input id="ok" type="button"
						value="등록" class="btn btn-primary pull-left" />
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