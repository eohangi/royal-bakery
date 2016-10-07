<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="jsputil.cart.*"%>
<%@ page import="java.util.*"%>
<%
	if (session.getAttribute("username") == null) {
		session.setAttribute("username", request.getParameter("username"));
	}

	String goodsCode = request.getParameter("goodsCode"); // 선택되어진 코드값 객체에 저장
	String username = (String) session.getAttribute("username"); // 세션 유저 정보 가져오기

	GoodsDAO goodsDao = new GoodsDAO(); // 어레이 리스트 사용할 객체 생성
	ArrayList<Goods> goodsList = goodsDao.getGoodsList();

	// GoodsDAO 클래스의 값 중에서 이전에 선택되어진 값만 goods객체에 가지고 있기
	Goods goods = new Goods();
	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getCode().equals(goodsCode)) { // 기존에 선택된 상품이면 빠져나가기
			break;
		}
	}

	// 선택한 상품 넣을 리스트 초기화 한번하기
	ArrayList<Goods> list = (ArrayList<Goods>) session.getAttribute("cartlist");
	if (list == null) { // 데이터가 없으면 객체 생성 / 데이터가 있으면 객체 생성안한다.
		list = new ArrayList<Goods>();
		session.setAttribute("cartlist", list);
	}

	// 선택한 상품이 중복이면 수량 증가시키기
	int cnt = 0;
	Goods goodsQnt = new Goods();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getCode().equals(goodsCode)) {
			cnt++;
			int orderQnt = goodsQnt.getOrderQnt() + 1;
			goodsQnt.setOrderQnt(orderQnt);
		}
	}
	if (cnt == 0) { // 선택한 상품이 중복이 아니닌 처음이면 처음한번만 리스트값 생성
		goods.setOrderQnt(1);
		list.add(goods);
	}
%>
<!DOCTYPE html>
<%@ include file="inc/Common.jsp"%>
<style type="text/css">
.view {
	width: 300px;
	height: 200px;
	margin: 10px;
	float: left;
	border: 10px solid #fff;
	overflow: hidden;
	position: relative;
	text-align: center;
	box-shadow: 1px 1px 2px #e6e6e6;
	cursor: default;
	background: #fff src(img/ 1.jpg) no-repeat center center
}

.view .mask, .view .content {
	width: 300px;
	height: 200px;
	position: absolute;
	overflow: hidden;
	top: 0;
	left: 0
}

.view img {
	display: block;
	position: relative
}

.view h2 {
	text-transform: uppercase;
	color: #fff;
	text-align: center;
	position: relative;
	font-size: 17px;
	padding: 10px;
	background: rgba(0, 0, 0, 0.8);
	margin: 20px 0 0 0
}

.view p {
	font-family: Georgia, serif;
	font-style: italic;
	font-size: 12px;
	position: relative;
	color: black;
	padding: 10px 20px 20px;
	text-align: center
}

.view a.info {
	display: inline-block;
	text-decoration: none;
	padding: 7px 14px;
	background: #000;
	color: #fff;
	text-transform: uppercase;
	box-shadow: 0 0 1px #000
}

.view a.info:hover {
	box-shadow: 0 0 5px #000
}

.view-first img {
	transition: all 0.2s linear;
}

.view-first .mask {
	opacity: 0;
	background-color: rgba(219, 127, 8, 0.7);
	transition: all 0.4s ease-in-out;
}

.view-first h2 {
	transform: translateY(-100px);
	opacity: 0;
	transition: all 0.2s ease-in-out;
}

.view-first p {
	transform: translateY(100px);
	opacity: 0;
	transition: all 0.2s linear;
}

.view-first a.info {
	opacity: 0;
	transition: all 0.2s ease-in-out;
}

.view-first:hover img {
	transform: scale(1.1);
}

.view-first:hover .mask {
	opacity: 1;
}

.view-first:hover h2, .view-first:hover p, .view-first:hover a.info {
	opacity: 1;
	transform: translateY(0px);
}

.view-first:hover p {
	transition-delay: 0.1s;
}

.view-first:hover a.info {
	transition-delay: 0.2s;
}
</style>
</head>
<body>

	<%@ include file="inc/Header2.jsp"%>
	<div class="page-header"></div>


	<div class="row">

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
							<th class="text-center"><%=goods.getCode()%> <%
 	// 상품 코드
 %> <%=goods.getName()%> <%
 	// 상품 이름
 %> <%=goods.getPrice()%> <%
 	// 상품 가격
 %> (<%=goods.getOrderQnt()%>) <%
 	// 상품 수량
 %></th>
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
		<!-- 페이지 내용 영역 -->

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
								<input type="text" placeholder=" 현재 재고량 : 15 개" disabled>
								<!-- 갯수 -->
								<input type="number" name="quantity" class="pull-left" min="1"
									max="5">
								<button onclick="cartAdd('<%=goods.getCode()%>')">추가</button>
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
								<input type="text" placeholder=" 현재 재고량 : 15 개" disabled>
								<!-- 갯수 -->
								<input type="number" name="quantity" class="pull-left" min="1"
									max="5">
								<button onclick="cartAdd('<%=goods.getCode()%>')">추가</button>
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
								<input type="text" placeholder=" 현재 재고량 : 15 개" disabled>
								<!-- 갯수 -->
								<input type="number" name="quantity" class="pull-left" min="1"
									max="5">
								<button onclick="cartAdd('<%=goods.getCode()%>')">추가</button>
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
								<input type="text" placeholder=" 현재 재고량 : 15 개" disabled>
								<!-- 갯수 -->
								<input type="number" name="quantity" class="pull-left" min="1"
									max="5">
								<button onclick="cartAdd('<%=goods.getCode()%>')">추가</button>
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
								<input type="text" placeholder=" 현재 재고량 : 15 개" disabled>
								<!-- 갯수 -->
								<input type="number" name="quantity" class="pull-left" min="1"
									max="5">
								<button onclick="cartAdd('<%=goods.getCode()%>')">추가</button>
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
								<input type="text" placeholder=" 현재 재고량 : 15 개" disabled>
								<!-- 갯수 -->
								<input type="number" name="quantity" class="pull-left" min="1"
									max="5">
								<button onclick="cartAdd('<%=goods.getCode()%>')">추가</button>
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
								<input type="text" placeholder=" 현재 재고량 : 15 개" disabled>
								<!-- 갯수 -->
								<input type="number" name="quantity" class="pull-left" min="1"
									max="5">
								<button onclick="cartAdd('<%=goods.getCode()%>')">추가</button>
							</p>
						</div>
					</div>
				</div>
			</div>

			<!--// 탭 화면 끝 -->
		</div>
	</div>


	<div class="col-md-2" id="slide1">
		<h1>슬라이드1</h1>
	</div>


	<%@ include file="inc/Footer.jsp"%>
</body>

</html>