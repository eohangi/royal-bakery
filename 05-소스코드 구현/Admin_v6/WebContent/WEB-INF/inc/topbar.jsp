<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ include file="/WEB-INF/inc/plugins.jsp"%>

<script type="text/javascript">
$(function(){
	$("#logout").click(function(){
			swal({
			  title: "로그아웃",
			  text: "로그아웃 하겠습니까?",
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
					location.href="${pageContext.request.contextPath}/ADMINLOGOUT.do";
			}else{
				swal.close();
			}
			
			});  
	});
});
</script>


	<div class="titlebar">
		<ul class="list-unstyled navi">
			<li><a id="logout" style="cursor:pointer">로그아웃</a></li>
			<li><a href="${pageContext.request.contextPath}/1Adminclientinfo.do">회원관리</a></li>
			<li><a href="${pageContext.request.contextPath}/Reservation.do?orderCategory=reservation">예약관리</a>
				<ul class="list-unstyled">
					<li><a href="${pageContext.request.contextPath}/Reservation.do?orderCategory=reservation">예약관리</a></li>
					<li><a href="${pageContext.request.contextPath}/Payment.do?orderCategory=pay">주문내역</a></li>
				</ul></li>
			<li><a href="${pageContext.request.contextPath}/PRODUCTINDEX.do">제품관리</a>
				<ul class="list-unstyled">
					<li><a href="${pageContext.request.contextPath}/PRODUCTINDEX.do">일반제품</a></li>
					<li><a href="3Admin_order.jsp">주문제품</a></li>
				</ul></li>
			<li><a href="#">게시판관리</a>
				<ul class="list-unstyled">
					<li><a href="${pageContext.request.contextPath}/bbs/qna_list.do">문의사항</a></li>
					<li><a href="${pageContext.request.contextPath}/bbs/notice_list.do">공지사항 관리</a></li>
				</ul></li>
		</ul>
	</div>