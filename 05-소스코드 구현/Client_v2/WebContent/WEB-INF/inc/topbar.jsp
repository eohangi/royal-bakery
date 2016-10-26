<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<div class="head">
	<div class="banner">
		<a href="${pageContext.request.contextPath}/MainIndex.do"> 
		<img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="logo" />
		</a>
	</div>
	<div class="titlebar">
		<ul class="list-unstyled navi">
			<c:choose>
				<c:when test="${loginInfo == null}">
					<li><a
						href="${pageContext.request.contextPath}/member/Login.do">Login</a></li>
						<li><a href="${pageContext.request.contextPath}/member/Join.do">Join</a></li>
				</c:when>
				<c:otherwise>
					<li><a
						href="${pageContext.request.contextPath}/member/LogOut.do">Logout</a></li>
						<li><a href="${pageContext.request.contextPath}/mypage/MyPage.do">MyPage</a></li>
				</c:otherwise>
			</c:choose>

			<li><a href="Story.jsp">Brand</a>
				<ul class="list-unstyled">
					<li><a href="Story.jsp">Story</a></li>
				</ul></li>
			<li><a href="${pageContext.request.contextPath}/product/productList.do?classify=a">Product</a>
				<ul class="list-unstyled">
					<li><a href="${pageContext.request.contextPath}/product/productList.do?classify=a">bread</a></li>
					<li><a href="${pageContext.request.contextPath}/product/productList.do?classify=b">cake</a></li>
					<li><a href="${pageContext.request.contextPath}/product/productList.do?classify=c">cookie</a></li>
				</ul></li>
			<li><a
				href="${pageContext.request.contextPath}/custom/CustomOrder.do">Order</a></li>
			<li><a href="LoginPage.jsp">Community</a>
				<ul class="list-unstyled">
					<li><a href="${pageContext.request.contextPath}/bbs/document_list.do?category=notice">공지사항</a></li>
					<li><a href="${pageContext.request.contextPath}/bbs/document_list.do?category=qna">문의하기</a></li>
				</ul></li>

		</ul>
	</div>
</div>