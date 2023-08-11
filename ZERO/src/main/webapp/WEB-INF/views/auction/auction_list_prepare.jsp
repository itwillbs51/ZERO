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
<%-- <script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script> --%>
<script type="text/javascript">
	
	// 전역변수 (함수바깥에 정의)
	let isOpen = false;
	let pageNum = 1;	// 임의로 설정
	let maxPage = 1;	// 최대 페이지 번호 미리 저장
	// 카테고리 변수 정의
	let category;
	let sort = '인기순'; 	// 기본값
	
	$(function() {
		
		// (처음 들어왔을 때) 목록 불러오기
		// 게시물 목록 조회를 처음 수행하기 위해 문서 로딩 시 loadList() 함수 호출
		loadList(category, sort);
		
		// 버튼 클릭 시 정렬 목록보이게하는 함수
		$(".listInfoBtn").on("click", function() {
			if(!isOpen) { // 목록이 열려있지 않으면
				$(".listSort").css("display", "initial");
				isOpen = true;
			} else {	// 목록 열려있으면
				$(".listSort").css("display", "none");
				isOpen = false;
			}
			
		});	// 버튼 클릭 시 호출되는 함수 끝
		
		$(document).on("click", function(event) {
	        const target = $(event.target);
	        if (!target.closest(".listInfoBtn").length && !target.closest(".listSort").length) {
	            $(".listSort").css("display", "none");
	            isOpen = false;
	        }
	    });	 // 정렬 목록이 열려있을 때 다른 곳을 누르면 목록 닫히게 하는 함수
		
		// AJAX + JSON을 활용한 게시물 목록 조회(무한스크롤 기능 포함)
		// 정렬기준 선택 시 호출되는 함수
		$(".listSort li").on("click", function() {
			$(".listSort li").removeClass("selected");
			$(this).addClass("selected");
			$(".listSort i").remove();
			$(this).append(
					'<i class="material-icons">check</i>'
			);
			
			// 정렬기준 변수 정의
			sort = $(".selected span").text();	// 인기순, 가격순, 최신순
			
			// 목록 불러오기
			loadList(category, sort);
			
		});	// onclick 함수 끝
	
		// 카테고리 선택 시 클래스 지정해주기
		$("#categoryNav span").on("click", function() {
			$("#categoryNav span").removeClass("select");
			$(this).addClass("select");
			category = $(".select").text();
			
			// 목록 불러오기
			loadList(category, sort);
		});
		
// 		console.log("카테고리는 : " + category);
// 		console.log("정렬 기준은 " + sort);
		
		// 무한스크롤 기능 추가
		// 웹브라우저의 스크롤바가 바닥에 닿으면 다음 목록 조회를 위해 loadList() 함수 호출
		$(window).on("scroll", function() {
			
			// 1. window 객체와 document 객체를 활용하여 스크롤 관련 값 가져와서 제어
			// => 스크롤바의 현재 위치, 문서가 표시되는 창(window)의 높이, 문서 전체 높이
			let scrollTop = $(window).scrollTop();	// 스크롤바 현 높이(위치)를 가지고 옴
			let windowHeight = $(window).height();	// 브라우저 창의 높이
			let documentHeight = $(document).height();	// 문서의 높이(창의 높이보다 크거나 같음)
			
			// 2. 스크롤바 위치값 + 창높이 + x 가 문서 전체 높이(documentHeight) 이상일 경우
			//		다음 페이지 게시물 목록 로딩하여 목록 하단에 추가
			let x = 50;	// 픽셀단위(여유값)
			if (scrollTop + windowHeight + x >= documentHeight) {
				// 최대 페이지번호를 초과하면
				if(pageNum < maxPage) {
					pageNum++;
					loadList(category, sort);
				} else {
// 					alert("다음 페이지가 없습니다!");
				}
			}
			
		}); // window 끝
	}); // $(function(){}) 끝
	
	// 목록 불러오는 함수 정의
	function loadList(category, sort) {
		let url;
		
		// 컨트롤러로 보낼때 파라미터 처리
		url = "preAuctionListJson?pageNum=" + pageNum + "&category=" + category + "&sort=" + sort;
		
		$.ajax({
			type: "GET",
			url: url,
			dataType: "JSON",
			success: function(data) {
				// 현재는 json 배열안에 json객체로 존재하므로 그냥 boardList를 치면 나오지 않음
// 				$("table").after(JSON.stringify(boardList));
				// JSONArray 객체를 사용하여 리턴받은 JSON 데이터(객체)를
				// 반복문을 사용하여 차례대로 접근 후 데이터 출력
				// 번호, 제목, 작성자, 날짜, 조회수
				
				// ------------------------
				// 1. 
				maxPage = data.maxPage;
				console.log(maxPage);
				// => 무한스크롤 시 
// 				console.log("maxPage : " + maxPage);
				$("#listCount").text(data.listCount);
				
				// 기존에 있던 리스트 삭제
				$(".productListArea").empty();
				
				for(let product of data.preAuctionList) {
					let start_price = product.auction_start_price;
					let max_price = product.auction_max_price;
					
					let formatted_start_price = Number(start_price).toLocaleString('en');
					let formatted_max_price = Number(max_price).toLocaleString('en');
					
					let start_date = new Date(product.auction_start_date);
					start_date.setHours(0, 0, 0, 0);
					
					// 목록에 표시할 JSON 객체 1개 출력문 생성(= 1개 게시물) => 반복
					$(".productListArea").append(
							'<div class="product_card_wrap"> '
							+ '	<div class="product_card">'
							+ ' 	<a href="auction_prepare_detail?id=' + product.auction_idx + '" class="item_inner">'
							+ '			<div class="item_img">'
							+ '				<img alt="상품사진" src="${pageContext.request.contextPath }/resources/upload/' + product.auction_image1 + '">'
							+ '			</div>'
							+ '			<div class="item_title">'
							+ '				<p class="product_info_brand">' + product.brand_name + '</p>'
							+ '				<div class="product_info_name">' + product.auction_title + '</div>'
							+ '			</div>'
							+ '		</a>'
							+ ' 	<div class="autionTime">'
							+ '			경매시작까지'
							+ '			<span>' + updateCountDown(start_date) + '</span> 남았습니다'
// 							+ '			<span>n일 nn시간 nn분</span>'
							+ '			<div>'
							+ '				입찰 예정 시간 : ' + product.auction_start_date
							+ '			</div>'
							+ '		</div>'
							+ '		<div class="price row">'
							+ '			<div class="col-4">'
							+ '				입찰 최저가<br>'
							+ '				즉시구매가'
							+ '			</div>'
							+ '			<div class="col-7 colRight">'
							+ '				<span>' + formatted_start_price  + '원</span><br>'
							+ '				<span>' + formatted_max_price + '원</span>'
							+ '			</div>'
							+ '		</div>'
							
							+ '	</div>'
							+ '</div>'
							
					);
				}	// for문 종료
				
			}, error: function() {
				alert("글 목록 요청 실패!");
			}
		});	// ajax 끝
		
	} // loadList() 끝
	
	// 카운트 다운 업데이트하는 함수
	function updateCountDown(start_date) {
		let now = new Date();
		// 카운트다운 할 날짜 선택
// 		let countDownDate = new Date(now);
// 		countDownDate.setDate(start_date.getDate());
// 		now.setHours(0, 0, 0, 0);
		
		// 카운트다운 할 날짜 - 오늘 날짜와 시간
		let distance = start_date - now;
		    
		// 남은 시간, 분, 초를 변수에 저장 
		let days = Math.floor((distance % (1000 * 60 * 60 * 24 * 30)) / (1000 * 60 * 60 * 24));
		let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
// 		let seconds = Math.floor((distance % (1000 * 60)) / 1000);
		if(minutes < 10) {
			minutes = "0" + minutes;
		}
// 		if(seconds < 10) {
// 			seconds = "0" + seconds;
// 		}
		// 결과 보여주기 (id가 demo인 태그에)
// 		$("#demo").text(
// 				hours + " : " + minutes + " : " + seconds
// 		);
		
		return days + "일 " + hours + "시 " + minutes + "분";
		    
		// 만약에 카운트다운이 끝나면 나올 텍스트 
		if (distance < 0) {
			clearInterval(x);
			
			return "마감";
		}
	}	// updateCountDown() 끝
	
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
		<nav id="auctionStatus">
			<a href="auctionList_present">경매중</a>
			<a id="pageName">입찰 예정 경매</a>
			<a href="auctionList_end">종료된 경매</a>
		</nav>
		<nav id="categoryNav">
			<span class="select">전체</span>
			<span>럭셔리</span>
			<span>테크</span>
			<span>한정판</span>
		</nav>
		
		<section>
			<!-- 1. 배너 -->
			<article>
				
			</article>
			
			<!-- 2. 컨텐츠 -->
			<article id="listContainer">
				<!-- 2-1. 상품갯수, 검색창, 정렬 -->
				<div class="listInfo">
					<span class="listInfoCount">상품 <span id="listCount"></span>개</span>
