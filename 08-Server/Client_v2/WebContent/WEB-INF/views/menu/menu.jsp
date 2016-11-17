<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>

</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="page-header"></div>


	<div class="row">


		<!-- 페이지 내용 영역 -->
		<div class="col-md-2 col-sm-2" id="leftSlide">
		<!-- 	<h1>슬라이드1</h1> -->
		</div>
		<div class="col-md-8 col-sm-8 page_select">
			<ul class="list-unstyled">
				<li class="menu_list col-md-4 col-sm-4" id="list_bread"><a
					href="bread.jsp"><img src="img/bread/b001.jpg" alt="main_bread">
						<p>Bread</p></a></li>
				<li class="menu_list col-md-4 col-sm-4" id="list_cake"><a
					href="cake.jsp"><img src="img/cake/k010.jpg" alt="main_cake">
						<p>Cake</p></a></li>
				<li class="menu_list col-md-4 col-sm-4" id="list_cokie"><a
					href="cokie.jsp"><img src="img/cokie/c008.jpg" alt="main_cokie">
						<p>Cokie</p></a></li>
			</ul>
		</div>
	</div>
	</div>

	<!--// 탭 화면 끝 -->
	</div>


	<!-- 슬라이드 2 -->
	<!---------------------------------------  장바구니   ----------------------------------- -->
	<form class="form-horizontal" id="inquireform">

		<div class="col-md-2" style="padding-right: 0px;">

			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th class="text-center" colspan="2"
							style="background-color: rgb(217, 204, 255)">장바구니</th>
					</tr>
				</thead>
				<tbody>

					<tr>
						<th class="text-center">
						<th class="text-center">삭제</th>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<th class="text-center"
							style="background-color: rgb(209, 255, 204)"></th>
						<th class="text-center"
							style="background-color: rgb(209, 255, 204)">총금액</th>
					</tr>
					<tr>
						<th class="text-center" colspan="2"
							style="background-color: rgb(209, 255, 204)">
							<button type="submit" class="btn btn-primary" onclick=' '>예약하기</button>
						</th>
					</tr>
				</tfoot>
			</table>

		</div>
	</form>
	<!--------------------------------------  장바구니 ------------ ------------------------- -->
	</div>

	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>