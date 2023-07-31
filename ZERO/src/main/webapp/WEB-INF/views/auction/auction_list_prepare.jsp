<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jtsage-datebox-bootstrap4@5.3.3/jtsage-datebox.min.js" type="text/javascript"></script>
<%-- google 아이콘 --%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/aution.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title> ZERO | 경매 </title>
<style type="text/css">
	
	
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script type="text/javascript">
	
	
	// 문서 시작 시 나올 것들
	$(function() {
		
	});		// function() 끝
	
	
	let isOpen = false;
	// 버튼 클릭 시 목록보이게하 함수
	$(function() {
		$(".listInfoBtn").on("click", function() {
			if(!isOpen) { // 목록이 열려있지 않으면
				$(".listSort").css("display", "initial");
				isOpen = true;
			} else {	// 목록 열려있으면
				$(".listSort").css("display", "none");
				isOpen = false;
			}
			
		});	// 버튼 클릭 시 호출되는 함수 끝
		
		// 정렬기준 선택 시 호출되는 함수
		$(".listSort li").on("click", function() {
			$(".listSort i").remove();
			$(this).append(
					'<i class="material-icons">check</i>'
			);
			// 클릭된 목록의 아이디를 판별해 상품 목록 다시 불러오는 ajax
// 			$.ajax({
// 				type: ,
// 				dataType: ,
// 				data: ,
// 				success: function(result) {
// 					alert("불러오기 성공!");
					
// 				},
// 				error: function() {
// 					alert("불러오기 실패!");
// 				}
// 			}); // ajax 끝
			
		});	// onclick 함수 끝
	});	// function 끝
	
	
	
	
</script>
</head>
<body>
	<!-- header -->
	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
	
	<!-- nav - 메뉴영역 -->
	<%-- 크기 조절을 위해 main에 다 넣음 --%>
	<div id="main">
		<nav>
			<a href="auctionList_present">경매중</a>&nbsp;&nbsp;
			<a>입찰 예정 경매</a>&nbsp;&nbsp;
			<a href="auctionList_end">종료된 경매</a>
		</nav>
		<hr>
		<nav>
			<a>전체</a>&nbsp;&nbsp;
			<a>럭셔리</a>&nbsp;&nbsp;
			<a>테크</a>&nbsp;&nbsp;
			<a>한정판</a>
		</nav>
		
		<section>
			<!-- 1. 배너 -->
			<article>
				
			</article>
			
			<!-- 2. 컨텐츠 -->
			<article>
				<!-- 2-1. 상품갯수, 검색창, 정렬 -->
				<div class="listInfo">
					<span class="listInfoCount">상품 nn개</span>
<!-- 					<input type="search" placeholder="모델명, 브랜드명 등"> -->
					<button class="listInfoBtn">
						인기순 <i class="material-icons">swap_vert</i>
					</button>
						<%-- 정렬 방법(기본 : 보이지 않음, 클릭 : style 지우기) --%>
						<ul class="listSort" style="display: none;"> <%-- style="display: none;" --%>
							<li id="list1">인기순 <i class="material-icons">check</i></li>
							<li id="list2">가격순 </li>
							<li id="list3">최신순 </li>
						</ul>
				</div>
				<!-- 2-2. 상품 목록 -->
				<div class="productListArea">
				
					<c:forEach var="i" begin="1" end="6">
						<%-- 상품 하나 --%>
						<div class="product_card_wrap"> 
							<div class="product_card">
								<%-- 클릭 시 상세페이지로 이동(사진, 상품명 클릭 시 이동) --%>
								<a href="auction_detail" class="item_inner">
									<div class="item_img">
										<img alt="..." src="${pageContext.request.contextPath }/resources/img/슬라이드3.jpg">
	<%-- 									<img alt="조던" src="${pageContext.request.contextPath }/resources/img/p_e1ef5e002eda49adb7f5d0c8a41f798d.webp"> --%>
									</div>
									<div class="item_title">
										<p class="product_info_brand">브랜드명(ex. Jordan)</p>
										<div class="product_info_name">상품명(ex. 조던 1 x 트래비스 스캇 x 프라그먼트 레트로 로우 OG SP 밀리터리 블루)</div>
									</div>
								</a>
								<div class="autionTime">
									경매시작까지
									<span>n일 nn시간 nn분</span>
									<div>
										입찰 예정 시간 : YYYY년 MM월 dd일
									</div>
								</div>
								<div class="price row">
									<div class="col">
										입찰가<br>
										<span>10,000원</span>
									</div>
									<div class="col colRight">
										즉시구매가<br>
										<span>150,000원</span>
									</div>
								</div>
								<div class="applyInfos">
									<%-- 입찰자 수 --%>
									<div class="person">
										<i class="material-icons">people</i>
										<span>참가 20명</span>
									</div>
									<%-- 버튼 : 입찰신청, 신청완료 --%>
									<button class="applyBtn">입찰신청</button>
								</div>
							</div> <%-- 상품하나 끝 --%>
						</div>
					</c:forEach>
						
				</div>
					
			</article>
		</section>
	</div>
	
	<!-- footer -->
	<footer>
		<div>여기 footer</div>
	</footer>
</body>
</html>