<!-- 					<input type="search" placeholder="모델명, 브랜드명 등"> -->
					<button class="listInfoBtn">
						인기순 <i class="material-icons">swap_vert</i>
					</button>
						<%-- 정렬 방법(기본 : 보이지 않음, 클릭 : style 지우기) --%>
						<ul class="listSort" style="display: none;"> <%-- style="display: none;" --%>
							<li id="list1" class="selected"><span>인기순</span> <i class="material-icons">check</i></li>
							<li id="list2"><span>가격순</span> </li>
							<li id="list3"><span>최신순</span> </li>
						</ul>
				</div>
				<!-- 2-2. 상품 목록 -->
				<div class="productListArea">
				
<%-- 					<c:forEach var="i" begin="1" end="6"> --%>
<%-- 						상품 하나 --%>
<!-- 						<div class="product_card_wrap">  -->
<!-- 							<div class="product_card"> -->
<%-- 								클릭 시 상세페이지로 이동(사진, 상품명 클릭 시 이동) --%>
<!-- 								<a href="auction_detail" class="item_inner"> -->
<!-- 									<div class="item_img"> -->
<%-- 										<img alt="..." src="${pageContext.request.contextPath }/resources/img/슬라이드3.jpg"> --%>
	<%-- 									<img alt="조던" src="${pageContext.request.contextPath }/resources/img/p_e1ef5e002eda49adb7f5d0c8a41f798d.webp"> --%>
