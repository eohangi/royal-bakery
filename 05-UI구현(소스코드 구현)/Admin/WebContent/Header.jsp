<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!-- jQuery Framework 참조하기 -->
<script src="http://code.jquery.com/jquery.min.js"></script>
	
<link rel="stylesheet" href="plugins/sweetalert/sweetalert.css" />

<script src="plugins/sweetalert/sweetalert.min.js"></script>	

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
					location.href="0Admin_LoginPage.jsp";
			}else{
				location.href="1Admin_client_info.jsp";
			}
			
			});  
	});
});
</script>


	<div class="titlebar">
		<ul class="list-unstyled navi">
			<li><a href="#" id="logout">로그아웃</a></li>
			<li><a href="1Admin_client_info.jsp">회원관리</a></li>
			<li><a href="2Admin_payment.jsp">예약관리</a>
				<ul class="list-unstyled">
					<li><a href="2Admin_payment.jsp">주문내역</a></li>
					<li><a href="2Admin_reservation.jsp">예약관리</a></li>
				</ul></li>
			<li><a href="3Admin_product.jsp">제품관리</a>
				<ul class="list-unstyled">
					<li><a href="3Admin_product.jsp">일반제품</a></li>
					<li><a href="3Admin_order.jsp">주문제품</a></li>
				</ul></li>
			<li><a href="4Admin_com_info.jsp">게시판관리</a>
				<ul class="list-unstyled">
					<li><a href="4Admin_com_info.jsp">회사소개 관리</a></li>
					<li><a href="4Admin_QA.jsp">문의사항</a></li>
					<li><a href="4Admin_information.jsp">공지사항 관리</a></li>
					<li><a href="4Admin_banner.jsp">배너 관리</a></li>
				</ul></li>
		</ul>
	</div>