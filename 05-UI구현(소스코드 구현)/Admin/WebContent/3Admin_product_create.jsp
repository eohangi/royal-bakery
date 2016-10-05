<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>Royal</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

<!-- Optional theme -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" />

<script src="http://code.jquery.com/jquery.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- jQuery Framework 참조하기 -->
<script src="http://code.jquery.com/jquery.min.js"></script>
	
<link rel="stylesheet" href="plugins/sweetalert/sweetalert.css" />

<script src="plugins/sweetalert/sweetalert.min.js"></script>	

<script type="text/javascript">
$(function(){
	$("#put").click(function(){
			swal({
			  title: "등록",
			  text: "이 제품을 등록 하겠습니까?",
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
					location.href="3Admin_order.jsp";
				}else{
					location.href="3Admin_order_create.jsp";
				}
			
			});  
	});
	
	$("#cancel").click(function(){
		swal({
		  title: "취소",
		  text: "이 제품 등록을 취소하겠습니까?",
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
				location.href="3Admin_order.jsp";
			}else{
				location.href="3Admin_order_create.jsp";
			}
		
		});  
});
});
</script>
<style type="text/css">

/** web18/10-titlebar.html 의 코드를 재활용 */
/** 기본 초기화 처리 */
.top {
	
}

div.container {
	text-align: center;
	min-height: 650px;
	margin: auto;
	width: auto;
	height: auto;
	position: relative;
}

/**  타이틀 바 영역의 배경 색상 그라데이션 처리 */
.titlebar {
	width: 100%;
	height: 45px;
	border-bottom: 1px solid #555;
	/** 웹킷에 대한 그라데이션 - 강의시간에는 구글 크롬만 대상으로 합니다. */
	background-image: -webkit-linear-gradient(top, rgb(89, 189, 212) 8%,
		rgb(40, 142, 168) 74%);
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.7);
}
/** 리스트 항목 가로 배치 */
.navi>li {
	width: 20%;
	float: left;
	height: 45px;
}

/** float 처리 마감제 */
.navi:after {
	color: '';
	display: block;
	float: none;
	clear: both;
}

/** 링크의 사이즈 처리 및 텍스트 꾸밈 */
.navi>li>a {
	text-decoration: none;
	display: block;
	width: auto;
	height: 45px;
	text-align: center;
	font-weight: bold;
	line-height: 45px;
	color: white;
	text-shadow: 0 1px 1px black;
	-webkit-transition: all 0.2s ease-in;
}

.list-unstyled {
	margin: 0;
}

/** 링크 마우스 오버 */
.navi>li:hover>a {
	color: #f60;
	position: relative;
	top: -1px;
}

/** 2depth 메뉴 컨테이너 */
.navi>li>ul {
	background: rgb(89, 189, 212);
	width: 100%;
	box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.5);
	/** 타이틀바 보다 작은 값 */
	z-index: 100;
	/** 숨김 처리 */
	opacity: 0;
	visibility: hidden;
	position: relative;
}

/* 2depth메뉴 보이기 처리 */
.navi>li:hover>ul {
	opacity: 1;
	visibility: visible;
	-webkit-transition: all 0.5s;
	position: relative;
	top: 0px;
}

/* 2depth 메뉴 컨테이너 각 항목 > 링크 */
.navi ul>li>a {
	display: block;
	text-align: center;
	height: 30px;
	font-weight: normal;
	font-size: 11px;
	line-height: 30px;
	color: #fff;
	text-decoration: none;
}

/* 2depth 메뉴 컨테이너 각 항목 > 링크 마우스 오버 */
.navi ul>li>a:hover {
	color: #ff0;
	background: rgb(89, 179, 192);
}

/**  content  */
div.sidebar1 {
	float: left;
	background: #f60;
	min-height: 650px;
	position: relative;
	width: 100px;
	height: auto;
}

div.sidebar2 {
	float: left;
	background: #f60;
	min-height: 650px;
	position: relative;
	width: 100px;
	height: auto;
}

div.content {
	float: left;
	background: #ff0;
	min-height: 650px;
	position: relative;
	width: 600px;
}

