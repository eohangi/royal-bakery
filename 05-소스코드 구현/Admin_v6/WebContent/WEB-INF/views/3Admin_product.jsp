<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>

<%@ include file="/WEB-INF/inc/topbar.jsp"%>
<style type="text/css">
.header {
	padding-top: 70px;
}

.form-group {
	
}
/**<<<<<<<<<<<<<<<<<<<<<<<<<<<<제품등록 버튼*/
.product {
	margin-top: 10px;
}

/** table */
.table-responsive {
	padding-top: 100px;
}

.table-striped>tbody>tr:nth-child(odd)>td, .table-striped>tbody>tr:nth-child(odd)>th
	{
	background-color: white !important;
}

.table-striped>tbody>tr:hover>td, .table-striped>tbody>tr:hover>th {
	background-color: orange !important;
}

.pagination {
	margin: 0;
}
</style>
<!-- JSON 데이터 가져오기 스크립트 시작 -->
<script type="text/javascript">
	function page() {
		//페이지가 열릴때 실행되는 이벤트,기본적으로 bread를 노출시킨다 ㅡ> JSON데이타 a
		$.get('${pageContext.request.contextPath}/PRODUCTLIST.do', {
			classify : 'a'
		}, function(json) {
			//미리 준비한 HTML틀을 읽어온다.
			var template = Handlebars.compile($("#item_tmpl").html());
			//Ajax를 통해서 읽어온 JSON내부의 배열 데이터를 템플릿에 병합한다.
			var html = template(json);
			//완성품을 출력한다.
			$("#product").html(html)
		});
	}

	/** AJAX로 JSON데이터를 가져와서 화면에 출력하는 함수 ---> req는 JSON 내용. */
	$(function() {
		page(); //페이지가 열림과 동시에 호출된다.

		$("#myTab a").click(function(e) {
			//data-deptno 속성의 값을 취득한다.
			var select_classify = $(this).data("classify");

			//Ajax요청을 통한 제품 데이터 조회
			$.get('${pageContext.request.contextPath}/PRODUCTLIST.do', {
				classify : select_classify
			}, function(json) {

				//미리 준비한 HTML틀을 읽어온다.
				var template = Handlebars.compile($("#item_tmpl").html());
				//Ajax를 통해서 읽어온 JSON내부의 배열 데이터를 템플릿에 병합한다.
				var html = template(json);
				//완성품을 출력한다.
				$("#product").html(html);
			});
		});

		$("#search").submit(function(e) {
			e.preventDefault();
			var word = $("input[name='keyword']").val();
			if (!word) {
				alert("검색어를 입력하세요");
				$("input[name='keyword']").focus();
				return false;
			}
			$.post("${pageContext.request.contextPath}/PRODUSELECT.do", {
				keyword : word
			}, function(json) {
				var temp = Handlebars.compile($("#itemsearch").html());
				var html2 = temp(json);
				$("#productsearch").append(html2);
			});//end json
		});
	});
</script>

