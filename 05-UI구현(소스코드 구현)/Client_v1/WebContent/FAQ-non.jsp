<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="inc/Common.jsp"%>
</head>
<body>

	<%@ include file="inc/Header2.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-2" id="slide1">
				<h1>슬라이드1</h1>
			</div>
			<!-- 페이지 내용 영역 -->
			<div class="col-md-8" Id="content">
				<ul class="tab_menu1 tab3 mgb_20 list-unstyled">
					<li><a href="Notice.jsp">공지사항</a></li>
					<li><a href="#">F A Q</a></li>
					<li><a href="Inquire.jsp">1대1 문의하기</a></li>
				</ul>
				<div class="page-header">
					<h2>F A Q</h2>
				</div>
				<div class="2ndwrap">
					<table border="1" align="center">
						<!-- 표 제목 -->
						<thead>
							<tr>
								<th width="50">번호</th>
								<th>제목</th>
								<th width="100">작성자</th>
								<th width="70">조회수</th>
								<th width="120">작성일</th>
							</tr>
						</thead>
						<!-- 본문 영역 (글목록) -->
						<tbody class="panel-group" id="accordion">

							<tr class="collapsible">
								<td align="center">3</td>
								<td><a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion" href="#collapseOne">제품에 문제가 있어요!</a></td>
								<td align="center">관리자</td>
								<td align="center">123</td>
								<td align="center">2014-05-01</td>
							</tr>

							<tr id="collapseOne" class="panel-collapse collapse in">
								<td class="panel-body" colspan="5"><p>구매하신 제품에 문제가 있으신
										경우 매장방문 하시면 교환해드립니다.</p></td>
							</tr>



							<tr class="collapsible">
								<td align="center">2</td>
								<td><a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion" href="#collapseTwo">케익 특별 주문은 어디서
										진행하나요?</a></td>
								<td align="center">관리자</td>
								<td align="center">123</td>
								<td align="center">2014-05-01</td>
							</tr>

							<tr id="collapseTwo" class="panel-collapse collapse">
								<td class="panel-body" colspan="5"><p>매장을 직접 방문하시거나 전화
										또는 온라인으로 ~~~~</p></td>

							</tr>

							<tr class="collapsible">
								<td align="center">1</td>
								<td><a class="accordion-togle" data-toggle="collapse"
									data-parent="#accordion" href="#collapseThree">로얄 베이커리의 제품의
										원산지가 궁금해요</a></td>
								<td align="center">관리자</td>
								<td align="center">123</td>
								<td align="center">2014-05-01</td>
							</tr>

							<tr id="collapseThree" class="panel-collapse collapse">
								<td class="panel-body" colspan="5"><p>저희 로얄 베이커리에서는 최고로
										엄선된 국내산 어쩌구 저쩌구 블라블라.</p></td>
							</tr>

						</tbody>
						<!-- 하단 영역(페이지번호,쓰기링크) -->
						<tfoot>
							<tr>
								<td colspan="5" align="center"><a href="#">1</a> <a
									href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
								</td>
							</tr>

						</tfoot>
					</table>

				</div>
			</div>

			<div class="col-md-2" id="slide2">
				<h3>슬라이드2</h3>
			</div>
		</div>
	</div>
	<script src="assets/js/jquery-1.10.2.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<%@ include file="inc/Footer.jsp"%>
</body>

</html>