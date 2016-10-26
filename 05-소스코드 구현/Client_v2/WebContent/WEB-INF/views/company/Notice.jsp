<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-2" id="slide1" ><h1>슬라이드1</h1></div>
			<!-- 페이지 내용 영역 -->
			<div class="col-md-8" id="content" >
				<div class="page-header">
					<h2>공지사항</h2>
				</div>
				<div class="2ndwrap">
					<table border="1" width="100%" align="center">
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
						<tbody class="panel-group" id="accordion" >
							
							<tr class="collapsible">
								<td align="center">5</td>
								<td><a  class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse5" >2016년 신규 메뉴가 옵니다!</a></td>
								<td align="center">관리자</td>
								<td align="center">123</td>
								<td align="center">2014-05-01</td>
							</tr >
		
							<tr id="collapse5" class="panel-collapse collapse in" >
								<td class="panel-body" colspan="5"><p>맛있는 빵이 새로 나왔습니다.</p></td>
							</tr>
							
							<tr class="collapsible">
								<td align="center">4</td>
								<td><a  class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse4" >케이크 특별주문시 할인</a></td>
								<td align="center">관리자</td>
								<td align="center">123</td>
								<td align="center">2014-05-01</td>
							</tr >
		
							<tr id="collapse4" class="panel-collapse collapse" >
								<td class="panel-body" colspan="5"><p>특별 주문시 할인해 드립니다.</p></td>
							</tr>
							
							<tr class="collapsible">
								<td align="center">3</td>
								<td><a  class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" >강남 2호점 오픈예정</a></td>
								<td align="center">관리자</td>
								<td align="center">123</td>
								<td align="center">2014-05-01</td>
							</tr >
		
							<tr id="collapseOne" class="panel-collapse collapse" >
								<td class="panel-body" colspan="5"><p>강남역 12번 출구에 로얄 베이커리 2호점이 생깁니다.</p></td>
							</tr>
		
		
		
							<tr class="collapsible">
								<td align="center">2</td>
								<td><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">추석 연휴 휴무안내</a></td>
								<td align="center">관리자</td>
								<td align="center">123</td>
								<td align="center">2014-05-01</td>
							</tr>
		
							<tr id="collapseTwo" class="panel-collapse collapse">
								<td class="panel-body" colspan="5"><p>추석 연휴동안 매장문을 닫습니다.</p></td>
								
							</tr>
		
							<tr class="collapsible">
								<td align="center">1</td>
								<td><a class="accordion-togle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">신규 가입 고객을 위한 이벤트</a></td>
								<td align="center">관리자</td>
								<td align="center">123</td>
								<td align="center">2014-05-01</td>
							</tr>
		
							<tr id="collapseThree" class="panel-collapse collapse">
								<td class="panel-body" colspan="5"><p>신규 고객에게 20% 할인 쿠폰을 드립니다</p></td>
							</tr>
							
						</tbody>
						<!-- 하단 영역(페이지번호,쓰기링크) -->
						<tfoot>
							<tr>
								<td colspan="5" align="center">
									<a href="#">1</a>
									<a href="#">2</a>
									<a href="#">3</a>
									<a href="#">4</a>
									<a href="#">5</a>
								</td>
							</tr>
							
						</tfoot>
					</table>
					
				</div>	
			</div>
							
			<div class="col-md-2" id="slide2" ><h3>슬라이드2</h3></div>
		</div>
	</div>
	<%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>