.join {
	margin: auto; align : center;
	width: 70%;
	text-align: center;
	align: center;
}

.page-header {
	text-align: center;
}

/** footer  */
.footer {
	height: 100px;
	position: relative;
	bottom: 0;
	width: 100%;
	/* Set the fixed height of the footer here */
	background-color: #f5f5f5;
}

.family_site {
	
}

.footerWrap {
	height: 100%;
	background-color: #5f5353;
}
</style>
</head>
<body>
<%@ include file = "Header.jsp" %>
	<div class='page-header'>
		<h1>제 품 등 록</h1>
	</div>
	<div class="container">

		<div class="row">
			<div class="join">
				<!-- 가입폼 시작 -->
				<form class="form-horizontal" id="myform">

					<div class="form-group">
						<label for="user_id" class="col-md-2">분 류*</label>
						<fieldset>
							<div>
								<!-- 드롭다운 (싱글타입) -->
								<select name="telecom" id="telecom">
									<option value="normal">일반제품</option>
								</select>
							</div>
						</fieldset>
					</div>
					<div class="form-group">
						<label for=user_pw " class="col-md-2">상 태*</label>
						<fieldset>
							<div>
								<!-- 드롭다운 (싱글타입) -->
								<select name="telecom" id="telecom">
									<option>-----선택하세요-----</option>
									<option value="normal">판매중</option>
									<option value="order">품절</option>
								</select>
							</div>
						</fieldset>
					</div>
					<div class="form-group">
						<label for="user_pw_re" class="col-md-2">상세 분류*</label>
						<fieldset>
							<div>
								<!-- 드롭다운 (싱글타입) -->
								<select name="telecom" id="telecom">
									<option>-----선택하세요-----</option>
									<option value="normal">쿠키</option>
									<option value="order">빵</option>
									<option value="order">케이크</option>
								</select>
							</div>
						</fieldset>
					</div>
					<div class="form-group">
						<label for="name" class="col-md-2">제품명*</label>
						<div class="col-md-10">
							<input type="text" name="name" id="name" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-md-2">제품 설명*</label>
						<div class="col-md-10">
							<input type="text" name="email" id="email" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="tel" class="col-md-2">가 격*</label>
						<div class="col-md-10">
							<input type="text" name="tel" id="tel" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="birthdate" class="col-md-2">수 량*</label>
						<div class="col-md-10">
							<input type="text" name="tel" id="tel" class="form-control">
						</div>
						<!-- placeholder 는 설명구문 -->
					</div>

					<hr color="black">
					<strong>< 영양성분 > </strong>
					<hr color="black">

					<div class="form-group">
						<label for="gender1" class="col-md-2">열량(kcal)*</label>
						<div class="col-md-10">
							<input type="text" name="tel" id="tel" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="gender1" class="col-md-2">당류 (g)*</label>
						<div class="col-md-10">
							<input type="text" name="tel" id="tel" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="gender1" class="col-md-2">단 백 질(g/%)*</label>
						<div class="col-md-10">
							<input type="text" name="tel" id="tel" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="addr1" class="col-md-2">포 화 지 방(g/%)*</label>
						<div class="col-md-10">
							<input type="text" name="addr1" id="addr1" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="addr2" class="col-md-2">나 트 륨 (mg/%)</label>
						<div class="col-md-10">
							<input type="text" name="addr2" id="addr2" class="form-control">
						</div>
					</div>
					<hr color="black">
					<div class="form-group">
						<label for="profile_img" class="col-md-2">이미지</label>
						<div class="col-md-10">
							<input type="file" name="profile_img" id="profile_img"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-offset-2 col-md-10">
							<!-- 들여쓰기 -->
							<button type="submit" class="btn btn-primary" id="put">제품등록</button>
							<button type="reset" class="btn btn-danger" id="cancel">취소</button>
						</div>
					</div>
				</form>
				<!-- 가입폼 끝 -->
			</div>
		</div>
	</div>

	<div class="footer">
		<div class="footerWrap">
			<ul class="list-unstyled">
				<li>
					<address>copyright 2016</address>
				</li>
			</ul>
		</div>
	</div>

</body>

</html>
