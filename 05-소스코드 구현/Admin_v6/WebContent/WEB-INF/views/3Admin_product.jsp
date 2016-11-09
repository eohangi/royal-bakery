<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>

<%@ include file="/WEB-INF/inc/head.jsp"%>
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
	/** AJAX로 JSON데이터를 가져와서 화면에 출력하는 함수 ---> req는 JSON 내용. */
	$(function() {
		page(); //페이지가 열림과 동시에 호출된다.
	});
	
	
	function page() {
		//data-deptno 속성의 값을 취득한다.
		console.log("list 검사");
		var current_classify = $("li.active a").data("classify");

		//Ajax요청을 통한 제품 데이터 조회
		$.get('../product/productList.do', {
			classify : current_classify
		}, function(json) {

			//미리 준비한 HTML틀을 읽어온다.
			var template = Handlebars.compile($("#image_item_tmpl").html());
			//Ajax를 통해서 읽어온 JSON내부의 배열 데이터를 템플릿에 병합한다.
			var html = template(json);
			//완성품을 출력한다.
			$("#list").html(html).find(".detail").hide();

		});
	}
	
	$(function(){
		$("#search").submit(function(e){
			e.preventDefault();
			var word = $("input[name='keyword']").val();
			if(!word){
				alert("검색어를 입력하세요");
				$("input[name='keyword']").focus();
				return false;
			}
			$.post("${pageContext.request.contextPath}/SEARCHMEMBER.do",
					{keyword:word},
					function(json){
						var temp = Handlebars.compile($("#item").html());
						var html2 = temp(json);
						$("#member").append(html2);
					});//end json
		});//end submit
	});//end function
	
	//한종이 참고해
	$(function(){
		$(document).on("click","#outok",function(e){
			var mem_id = $("#outok").val();
			console.log("동적 클릭 이벤트 발생시 >>>>>>>>>>>>>>>>>>>>>>>>"+mem_id);
			swal({
				  title: "회원탈퇴",
				  text: "정말 탈퇴시키겠습니까?",
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
						location.href="${pageContext.request.contextPath}/OUTOK.do?mem_id="+mem_id;
				}else{
					swal.close();
				}
				
				});  
		});
	});
	
