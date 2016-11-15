<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<div class="head">
	<div class="banner" style="background-color: #054931; width:100%; height:187px;">
		<a href="${pageContext.request.contextPath}/MainIndex.do"> <img
			src="${pageContext.request.contextPath}/assets/img/logo12.png"
			alt="logo" />
		</a>
	</div>
	<hr id="top_line" />
	<div class="titlebar">
		<ul class="list-unstyled navi">
			<c:choose>
				<c:when test="${loginInfo == null}">
					<li><a
						href="${pageContext.request.contextPath}/member/Login.do">Login</a></li>
					<li><a
						href="${pageContext.request.contextPath}/member/Join.do">Join</a></li>
				</c:when>
				<c:otherwise>
					<li><a
						href="${pageContext.request.contextPath}/member/LogOut.do">Logout</a></li>
					<li><a
						href="${pageContext.request.contextPath}/mypage/MyPage.do">MyPage</a></li>
				</c:otherwise>
			</c:choose>

				<li><a
				href="${pageContext.request.contextPath}/company/Story.do">Brand
					Story</a>
				<ul class="list-unstyled">
					<li><a
						href="${pageContext.request.contextPath}/company/Story.do">Brand
							Story</a></li>
					<li><a
						href="${pageContext.request.contextPath}/company/Creators.do">The
							Creators</a></li>
				</ul></li>
			<li><a
				href="${pageContext.request.contextPath}/product/productBread.do">Product</a>
				<ul class="list-unstyled">
					<li><a
						href="${pageContext.request.contextPath}/product/productBread.do">bread</a></li>
					<li><a
						href="${pageContext.request.contextPath}/product/productCake.do">cake</a></li>
					<li><a
						href="${pageContext.request.contextPath}/product/productCookie.do">cookie</a></li>
				</ul></li>
			<li><a
				href="${pageContext.request.contextPath}/custom/CustomOrder.do">Order</a></li>
			<li><a
				href="${pageContext.request.contextPath}/bbs.notice/document_list.do">Community</a>
				<ul class="list-unstyled">
					<li><a
						href="${pageContext.request.contextPath}/bbs.notice/document_list.do">공지사항</a></li>
					<li><a
						href="${pageContext.request.contextPath}/bbs.qna/document_list.do">문의하기</a></li>
				</ul></li>

		</ul>
	</div>
</div>