<!-- 제품리스트 -->
<script id="item_tmpl" type="text/x-handlebars-template">
{{#each itemlist}}
<tr>
	<td class="text-center"><img src="{{proImg}}" width="100%" /></td>
	<td>{{proClassify}}</td>
	<td>{{proName}}</td>
	<td>{{proPrice}}</td>
	<td>{{stock}}</td>
	<td>{{stuatus}}</td>
	<td>{{content}}</td>
	<td>{{kcal}}</td>
	<td>{{na}}</td>
	<td>{{sugar}}</td>
	<td>{{fat}}</td>
	<td>{{protein}}</td>
	<td>{{proEditDate}}</td>
	<td>{{proRegDate}}</td>								
	<td><button type="button" href="">수정</button>
		<button type="button" href="">삭제</button></td>
</tr>
{{/each}}
</script>

<!-- 제품찾기 -->
<script id="itemsearch" type="text/x-handlebars-template">
<tr>
	<td><img src="../download.do?file={{{proImg}}}" width="100%" /></td>
	<td>{{proClassify}}</td>
	<td>{{proName}}</td>
	<td>{{proPrice}}</td>
	<td>{{stock}}</td>
	<td>{{stuatus}}</td>
	<td>{{content}}</td>
	<td>{{kcal}}</td>
	<td>{{na}}</td>
	<td>{{sugar}}</td>
	<td>{{fat}}</td>
	<td>{{protein}}</td>
	<td>{{proEditDate}}</td>
	<td>{{proRegDate}}</td>							
	<td><button type="button" href="">수정</button>
		<button type="button" href="">삭제</button></td>
</tr>
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="header">
				<div class="Search">
					<form class="form-inline" method="post" id="search" action="">
						<fieldset>
							<div class="form-group">
								<label class="sr-only" for="search"></label> <input
									type="search" class="form-control" id="keyword" name="keyword"
									placeholder="검색할 제품명을 입력하세요">
							</div>
							<button type="submit" class="btn btn-primary">검색</button>
						</fieldset>
					</form>
					<c:choose>
						<c:when test="${resultproduct =! null}">
							<!-- 검색 후 노출될 에이잭스 -->
							<div class="table-responsive-ajax">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<td>이미지</td>
											<td>분류</td>
											<td>제품이름</td>
											<td>제품가격</td>
											<td>수량</td>
											<td>품절상태</td>
											<td style="width:400px">제품설명</td>
											<td>칼로리</td>
											<td>나트륨</td>
											<td>설탕</td>
											<td>지방</td>
											<td>단백질</td>
											<td>최종수정일</td>
											<td>입력일</td>
										</tr>
									</thead>
									<tbody id="productsearch">
									</tbody>
								</table>
							</div>
							<!-- //검색 -->
						</c:when>
					</c:choose>
				</div>
			</div>
			<!-- 페이지 내용 영역 -->
			<div class="col-md-12">
				<ul id="myTab" class="nav nav-tabs">
					<li class="col-md-4 col-sm-4 text-center"><a href="#list"
						data-toggle="tab" data-classify="a">bread</a></li>
					<li class="col-md-4 col-sm-4 text-center"><a href="#list"
						data-toggle="tab" data-classify="b">cake</a></li>
					<li class="col-md-4 col-sm-4 text-center"><a href="#list"
						data-toggle="tab" data-classify="c">cookie</a></li>
				</ul>

				<div class="tab-content">
					<div class="tab-pane active" id="list">
						<table id="jpoom" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<td>이미지</td>
									<td>분류</td>
									<td>제품이름</td>
									<td>제품가격</td>
									<td>수량</td>
									<td>품절상태</td>
									<td style="width:400px">제품설명</td>
									<td>칼로리</td>
									<td>나트륨</td>
									<td>설탕</td>
									<td>지방</td>
									<td>단백질</td>
									<td>최종수정일</td>
									<td>입력일</td>
									<td>관리</td>
								</tr>
							</thead>
							<tbody id="product">
								<!-- ajax -->
							</tbody>
						</table>
					</div>
				</div>

				<!-- 페이지 번호 시작 -->
				<nav class="text-center">
					<ul class="pagination">
						<!-- 이전 그룹으로 이동 -->
						<c:choose>
							<c:when test="${pageHelper.prevPage > 0}">
								<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
								<!-- 이전 그룹으로 이동하기 위한 URL을 생성해서 "prevUrl"에 저장 -->
								<c:url var="prevUrl"
									value="${pageContext.request.contextPath}/PRODUCTLIST.do">
									<c:param name="page" value="${pageHeler.prevPage}"></c:param>
								</c:url>

								<li><a href="${prevUrl}">&laquo;</a></li>
							</c:when>

							<c:otherwise>
								<!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
								<li class="disabled"><a href="#">&laquo;</a></li>
							</c:otherwise>
						</c:choose>

						<!-- 페이지 번호 -->
						<!-- 현재 그룹의 시작페이지~끝페이지 사이를 1씩 증가하면서 반복 -->
						<c:forEach var="i" begin="${pageHelper.startPage}"
							end="${pageHelper.endPage}" step="1">
							<!-- 각 페이지 번호로 이동할 수 있는 URL을 생성하여 page_url 에 저장 -->
							<c:url var="pageUrl"
								value="${pageContext.request.contextPath}/PRODUCTLIST.do">
								<c:param name="page" value="${i}"></c:param>
							</c:url>

							<!-- 반복중의 페이지 번호와 현재 위치한 페이지 번호가 같은 경우에 대한 분기 -->
							<c:choose>
								<c:when test="${pageHelper.page == i}">
									<li class="active"><a href="#">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${pageUrl}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<!-- 다음 그룹으로 이동 -->
						<c:choose>
							<c:when test="${pageHelper.nextPage > 0}">
								<!-- 다음 그룹에 대한 페이지 번호가 존재한다면? -->
								<!-- 다음 그룹으로 이동하기 위한 URL을 생성해서 "nextUrl"에 저장 -->
								<c:url var="nextUrl"
									value="${pageContext.request.contextPath}/PRODUCTLIST.do">
									<c:param name="page" value="${pageHelper.nextPage}"></c:param>
								</c:url>

								<li><a href="${nextUrl}">&raquo;</a></li>
							</c:when>

							<c:otherwise>
								<!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
								<li class="disabled"><a href="#">&raquo;</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
				<!-- // 페이지 번호 끝 -->
				<div></div>
			</div>
		</div>
	</div>
	</div>

	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>

</html>