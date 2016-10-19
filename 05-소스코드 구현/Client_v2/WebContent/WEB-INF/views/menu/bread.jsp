<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>

</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar2.jsp"%>
	<div class="page-header"></div>


	<div class="row">


		<!-- 페이지 내용 영역 -->
		<div class="col-md-2" id="slide1">
			<h1>슬라이드1</h1>
		</div>
		<div class="col-md-8">
			<ul id="myTab" class="nav nav-tabs">
				<li class="active col-md-4"><a href="bread.jsp">bread</a></li>
				<li class="col-md-4"><a href="cake.jsp">cake</a></li>
				<li class="col-md-4"><a href="cookie.jsp">cookie</a></li>
			</ul>
			<!--// 탭 메뉴 끝 -->

			<!-- 탭 화면 시작 -->
			<div class="tab-content">
				<div class="tab-pane fade in active" id="bread">
					<div class="view view-first">
						<img src="img/bread/b001.jpg" style="width: 300px; height: 200px;" />
						<div class="mask"></div>
						<div class="content">
							<p>빵에대한 설명 zxcfq wef sddd ddddd dddddd dddd dsdasfav zxx</p>
							<p>1000won</p>
							<p>
								<input class="pull-left" type="text"
									placeholder=" 현재 재고량 : 15 개">
								<!-- 갯수 -->
								<input type="number" name="quantity" class="pull-left" min="1"
									max="5">
								<button onclick="cartAdd">추가</button>
							</p>
						</div>
					</div>

					<div class="view view-first">
						<img src="img/bread/b002.jpg" style="width: 300px; height: 200px;" />
						<div class="mask"></div>
						<div class="mask"></div>
						<div class="content">
							<p>빵에대한 설명 zxcfq wef sddd ddddd dddddd dddd dsdasfav zxx</p>
							<p>1000won</p>
							<p>
								<input class="pull-left" type="text"
									placeholder=" 현재 재고량 : 15 개">
								<!-- 갯수 -->
								<input type="number" name="quantity" class="pull-left" min="1"
									max="5">
								<button onclick="cartAdd">추가</button>
							</p>
						</div>
					</div>
					<div class="view view-first">
						<img src="img/bread/b003.jpg" style="width: 300px; height: 200px;" />
						<div class="mask"></div>
						<div class="mask"></div>
						<div class="content">
							<p>빵에대한 설명 zxcfq wef sddd ddddd dddddd dddd dsdasfav zxx</p>
							<p>1000won</p>
							<p>
								<input class="pull-left" type="text"
									placeholder=" 현재 재고량 : 15 개">
								<!-- 갯수 -->
								<input type="number" name="quantity" class="pull-left" min="1"
									max="5">
								<button onclick="cartAdd">추가</button>
							</p>
						</div>
					</div>

					<div class="view view-first">
						<img src="img/bread/b003.jpg" style="width: 300px; height: 200px;" />
						<div class="mask"></div>
						<div class="mask"></div>
						<div class="content">
							<p>빵에대한 설명 zxcfq wef sddd ddddd dddddd dddd dsdasfav zxx</p>
							<p>1000won</p>
							<p>
								<input class="pull-left" type="text"
									placeholder=" 현재 재고량 : 15 개">
								<!-- 갯수 -->
								<input type="number" name="quantity" class="pull-left" min="1"
									max="5">
								<button onclick="cartAdd">추가</button>
							</p>
						</div>
					</div>

					<div class="view view-first">
						<img src="img/bread/b004.jpg" style="width: 300px; height: 200px;" />
						<div class="mask"></div>
						<div class="mask"></div>
						<div class="content">
							<p>빵에대한 설명 zxcfq wef sddd ddddd dddddd dddd dsdasfav zxx</p>
							<p>1000won</p>
							<p>
								<input class="pull-left" type="text"
									placeholder=" 현재 재고량 : 15 개">
								<!-- 갯수 -->
								<input type="number" name="quantity" class="pull-left" min="1"
									max="5">
								<button onclick="cartAdd">추가</button>
							</p>
						</div>
					</div>
					<div class="view view-first">
						<img src="img/bread/b005.jpg" style="width: 300px; height: 200px;" />
						<div class="mask"></div>
						<div class="mask"></div>
						<div class="content">
							<p>빵에대한 설명 zxcfq wef sddd ddddd dddddd dddd dsdasfav zxx</p>
							<p>1000won</p>
							<p>
								<input class="pull-left" type="text"
									placeholder=" 현재 재고량 : 15 개">
								<!-- 갯수 -->
								<input type="number" name="quantity" class="pull-left" min="1"
									max="5">
								<button onclick="cartAdd">추가</button>
							</p>
						</div>
					</div>

					<div class="view view-first">
						<img src="img/bread/b006.jpg" style="width: 300px; height: 200px;" />
						<div class="mask"></div>
						<div class="mask"></div>
						<div class="content">
							<p>빵에대한 설명 zxcfq wef sddd ddddd dddddd dddd dsdasfav zxx</p>
							<p>1000won</p>
							<p>
								<input class="pull-left" type="text"
									placeholder=" 현재 재고량 : 15 개">
								<!-- 갯수 -->
								<input type="number" name="quantity" class="pull-left" min="1"
									max="5">
								<button onclick="cartAdd">추가</button>
							</p>
						</div>
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