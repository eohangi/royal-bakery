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
		get_list(); //페이지가 열림과 동시에 호출된다.
	});
	
	
	function get_list() {
		$.get("${pageContext.request.contextPath}/MEMBERLISTBYADMIN.do",
				function(json) {
					var template = Handlebars.compile($("#memberitem").html());
					var html = template(json);
					$("#memberlist").append(html);
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
							<td class="text-center">생년월일</td>
							<td class="text-center">아이디</td>
							<td class="text-center">이름</td>
							<td class="text-center">성별</td>
							<td class="text-center">연락처</td>
							<td class="text-center">가입일자</td>
							<td class="text-center">구매내역</td>
							<td class="text-center">문의내역</td>
							<td class="text-center">회원탈퇴</td>
						</tr>
					</thead>
					<tbody id="member">
						<script id="item" type="text/x-handlebars-template">
							<tr>
								<td class="text-center">{{resultmember.birthdate}}</td>
								<td class="text-center">{{resultmember.mem_id}}</td>
								<td class="text-center">{{resultmember.mem_name}}</td>
								<td class="text-center">{{resultmember.gender}}</td>
								<td class="text-center">{{resultmember.phone_no}}</td>
								<td class="text-center">{{resultmember.reg_date}}</td>
								<td class="text-center">
								<a href="">구매내역</a></td>
								<td class="text-center">
								<a href="">문의내역</a></td>
								<td class="text-center">
								<button type="submit" id="outok" name="outok" 
								value="{{resultmember.mem_id}}">회원탈퇴
								</button></td>
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
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<td class="text-center">생년월일</td>
							<td class="text-center">아이디</td>
							<td class="text-center">이름</td>
							<td class="text-center">성별</td>
							<td class="text-center">연락처</td>
							<td class="text-center">가입일자</td>
							<td class="text-center">구매내역</td>
							<td class="text-center">문의내역</td>
						</tr>
					</thead>
					<tbody id="memberlist">
						<script id="memberitem" type="text/x-handlebars-template">
					{{#each member}}						
							<tr>
								<td class="text-center">{{birthdate}}</td>
								<td class="text-center">{{mem_id}}</td>
								<td class="text-center">{{mem_name}}</td>
								<td class="text-center">{{gender}}</td>
								<td class="text-center">{{phone_no}}</td>
								<td class="text-center">{{reg_date}}</td>
								<td class="text-center">
								<a href="">구매내역</a></td>
								<td class="text-center">
								<a href="">문의내역</a></td>
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