</script>
</head>
<body>
	<%@ include file="/WEB-INF/inc/topbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="header">
				<div class="Search">
					<form class="form-inline" method="post" id="search" action="">
						<fieldset>
							<div class="form-group">
								<label class="sr-only" for="search"></label> <input
									type="search" class="form-control" id="keyword" name="keyword" 
									placeholder="검색할 회원의 아이디를 입력하세요.">
							</div>
							<button type="submit" class="btn btn-primary">검색</button>
						</fieldset>
					</form>
				<c:choose>
					<c:when test="${resultmember =! null}">
				<!-- 검색 후 노출될 에이잭스 -->
				<div class="table-responsive-ajax">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<td class="text-center">이미지</td>
							<td class="text-center">분류</td>
							<td class="text-center">제품이름</td>
							<td class="text-center">제품가격</td>
							<td class="text-center">수량</td>
							<td class="text-center">품절상태</td>
							<td class="text-center">제품설명</td>
							<td class="text-center">칼로리</td>
							<td class="text-center">나트륨</td>
							<td class="text-center">설탕</td>
							<td class="text-center">지방</td>
							<td class="text-center">단백질</td>
							<td class="text-center">최종수정일</td>
							<td class="text-center">입력일</td>
						</tr>
					</thead>
					<tbody id="member">
						<script id="item" type="text/x-handlebars-template">
							<tr>
								<td class="text-center">{{proImg}}</td>
								<td class="text-center">{{proClassify}}</td>
								<td class="text-center">{{proName}}</td>
								<td class="text-center">{{proPrice}}</td>
								<td class="text-center">{{stock}}</td>
								<td class="text-center">{{stuatus}}</td>
								<td class="text-center">{{content}}</td>
								<td class="text-center">{{kcal}}</td>
								<td class="text-center">{{na}}</td>
								<td class="text-center">{{sugar}}</td>
								<td class="text-center">{{fat}}</td>
								<td class="text-center">{{protein}}</td>
								<td class="text-center">{{proEditDate}}</td>
								<td class="text-center">{{proRegDate}}</td>								
								<td class="text-center">
								<a href="">수정</a></td>
								<td class="text-center">
								<a href="">삭제</a></td>
						</tr>
						</script>
					</tbody>
				</table>
			</div>
				<!-- //검색 -->
				</c:when>
				</c:choose>
				</div>
			</div>
			<!-- 페이지 내용 영역 -->
			<div class="col-md-1" id="slide1">
			<h1>슬라이드1</h1>
		</div>
		<div class="col-md-9">
			<ul id="myTab" class="nav nav-tabs">
				<li class="col-md-4 col-sm-4 active text-center">
				<a data-classify="a" data-toggle="tab" href="#list">bread</a></li>
				<li class="col-md-4 col-sm-4 text-center">
				<a data-classify="b" data-toggle="tab" href="#list">cake</a></li>
				<li class="col-md-4 col-sm-4 text-center">
				<a data-classify="c" data-toggle="tab" href="#list">cookie</a></li>
			</ul>
			
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<thead>
					<thead>
						<tr>
							<td class="text-center">이미지</td>
							<td class="text-center">분류</td>
							<td class="text-center">제품이름</td>
							<td class="text-center">제품가격</td>
							<td class="text-center">수량</td>
							<td class="text-center">품절상태</td>
							<td class="text-center">제품설명</td>
							<td class="text-center">칼로리</td>
							<td class="text-center">나트륨</td>
							<td class="text-center">설탕</td>
							<td class="text-center">지방</td>
							<td class="text-center">단백질</td>
							<td class="text-center">최종수정일</td>
							<td class="text-center">입력일</td>
						</tr>
					</thead>
					<tbody id="member">
						<script id="item" type="text/x-handlebars-template">
							<tr>
						{{#each itemlist}}
								<td class="text-center">{{itemlist.proImg}}</td>
								<td class="text-center">{{itemlist.proClassify}}</td>
								<td class="text-center">{{itemlist.proName}}</td>
								<td class="text-center">{{itemlist.proPrice}}</td>
								<td class="text-center">{{itemlist.stock}}</td>
								<td class="text-center">{{itemlist.stuatus}}</td>
								<td class="text-center">{{itemlist.content}}</td>
								<td class="text-center">{{itemlist.kcal}}</td>
								<td class="text-center">{{itemlist.na}}</td>
								<td class="text-center">{{itemlist.sugar}}</td>
								<td class="text-center">{{itemlist.fat}}</td>
								<td class="text-center">{{itemlist.protein}}</td>
								<td class="text-center">{{itemlist.proEditDate}}</td>
								<td class="text-center">{{itemlist.proRegDate}}</td>								
								<td class="text-center">
								<a href="">수정</a></td>
								<td class="text-center">
								<a href="">삭제</a></td>
						</tr>
						{{/each}}
						</script>
					</tbody>
				</table>
			</div>

			    <!-- 페이지 번호 시작 -->
                  <nav class="text-center">
                     <ul class="pagination">
                        <!-- 이전 그룹으로 이동 -->
                        <c:choose>
                           <c:when test="${pageHelper.prevPage > 0}">
                              <!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
                              <!-- 이전 그룹으로 이동하기 위한 URL을 생성해서 "prevUrl"에 저장 -->
                              <c:url var="prevUrl" value="/MEMBERLISTBYADMIN.do">                                 
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
                        <c:forEach var="i" begin="${pageHelper.startPage}" end="${pageHelper.endPage}" step="1">
                           <!-- 각 페이지 번호로 이동할 수 있는 URL을 생성하여 page_url 에 저장 -->
                           <c:url var="pageUrl" value="/MEMBERLISTBYADMIN.do">                              
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
                              <c:url var="nextUrl" value="/MEMBERLISTBYADMIN.do">                                 
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

	<%@ include file="/WEB-INF/inc/footer.jsp"%>

</body>

</html>