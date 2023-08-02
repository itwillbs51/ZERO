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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> ZERO | 경매 </title>
<style type="text/css">
	
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script type="text/javascript">
	
	// ======================= 카운트다운 =======================
	// 오늘 날짜와 시간 가져오기
	let now;
	// 1초마다 카운트 다운 업데이트하는 함수
	function updateCountDown() {
		now = new Date();
		// 카운트다운 할 날짜 선택
		let countDownDate = new Date(now);
		countDownDate.setDate(now.getDate() + 1);
		countDownDate.setHours(0, 0, 0, 0);
		
		// 카운트다운 할 날짜 - 오늘 날짜와 시간
		let distance = countDownDate - now;
		    
		// 남은 시간, 분, 초를 변수에 저장 
		let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
		let seconds = Math.floor((distance % (1000 * 60)) / 1000);
		if(minutes < 10) {
			minutes = "0" + minutes;
		}
		if(seconds < 10) {
			seconds = "0" + seconds;
		}
		// 결과 보여주기 (id가 demo인 태그에)
		$("#demo").text(
				hours + " : " + minutes + " : " + seconds
		);
		    
		// 만약에 카운트다운이 끝나면 나올 텍스트 
		if (distance < 0) {
			clearInterval(x);
			$("#demo").text("EXPIRED");
		}
	}	// updateCountDown() 끝
	// =======================================================
	
	// 카운트
	$(function() {
		// 들어오자마자 실행
		updateCountDown();
		
		// 옥션 시작날짜, 마감날짜 안내
		// 포맷 : 2023년 8월 2일 00:00:00
		$("#autionStart").append(now.getFullYear() + "년 " + (now.getMonth() + 1) + "월 " + now.getDate() + "일 " + "00:00:00");
		$("#autionEnd").append(now.getFullYear() + "년 " + (now.getMonth() + 1) + "월 " + (now.getDate() + 1) + "일 " + "00:00:00");
		
		// 1초마다 호출 (나중에 주석풀기(지금은 정신없어서))
		let x = setInterval(updateCountDown, 1000);
		
	});		// function() 끝
	
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
		url = "nowAuctionListJson?pageNum=" + pageNum + "&category=" + category + "&sort=" + sort;
		
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
				
				for(let product of data.nowAuctionList) {
					let now_price = product.auction_now_price;
					let max_price = product.auction_max_price;
					
					let formatted_now_price = Number(now_price).toLocaleString('en');
					let formatted_max_price = Number(max_price).toLocaleString('en');
					
					// 목록에 표시할 JSON 객체 1개 출력문 생성(= 1개 게시물) => 반복
					$(".productListArea").append(
							'<div class="product_card_wrap"> '
							+ '	<div class="product_card">'
							+ ' 	<a href="auction_detail" class="item_inner">'
							+ '			<div class="item_img">'
							+ '				<img alt="상품사진" src="${pageContext.request.contextPath }/resources/upload/' + product.auction_image1 + '">'
							+ '			</div>'
							+ '			<div class="item_title">'
							+ '				<p class="product_info_brand">' + product.brand_name + '</p>'
							+ '				<div class="product_info_name">' + product.auction_title + '</div>'
							+ '			</div>'
							+ '		</a>'
							+ '		<div class="price row">'
							+ '			<div class="col-4">'
							+ '				현재 입찰가<br>'
							+ '				즉시구매가'
							+ '			</div>'
							+ '			<div class="col-7 colRight">'
							+ '				<span>' + formatted_now_price  + '원</span>'
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
	
	
	
	
</script>
</head>
<body>
	<!-- header -->
	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
	
	<%-- 크기 조절을 위해 main에 다 넣음 --%>
<!-- 	<div class="container"> -->
	<div id="main">
		<!-- nav - 메뉴영역 -->
		<nav>
			<a>경매중</a>&nbsp;&nbsp;&nbsp;
			<a href="auctionList_prepare">입찰 예정 경매</a>&nbsp;&nbsp;&nbsp;
			<a href="auctionList_end">종료된 경매</a>
		</nav>
		<hr>
		<nav id="categoryNav">
			<span class="select">전체</span>&nbsp;&nbsp;&nbsp;
			<span>럭셔리</span>&nbsp;&nbsp;&nbsp;
			<span>테크</span>&nbsp;&nbsp;&nbsp;
			<span>한정판</span>
		</nav>
	
		<section>
			<!-- 1. 배너 -->
			<article>
				<div class="autionNoticeBox">
					<div class="noticeText">
						오늘 경매 종료까지 남은 시간
					</div>
					<div class="countDownTime">
						<h2 id="demo">
						</h2>
					</div>
					<div class="noticeDate">
						<%-- 오늘 날짜, + 1 날짜 안내 --%>
						입찰 시작 시간 : <span id="autionStart"></span>
						<br>
						입찰 종료 시간 : <span id="autionEnd"></span>
					</div>
				</div>
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
							<li id="list1">인기순 <i class="material-icons">check</i></li>
							<li id="list2">가격순 </li>
							<li id="list3">최신순 </li>
						</ul>
				</div>
				<!-- 2-2. 상품 목록 -->
				<div class="productListArea">
				
<%-- 					<c:forEach var="i" begin="1" end="6"> --%>
						<%-- 상품 하나 --%>
<!-- 						<div class="product_card_wrap">  -->
<!-- 							<div class="product_card"> -->
								<%-- 클릭 시 상세페이지로 이동(사진, 상품명 클릭 시 이동) --%>
<!-- 								<a href="auction_detail" class="item_inner"> -->
<!-- 									<div> -->
<%-- 										<img alt="..." src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg"> --%>
<%-- 										<img alt="조던" src="${pageContext.request.contextPath }/resources/img/p_e1ef5e002eda49adb7f5d0c8a41f798d.webp"> --%>
<!-- 									</div> -->
<!-- 									<div class="item_title"> -->
<!-- 										<p class="product_info_brand">브랜드명(ex. Jordan)</p> -->
<!-- 										<div class="product_info_name">상품명(ex. 조던 1 x 트래비스 스캇 x 프라그먼트 레트로 로우 OG SP 밀리터리 블루)</div> -->
<!-- 									</div> -->
<!-- 								</a> -->
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
<!-- 								<div class="applyInfo"> -->
<!-- 									입찰자 수 -->
<!-- 									<div class="person"> -->
<!-- 										<i class="material-icons">people</i> -->
<!-- 										<span>참가 20명</span> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> 상품하나 끝 -->
<!-- 						</div> -->
<%-- 					</c:forEach> --%>
						
				</div>
					
			</article>
		</section>
	</div> <%-- main 끝 --%>
<!-- 	</div> -->
	<!-- footer -->
	<footer>
		<div>여기 footer</div>
	</footer>
</body>
</html>