<!-- 									</div> -->
<!-- 									<div class="item_title"> -->
<!-- 										<p class="product_info_brand">브랜드명(ex. Jordan)</p> -->
<!-- 										<div class="product_info_name">상품명(ex. 조던 1 x 트래비스 스캇 x 프라그먼트 레트로 로우 OG SP 밀리터리 블루)</div> -->
<!-- 									</div> -->
<!-- 								</a> -->
<!-- 								<div class="autionTime"> -->
<!-- 									경매시작까지 -->
<!-- 									<span>n일 nn시간 nn분</span> -->
<!-- 									<div> -->
<!-- 										입찰 예정 시간 : YYYY년 MM월 dd일 -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="price row"> -->
<!-- 									<div class="col"> -->
<!-- 										입찰가<br> -->
<!-- 										<span>10,000원</span> -->
<!-- 									</div> -->
<!-- 									<div class="col colRight"> -->
<!-- 										즉시구매가<br> -->
<!-- 										<span>150,000원</span> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="applyInfos"> -->
<%-- 									입찰자 수 --%>
<!-- 									<div class="person"> -->
<!-- 										<i class="material-icons">people</i> -->
<!-- 										<span>참가 20명</span> -->
<!-- 									</div> -->
<%-- 									버튼 : 입찰신청, 신청완료 --%>
<!-- 									<button class="applyBtn">입찰신청</button> -->
<!-- 								</div> -->
<%-- 							</div> 상품하나 끝 --%>
<!-- 						</div> -->
<%-- 					</c:forEach> --%>
						
				</div>
					
			</article>
		</section>
	</div>
	<%-- 메인 영역 --%>
	
	
	
	<!-- footer -->
	<footer>
		<div>여기 footer</div>
	</footer>
</body>
</html>