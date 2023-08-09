<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jtsage-datebox-bootstrap4@5.3.3/jtsage-datebox.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/defualt.css" rel="stylesheet" type="text/css">


<link href="${pageContext.request.contextPath }/resources/css/aution.css" rel="stylesheet" type="text/css">
<%-- google 아이콘 --%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">



<meta charset="UTF-8">
<%-- 반응형웹페이지위한 설정 --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 제이쿼리 -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
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
	
	
	
	
//		console.log("카테고리는 : " + category);
//		console.log("정렬 기준은 " + sort);
	
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
//					alert("다음 페이지가 없습니다!");
			}
		}
		
	}); // window 끝
}); // $(function(){}) 끝







// 목록 불러오는 함수 정의
function loadList(category, sort) {
	let url;
	
	// 컨트롤러로 보낼때 파라미터 처리
	
	//경매예정
	url = "preAuctionListJsonSearch?pageNum=" + pageNum + "&category=" + category + "&sort=" + sort + "&productSearchKeyword=" + ${param.productSearchKeyword};
// 	//경매진행중
// 	url = "nowAuctionListJsonSearch?pageNum=" + pageNum + "&category=" + category + "&sort=" + sort + "&productSearchKeyword=" + ${param.productSearchKeyword};
// 	//경매종료
// 	url = "endAuctionListJsonSearch?pageNum=" + pageNum + "&category=" + category + "&sort=" + sort + "&productSearchKeyword=" + ${param.productSearchKeyword};

	
	
	$.ajax({
		type: "GET",
		url: url,
		dataType: "JSON",
		success: function(data) {
			// 현재는 json 배열안에 json객체로 존재하므로 그냥 boardList를 치면 나오지 않음
//				$("table").after(JSON.stringify(boardList));
			// JSONArray 객체를 사용하여 리턴받은 JSON 데이터(객체)를
			// 반복문을 사용하여 차례대로 접근 후 데이터 출력
			// 번호, 제목, 작성자, 날짜, 조회수
			
			// ------------------------
			// 1. 
			maxPage = data.maxPage;
			console.log(maxPage);
			// => 무한스크롤 시 
//				console.log("maxPage : " + maxPage);
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
//							+ '			<span>n일 nn시간 nn분</span>'
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





</script>
<style>
<style>
#mainArticle {
	margin-top: 700px;
}
.container{
	margin-top:200px;
}
a {
	color:black;
}
h5 p {
	color:gray;
}
h4 {
	margin-bottom:50px;
}




/* 중고 카드 - 포토영역*/
.photoDiv {
	position: relative;
}
/* 찜하기 버튼 (이미지 오버) */
.likebtn { 
		font-size: 1.0rem;
		position: absolute;
		top: 263px;
		left: 10px;
		border-radius: 10%;
/* 		background-color:white; */
		

}
/* 거래상태 버튼(이미지 오버) */
.dealStatus {
		font-size: 0.7rem;
		position: absolute;
		top: 263px;
		right: 0px;
		border-radius: 40%;
}

.card-text{
	text-align: center;
	margin-top: 5px;
}

.card-body{
	font-size:0.9rem;
}


/* 거래가능상품보기 라디오박스? */
.form-check {
	margin-bottom:10px;
	margin-left:10px;
}




/* 탭 css */
ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	color: #222;
}

.tab-content{
	display: none;
	padding: 15px;
}

.tab-content.current{
	display: inherit;
}


/* 목록 카드 css */
.card-img-top{
	width:250x;
	height:300px;
}
row{
	margin:20px;
	padding:20px;
}
/* 카드 카테고리 */
.category {
	color:gray;
	font: bold;
/* 	background-color:lightgray; */
}
.Secondhandcount {
	font-size:15px;
	color:darkgray;
	margin-bottom:20px;
}




/* 경매상품 검색목록 영역*/
.auctionList{
	margin-top:50px;
}
p {
	color:gray;
}
.price{
	margin:0px;
}
.brand{
	font-weight: bold;
}

</style>

</head>
<body>
	<header><%@ include file="inc/header.jsp"%></header>
	
	
	
	<article>
		<div id="mainArticle">
		<div class="container">
		
			<h4> ' ${param.productSearchKeyword } ' 검색 결과 입니다 </h4>
			
			<!-- 검색결과 - 중고상품 리스트 출력 -->
			<div class="secondhandList">
				<h5> 중고 상품 </h5>
				<p> 검색된 상품 ${searchSecondhandCount } 개</p>
				
				<c:choose>
					<c:when test="${searchSecondhandCount eq 0}">
						중고상품 검색 결과가 존재하지 않습니다
					</c:when>
					
					<c:otherwise>
						<div class="row" align="left">
						<c:forEach var="secondhand" items="${searchSecondhandList }">
							<div class="col-lg-3 col-mid-4">
								<div class="card border-0" >
									<!-- 썸네일이미지 -->
									<div class="photoDiv">	
										<a href="secondhand_detail?secondhand_idx=${secondhand.secondhand_idx}&member_id=${secondhand.member_id}">
											<img src="${pageContext.request.contextPath }/resources/upload/${secondhand.secondhand_image1}" class="card-img-top" >
										</a>
										
										<!-- 찜하기 버튼 -->
										<span class="likebtn">
											<a href="#" style="align:right;">
												<img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="30px" height="30px">
											</a>
										</span>
				
										<!-- 거래상태 버튼 -->
										<span class="dealStatus"><button class="btn btn-dark">${secondhand.secondhand_deal_status}</button></span>
									</div>
									
									
									<div class="card-body">
										<!-- 카테고리 가져오기 -->
										<div class="category" style="font-size:0.8rem; ">
											${secondhand.category_name }
										</div>
										
										<div class="card-title" style="white-space: nowrap; overflow:hidden; text-overflow: elipsis;">
											<!-- 제목 링크 -->
											<a href="secondhand_detail?secondhand_idx=${secondhand.secondhand_idx}&member_id=${secondhand.member_id}">
												${secondhand.secondhand_subject}
											</a>
											<!-- 찜하기 버튼 -->
				<!-- 									<br> -->
				<!-- 									<a href="#" style="align:right;"> -->
				<%-- 										<img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="20px" height="20px"> --%>
				<!-- 									</a> -->
										</div>
										<p><fmt:formatNumber pattern="#,###" value="${secondhand.secondhand_price }"/>원</p>
										
										<p>${secondhand.secondhand_first_date }</p>
									</div><!-- cardbody끝 -->
								</div><!-- card끝 -->
								
								</div>
						</c:forEach>
						</div><%--row끝 --%>	
					</c:otherwise>
				</c:choose>
			</div><%-- secondhandList끝 --%>
			
			
		<!-- 검색결과 - 경매상품 리스트 출력 -->
		<div class="auctionList">
			<h5> 경매 상품 </h5>
			<p> 검색된 상품 ${listCount } 개</p>
			
			<c:choose>
				<c:when test="${listCount eq 0}">
					경매 상품 검색 결과가 존재하지 않습니다
				</c:when>
				
				<c:otherwise>
					<div class="row" align="left">
					<c:forEach var="auction" items="${AuctionList }">
						<div class="col-lg-3 col-mid-4">
							<div class="card border-0" >
								<!-- 썸네일이미지 -->
								<div class="photoDiv">	
									<a href="auction_detail?id=${auction.auction_idx}">
										<img alt="상품사진" src="${pageContext.request.contextPath }/resources/upload/${auction.auction_image1}" class="card-img-top">
									</a>
								</div>
								
								
								<div class="card-body">
									<!-- 브랜드명  -->
									<div class="brand" style="font-size:0.8rem; ">
											${auction.brand_name }
									</div>
									<div class="card-title" style="white-space: nowrap; overflow:hidden; text-overflow: elipsis;">
										<!-- 제목 링크 -->
										<a href="auction_detail?id=${auction.auction_idx}">
											${auction.auction_title}
										</a>

									</div>
									<p>경매상태</p>
									<p>입찰최저가 <fmt:formatNumber pattern="#,###" value="${auction.auction_start_price }"/>원</p>
									<p>즉시구매가 <fmt:formatNumber pattern="#,###" value="${auction.auction_max_price }"/>원</p>
									
									<p>${secondhand.secondhand_first_date }</p>
								</div><!-- cardbody끝 -->
							</div><!-- card끝 -->
							
							</div>
					</c:forEach>
					</div><%--row끝 --%>	
				</c:otherwise>
			</c:choose>
		</div><%-- auctionList끝 --%>
			
			
	
	
	
	
	
	
			
			
			

<!-- 			<!-- 검색결과 - 경매 상품 리스트 출력 -->
<!-- 			<hr> -->
<!-- 			<div class="auctionList"> -->
				
<!-- 				<h5> 경매 상품 </h5> -->
<!-- 				<hr> -->
<!-- 				<h6> 경매 예정 상품</h6> -->
				
<!-- 				<p> 검색된 상품  개</p> -->

<!-- 				2. 컨텐츠 -->
<!-- 				<article id="listContainer"> -->
<!-- 					2-1. 상품갯수, 검색창, 정렬 -->
<!-- 					<div class="listInfo"> -->
<!-- 						<span class="listInfoCount">상품 <span id="listCount"></span>개</span> -->
<!-- 	<!-- 					<input type="search" placeholder="모델명, 브랜드명 등"> -->
<!-- 						<button class="listInfoBtn"> -->
<!-- 							인기순 <i class="material-icons">swap_vert</i> -->
<!-- 						</button> -->
<%-- 							정렬 방법(기본 : 보이지 않음, 클릭 : style 지우기) --%>
<%-- 							<ul class="listSort" style="display: none;"> style="display: none;" --%>
<!-- 								<li id="list1" class="selected"><span>인기순</span> <i class="material-icons">check</i></li> -->
<!-- 								<li id="list2"><span>가격순</span> </li> -->
<!-- 								<li id="list3"><span>최신순</span> </li> -->
<!-- 							</ul> -->
<!-- 					</div> -->
<!-- 					2-2. 상품 목록 -->
<!-- 					<div class="productListArea"> -->
	
	
<!-- 					</div> -->
<!-- 				</article> -->
				
				
<!-- 				<hr> -->
<!-- 				<h6> 경매 진행중 상품 </h6> -->
<!-- 					2. 컨텐츠 -->
<!-- 					<article id="listContainer"> -->
<!-- 						2-1. 상품갯수, 검색창, 정렬 -->
<!-- 						<div class="listInfo"> -->
<!-- 							<span class="listInfoCount">상품 <span id="listCount"></span>개</span> -->
<!-- 							<input type="search" placeholder="모델명, 브랜드명 등"> -->
<!-- 							<button class="listInfoBtn"> -->
<!-- 								인기순 <i class="material-icons">swap_vert</i> -->
<!-- 							</button> -->
<%-- 								정렬 방법(기본 : 보이지 않음, 클릭 : style 지우기) --%>
<%-- 								<ul class="listSort" style="display: none;"> style="display: none;" --%>
<!-- 									<li id="list1">인기순 <i class="material-icons">check</i></li> -->
<!-- 									<li id="list2">가격순 </li> -->
<!-- 									<li id="list3">최신순 </li> -->
<!-- 								</ul> -->
<!-- 						</div> -->
<!-- 						2-2. 상품 목록 -->
<!-- 						<div class="productListArea"> -->
						
								
<!-- 						</div> -->
							
<!-- 					</article> -->
				
				
				
				
				
<!-- 				<hr> -->
<!-- 				<h6> 경매 종료된 상품</h6> -->
				
<!-- 					2. 컨텐츠 -->
<!-- 					<article id="listContainer"> -->
<!-- 						2-1. 상품갯수, 검색창, 정렬 -->
<!-- 						<div class="listInfo"> -->
<!-- 							<span class="listInfoCount">상품 <span id="listCount"></span>개</span> -->
<!-- 		<!-- 					<input type="search" placeholder="모델명, 브랜드명 등"> --> 
<!-- 							<button class="listInfoBtn"> -->
<!-- 								인기순 <i class="material-icons">swap_vert</i> -->
<!-- 							</button> -->
<%-- 								정렬 방법(기본 : 보이지 않음, 클릭 : style 지우기) --%>
<%-- 								<ul class="listSort" style="display: none;"> style="display: none;" --%>
<!-- 									<li id="list1">인기순 <i class="material-icons">check</i></li> -->
<!-- 									<li id="list2">가격순 </li> -->
<!-- 									<li id="list3">최신순 </li> -->
<!-- 								</ul> -->
<!-- 						</div> -->
<!-- 						2-2. 상품 목록 -->
<!-- 						<div class="productListArea"> -->
						
<!-- 						</div> -->
							
<!-- 					</article> -->
				
				

<!-- 			</div> -->























			</div><%--container끝 --%>
		</div><%--mainArticle끝 --%>
	</article>
	
	
	
	
	
</body>
</html>