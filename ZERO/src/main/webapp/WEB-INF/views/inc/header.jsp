<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="${pageContext.request.contextPath }/resources/css/header.css" rel="stylesheet" type="text/css">
<nav class="navbar navbar-expand-md fixed-top navbar-light p-0">
	<div id="logo">
		<a href="./">ZERO</a>
	</div>
	<button id="navToggle" class="navbar-toggler collapsed border-0" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
		<div id="headerArea1">
			<div id="headerArea1_inner">
				<ul id="headerArea1_list">
					<li class="headerArea1_item"><a href="cs_main" class="headerArea1_link">고객센터</a></li>
					<li class="headerArea1_item"><a href="#" class="headerArea1_link">관심상품</a></li>
					<li class="headerArea1_item"><a href="#" class="headerArea1_link">알림</a></li>
					<%-- 알림 임시 --%>
<!-- 					<div class="dropdown"> -->
<!-- 						<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!-- 							알림 -->
<!-- 						</a> -->
<!-- 						<div class="dropdown-menu" aria-labelledby="dropdownMenuLink"> -->
<!-- 							<a class="dropdown-item" href="#">Action</a> -->
<!-- 							<a class="dropdown-item" href="#">Another action</a> -->
<!-- 							<a class="dropdown-item" href="#">Something else here</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
					
					<%-- 채팅 임시 --%>
					<li class="headerArea1_item"><a href="chatting" class="headerArea1_link">채팅</a></li>
					<li class="headerArea1_item">
						<c:choose>
							<c:when test="${not empty sessionScope.member_id }">
								<a href="member_mypage_main" class="headerArea1_link">${sessionScope.member_id } 님</a>
							</c:when>
							<c:otherwise>
								<a href="member_login" class="headerArea1_link">로그인</a>					
							</c:otherwise>
						</c:choose>
					</li>
					<li class="headerArea1_item" <c:if test="${empty sessionScope.member_id }">hidden</c:if>><a href="member_logout" class="headerArea1_link">로그아웃</a></li>
					<li class="headerArea1_item"><a href="zman_main" class="headerArea1_link">ZMAN</a></li>
					<li class="headerArea1_item"><a href="admin_main" class="headerArea1_link">관리자</a></li>
					<li class="headerArea1_item"><a href="zpay_main" class="headerArea1_link">ZPAY</a></li>
				</ul>
			</div>
		</div>
		<div id="headerArea2">
			<div id="headerArea2_inner">
				<ul class="navbar-nav ml-auto mr-2 mt-2 mt-md-0">
					<li class="nav-item">
						<a class="nav-link" href="./">Home <span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="secondhand_list">중고거래</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="autionList_present">경매</a>
					</li>
				</ul>
				<form class="form-inline my-2 my-md-0">
					<input class="form-control form-control-sm mr-2 mr-sm-2" type="search" placeholder="Search">
					<button class="btn btn-sm btn-outline-dark my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
		</div>
	</div>
</nav>

