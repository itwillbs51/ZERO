<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jtsage-datebox-bootstrap4@5.3.3/jtsage-datebox.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- header -->
	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
	
	<!-- nav - 메뉴영역 -->
	<nav>
		<a>경매중</a>
		<a>입찰 예정 경매</a>
		<a>종료된 경매</a>
	</nav>
	<hr>
	<nav>
		<a>전체</a>
		<a>럭셔리</a>
		<a>테크</a>
		<a>한정판</a>
	</nav>
	
	<section>
		<!-- 1. 배너 -->
		<article>
			
		</article>
		
		<!-- 2. 컨텐츠 -->
		<article>
			<!-- 2-1. 상품갯수, 검색창, 정렬 -->
			<div>
				<span>상품 nn개</span>
				<input type="search" placeholder="모델명, 브랜드명 등">
				<button>인기순</button>
					<%-- 정렬 방법(기본 : 보이지 않음, 클릭 : style 지우기) --%>
					<ul style="display: none;">
						<li>인기순</li>
						<li>관심 많은 순</li>
						<li>가격순</li>
						<li>임박시간순</li>
						<li>최신순</li>
					</ul>
			</div>
			<!-- 2-2. 상품 목록 -->
			<div>
				<%-- 상품 하나 --%>
				<div class="product_card" style="border: 1px solid black">
					<%-- 클릭 시 상세페이지로 이동(사진, 상품명, 가격 클릭 시 이동) --%>
					<a href="상세페이지로 가는 주소" class="item_inner">
						<div>
							<img alt="조던" src="${pageContext.request.contextPath }/resources/img/p_e1ef5e002eda49adb7f5d0c8a41f798d.webp">
						</div>
						<div class="title">
							<p class="product_info_brand">브랜드명(ex. Jordan)</p>
							<div class="product_info_name">상품명(ex. 조던 1 x 트래비스 스캇 x 프라그먼트 레트로 로우 OG SP 밀리터리 블루)</div>
						</div>
						<div class="price">
							<div>
								<p>입찰가</p>
								<p>10,000원</p>
							</div>
							<div>
								<p>즉시구매가</p>
								<p>150,000원</p>
							</div>
						</div>
					</a>
				</div>
			</div>
		</article>
	</section>
	
	<!-- footer -->
	<footer>
		<div>여기 footer</div>
	</footer>
</body>
</html>