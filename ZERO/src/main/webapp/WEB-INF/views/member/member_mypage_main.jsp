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
		<div class="user_membership" data-v-32a5de90="" data-v-412d8616="">
			<div class="user_detail" data-v-32a5de90="">
				<div class="user_thumb" data-v-32a5de90="">
					<img
						src="${pageContext.request.contextPath }/resources/mypage_img/blank_profile.4347742.png"
						alt="사용자 이미지" class="thumb_img" data-v-32a5de90="">
				</div>
				<div class="user_info" data-v-32a5de90="">
					<div class="info_box" data-v-32a5de90="">
						<strong class="name" data-v-32a5de90="">nickname</strong>
						<p class="email" data-v-32a5de90="">kream@kream.co.kr</p>
						<a href="/my/profile-edit" type="button"
							class="btn btn outlinegrey small" data-v-43813796=""
							data-v-32a5de90=""> 프로필 관리 </a><a href="/social/users/@jh786r"
							type="button" class="btn btn btn_my_style outlinegrey small"
							data-v-43813796="" data-v-32a5de90=""> 내 스타일 </a>
					</div>
				</div>
			</div>
			<div class="membership_detail" data-v-32a5de90="">
				<a href="#" class="membership_item disabled" data-v-32a5de90=""><strong
					class="info" data-v-32a5de90=""> 일반 회원 </strong>
					<p class="title" data-v-32a5de90="">회원 등급</p></a><a href="#"
					class="membership_item" data-v-32a5de90=""><strong class="info"
					data-v-32a5de90=""> 0P </strong>
					<p class="title" data-v-32a5de90="">포인트</p></a>
			</div>
		</div>

		<div data-v-6752ceb2="" data-v-412d8616="" class="my_home_title">
			<h3 data-v-6752ceb2="" class="title">구매 내역</h3>
			<a data-v-6752ceb2="" href="/my/buying" class="btn_more"><span
				data-v-6752ceb2="" class="btn_txt">더보기</span> <svg
					data-v-6752ceb2="" xmlns="http://www.w3.org/2000/svg"
					class="icon sprite-icons arr-right-gray">
					<use data-v-6752ceb2=""
						href="/_nuxt/acb390973b7035ca670703769afdcb18.svg#i-arr-right-gray"
						xlink:href="/_nuxt/acb390973b7035ca670703769afdcb18.svg#i-arr-right-gray"></use></svg></a>
		</div>
		<div data-v-412d8616="" class="recent_purchase">
			<div data-v-2cbb289b="" data-v-412d8616="" class="purchase_list_tab">
				<div data-v-2cbb289b="" class="tab_item total">
					<a data-v-2cbb289b="" href="#" class="tab_link"><dl
							data-v-2cbb289b="" class="tab_box">
							<dt data-v-2cbb289b="" class="title">전체</dt>
							<dd data-v-2cbb289b="" class="count">1</dd>
						</dl></a>
				</div>
				<div data-v-2cbb289b="" class="tab_item tab_on">
					<a data-v-2cbb289b="" href="#" class="tab_link"><dl
							data-v-2cbb289b="" class="tab_box">
							<dt data-v-2cbb289b="" class="title">입찰 중</dt>
							<dd data-v-2cbb289b="" class="count">0</dd>
						</dl></a>
				</div>
				<div data-v-2cbb289b="" class="tab_item">
					<a data-v-2cbb289b="" href="#" class="tab_link"><dl
							data-v-2cbb289b="" class="tab_box">
							<dt data-v-2cbb289b="" class="title">진행 중</dt>
							<dd data-v-2cbb289b="" class="count">0</dd>
							<!---->
						</dl></a>
				</div>
				<div data-v-2cbb289b="" class="tab_item">
					<a data-v-2cbb289b="" href="#" class="tab_link"><dl
							data-v-2cbb289b="" class="tab_box">
							<dt data-v-2cbb289b="" class="title">종료</dt>
							<dd data-v-2cbb289b="" class="count">1</dd>
						</dl></a>
				</div>
			</div>
			<div data-v-412d8616="">
				<div data-v-7a02263e="" data-v-412d8616=""
					class="purchase_list all bid">
					<!---->
					<div data-v-7a02263e="">
						<div data-v-e5d3a8ae="" data-v-7a02263e="">
							<div data-v-e5d3a8ae="" class="purchase_list_display_item"
								style="background-color: rgb(255, 255, 255);">
								<div data-v-e5d3a8ae="" class="purchase_list_product">
									<div data-v-e5d3a8ae="" class="list_item_img_wrap">
										<img data-v-e5d3a8ae="" alt="product_image"
											src="https://kream-phinf.pstatic.net/MjAyMzAyMDZfMzcg/MDAxNjc1NjY0Mzk4NTQ2.6DGRP9aD9GJuR6TvwOZe2phJYik3rQqrHmlYDzBiiKgg.bc77zAa3vO710rPZVWw2n2z4LcB-HVTfEY6LfYHlnnQg.PNG/a_289cdc1ea5dc443e8daca7f3d2d8a677.png?type=m"
											class="list_item_img"
											style="background-color: rgb(244, 244, 244);">
										<!---->
									</div>
									<div data-v-e5d3a8ae="" class="list_item_title_wrap">
										<!---->
										<p data-v-e5d3a8ae="" class="list_item_title">Crocs
											Bayaband Clog White Navy</p>
										<p data-v-e5d3a8ae="" class="list_item_description">280(US
											10)</p>
									</div>
								</div>
								<div data-v-e5d3a8ae="" class="list_item_status">
									<div data-v-e5d3a8ae=""
										class="list_item_column column_secondary">
										<p data-v-7b1f182e="" data-v-e5d3a8ae=""
											class="secondary_title display_paragraph"
											style="color: rgba(34, 34, 34, 0.5);">2023/03/15</p>
									</div>
									<div data-v-e5d3a8ae="" class="list_item_column column_last">
										<p data-v-7b1f182e="" data-v-e5d3a8ae=""
											class="last_title display_paragraph"
											style="color: rgb(34, 34, 34);">배송완료</p>
										<p data-v-7b1f182e="" data-v-e5d3a8ae=""
											class="last_description display_paragraph action_named_action"
											style="color: rgba(34, 34, 34, 0.8);">스타일 올리기</p>
									</div>
								</div>
							</div>
							<!---->
						</div>
					</div>
					<!---->
					<div data-v-7a02263e="" class="v-portal" style="display: none;"></div>
				</div>
				<!---->
			</div>
		</div>

		<div data-v-6752ceb2="" data-v-412d8616="" class="my_home_title">
			<h3 data-v-6752ceb2="" class="title">판매 내역</h3>
			<a data-v-6752ceb2="" href="/my/selling" class="btn_more"><span
				data-v-6752ceb2="" class="btn_txt">더보기</span> <svg
					data-v-6752ceb2="" xmlns="http://www.w3.org/2000/svg"
					class="icon sprite-icons arr-right-gray">
					<use data-v-6752ceb2=""
						href="/_nuxt/acb390973b7035ca670703769afdcb18.svg#i-arr-right-gray"
						xlink:href="/_nuxt/acb390973b7035ca670703769afdcb18.svg#i-arr-right-gray"></use></svg></a>
		</div>

		<div data-v-412d8616="" class="recent_purchase">
			<div data-v-2cbb289b="" data-v-412d8616=""
				class="purchase_list_tab sell">
				<div data-v-2cbb289b="" class="tab_item total">
					<a data-v-2cbb289b="" href="#" class="tab_link"><dl
							data-v-2cbb289b="" class="tab_box">
							<dt data-v-2cbb289b="" class="title">전체</dt>
							<dd data-v-2cbb289b="" class="count">0</dd>
						</dl></a>
				</div>
				<div data-v-2cbb289b="" class="tab_item tab_on">
					<a data-v-2cbb289b="" href="#" class="tab_link"><dl
							data-v-2cbb289b="" class="tab_box">
							<dt data-v-2cbb289b="" class="title">입찰 중</dt>
							<dd data-v-2cbb289b="" class="count">0</dd>
						</dl></a>
				</div>
				<div data-v-2cbb289b="" class="tab_item">
					<a data-v-2cbb289b="" href="#" class="tab_link"><dl
							data-v-2cbb289b="" class="tab_box">
							<dt data-v-2cbb289b="" class="title">진행 중</dt>
							<dd data-v-2cbb289b="" class="count">0</dd>
							<!---->
						</dl></a>
				</div>
				<div data-v-2cbb289b="" class="tab_item">
					<a data-v-2cbb289b="" href="#" class="tab_link"><dl
							data-v-2cbb289b="" class="tab_box">
							<dt data-v-2cbb289b="" class="title">종료</dt>
							<dd data-v-2cbb289b="" class="count">0</dd>
						</dl></a>
				</div>
			</div>
			<div data-v-412d8616="">
				<div data-v-7a02263e="" data-v-412d8616=""
					class="purchase_list all ask">
					<!---->
					<div data-v-6abf8c64="" data-v-7a02263e="" class="empty_area">
						<p data-v-6abf8c64="" class="desc">거래 내역이 없습니다.</p>
						<!---->
					</div>
					<div data-v-7a02263e="" class="v-portal" style="display: none;"></div>
				</div>
				<!---->
			</div>
		</div>

		<div data-v-6752ceb2="" data-v-412d8616="" class="my_home_title">
			<h3 data-v-6752ceb2="" class="title">관심 상품</h3>
			<a data-v-6752ceb2="" href="/saved" class="btn_more"><span
				data-v-6752ceb2="" class="btn_txt">더보기</span> <svg
					data-v-6752ceb2="" xmlns="http://www.w3.org/2000/svg"
					class="icon sprite-icons arr-right-gray">
					<use data-v-6752ceb2=""
						href="/_nuxt/acb390973b7035ca670703769afdcb18.svg#i-arr-right-gray"
						xlink:href="/_nuxt/acb390973b7035ca670703769afdcb18.svg#i-arr-right-gray"></use></svg></a>
		</div>

		<div data-v-412d8616="" class="interest_product">
			<!---->
			<div data-v-6abf8c64="" data-v-412d8616="" class="empty_area has_bg">
				<p data-v-6abf8c64="" class="desc">추가하신 관심 상품이 없습니다.</p>
				<a data-v-43813796="" data-v-6abf8c64="" href="#"
					class="btn outlinegrey small"> SHOP 바로가기 </a>
			</div>
		</div>


	</article>

	<script
		src="${pageContext.request.contextPath }/resources/mypage_js/49ee6ec.js"
		defer=""></script>
	<script
		src="${pageContext.request.contextPath }/resources/mypage_js/de88374.js"
		defer=""></script>
	<script
		src="${pageContext.request.contextPath }/resources/mypage_js/bfcc4c4.js"
		defer=""></script>
	<script
		src="${pageContext.request.contextPath }/resources/mypage_js/2ffe3b9.js"
		defer=""></script>
	<script
		src="${pageContext.request.contextPath }/resources/mypage_js/514df53.js"
		defer=""></script>
	<script
		src="${pageContext.request.contextPath }/resources/mypage_js/afbbed2.js"
		defer=""></script>
	<script
		src="${pageContext.request.contextPath }/resources/mypage_js/76e0661.js"
		defer=""></script>
	<link
		href="${pageContext.request.contextPath }/resources/mypage_css/7db96f2.css"
		rel="stylesheet" type="text/css">
	<link
		href="${pageContext.request.contextPath }/resources/mypage_css/bd82ddc.css"
		rel="stylesheet" type="text/css">
	<link
		href="${pageContext.request.contextPath }/resources/mypage_css/815f008.css"
		rel="stylesheet" type="text/css">

</body>
</html>