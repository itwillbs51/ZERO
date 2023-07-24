<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link
	href="${pageContext.request.contextPath }/resources/css/default.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/resources/css/sidebar.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/resources/css/button.css"
	rel="stylesheet" type="text/css">



<meta charset="UTF-8">
<title>마이페이지</title>

<style type="text/css">
</style>


</head>
<body>
	<%--네비게이션 바 영역 --%>
	<header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>

	<%-- 사이드바 --%>
	<!-- 	<nav id="mainNav" class="sidebarArea d-none d-md-block sidebar"> -->
	<%-- 		<jsp:include page="/WEB-INF/views/inc/member_sidebar.jsp"></jsp:include> --%>
	<!-- 	</nav> -->


	<%--본문내용 --%>
	<article id="mainArticle">
		<div class="my_purchase">
			<div class="content_title" data-v-88eb18f6="">
				<div class="title" data-v-88eb18f6="">
					<h3 data-v-88eb18f6="">상품구매 내역</h3>
					<!---->
				</div>
				<!---->
			</div>

			<div class="purchase_list bidding bid" data-v-7a02263e="">
				<div class="empty_area" data-v-6abf8c64="" data-v-7a02263e="">
					<p class="desc" data-v-6abf8c64="">구매 내역이 없습니다.</p>
					<a href="#" class="btn outlinegrey small" data-v-43813796=""
						data-v-6abf8c64=""> SHOP 바로가기 </a>
				</div>
				<div data-v-7a02263e="" class="v-portal" style="display: none;"></div>
			</div>
			<!---->
		</div>
	</article>

<script src="${pageContext.request.contextPath }/resources/mypage_js/49ee6ec.js" defer=""></script>
<script src="${pageContext.request.contextPath }/resources/mypage_js/ac846b6.js" defer=""></script>
<script src="${pageContext.request.contextPath }/resources/mypage_js/bfcc4c4.js" defer=""></script>
<script src="${pageContext.request.contextPath }/resources/mypage_js/2ffe3b9.js" defer=""></script>
<script src="${pageContext.request.contextPath }/resources/mypage_js/e679961.js" defer=""></script>
<script src="${pageContext.request.contextPath }/resources/mypage_js/514df53.js" defer=""></script>
<script src="${pageContext.request.contextPath }/resources/mypage_js/afbbed2.js" defer=""></script>
<script src="${pageContext.request.contextPath }/resources/mypage_js/76e0661.js" defer=""></script>
<link href="${pageContext.request.contextPath }/resources/mypage_css/css/7db96f2.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/mypage_css/bd82ddc.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/mypage_css/81ef50f.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/mypage_css/d2d1f2f.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/mypage_css/8a6891b.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/mypage_css/ddf6c56.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/mypage_css/10a7d17.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/mypage_css/4bb4200.css" rel="stylesheet" type="text/css">

</body>
</html>