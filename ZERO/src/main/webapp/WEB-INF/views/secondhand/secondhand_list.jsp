<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jtsage-datebox-bootstrap4@5.3.3/jtsage-datebox.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/defualt.css" rel="stylesheet" type="text/css">


<link href="${pageContext.request.contextPath }/resources/css/aution.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<%-- 반응형웹페이지위한 설정 --%>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>ZERO</title>

<!-- 제이쿼리 -->
<%-- <script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script> --%>
<script type="text/javascript">

	//전역변수 pageNum, maxPage 미리저장
// 	let pageNum = 1;	// 임의로 설정
// 	let maxPage = 1;	// 최대 페이지 번호 미리 저장

	
	//카테고리, 가격대 선택 탭
// 	$(document).ready(function(){
// 		$('ul.tabs li').click(function(){
// 			var tab_id = $(this).attr('data-tab');
			
// 			$('ul.tabs li').removeClass('current');
// 			$('.tab-content').removeClass('current');
		
// 			$(this).addClass('current');
// 			$("#"+tab_id).addClass('current');
// 			})
// 		});
	

	
		
// 		$(function(){
// 			 // 찜하기에 사용
// 			 let sId = $("#sessionId").val();
// 			 let member_type = $("#member_type").val();
			
// 			 //카테고리 셀렉트박스 변경시 해당카테고리 목록으로 리로드
// 			 $(".c_idx option").on("change",function(){
				 	
// 				 //변경된 셀렉트박스 val값 가져와서 저장
// 				 let value = $(".c_idx option option:selected").val();
// 				 let url = '';
				 
// 				 if(value=="${category.category_idx }".trim()){ //value값이 카테고리값과 동일할경우
// 					 url = "categoryList";//요청주소
// 				 }
				 
// 				 $.ajax({
// 					type : "get",
// 					url : url,
// 					dataType : "json",	 
// 				 })
// 				 .done(function(productList){
// 					aler("요청성공");
// 					let res = "";
					
// 					for(let i = 0; i < productList.length; i++) {
// 						//res에 로딩할 목록 저장(상품개수?까지 포함해서 가져오기)
// 						res +=
					
// 					}
// 					//지정한 영역에 로딩할 목록 표시
// 					$(".row").html(res);
// 				 })
// 				 .fail(function(){//요청실패시
// 					 alert("요청실패");
// 				 });//fail끝
				 
// 			 })//셀렉트변경 처리 끝
// 		});//
		
		
		
		//무한스크롤
// 		$(function(){
		
// 		let searchType = $("#searchType").val();
// 		let searchKeyword= $("#searchKeyword").val();
// // 		loadList(searchType, searchKeyword);
		
// 		// 무한스크롤 추가
// 		// 스크롤바가 바닥에 닿으면->다음목록조회(loadList())
// 		$(window).on("scroll", function(){ // 스크롤 동작시 이벤트처리
// 			console.log("scroll");
// 			//1.
// 			let scrollTop = $(window).scrollTop(); // 스크롤바의 현재위치
// 			let windowHeight = $(window).height(); // 브라우저 창의 높이
// 			let documentHeight = $(document).height(); // 문서의 높이(창의 높이보다 크거나 같음)
// 			console.log("scrollTop=" + scrollTop + "windowHeight=" + windowHeight + "documentHeight=" + documentHeight);
			
// 			//2.x+스크롤바위치값+창높이>문서전체 높이 일경우 ⇒ 다음페이지 게시물목록 로딩 → 하단에 추가			
// 			let x = 1;
// 			if(scrollTop + windowHeight + x >= documentHeight){
// 				// 다음페이지 글 목록 로딩 loadList()호출
// 				// 스크롤바가 바닥에 닿을때마다 pageNum+1 => 다음페이지목록 지정
				
// 				//최대페이지 번호 초과시 다음페이지로딩 요청않도록
// 				if(pageNum < maxPage){
// 					pageNum++;
// 					loadList(searchType, searchKeyword);
// 				} else {
// 					alert("다음페이지 X");
// 				}
// 			}
// 		});//무한스크롤 이벤트처리 끝
// 	});
	
	

	
	
	
	
	
	
	

	
// 	function loadList(searchType,searchKeyword){
// 		let url;
// 		// searchKeyword 없을경우, pageNum전달 -> BoardListJson 서블릿 요청
// 		// or pageNum, searchType, searchKeyword 전달
		
// 		// -> 검색타입/검색키워드 존재유무 컨트롤러에서 판별
// 		url="BoardListJson?pageNum=" + pageNum + "&searchType=" + searchType +"&searchKeyword=" + searchKeyword;

// 		$.ajax({
// 			type:"get",
// 			dataType:"json",
// 			url:url,
// 			success:function(data){
				
// 				// 글목록, 최대 페이지 번호를 함께 받은경우
// 				//1. 최대페이지번호 꺼내기
// 				maxPage = data.maxPage; 
// 				console.log("maxPage=" + maxPage)
				
// 				//json 데이터 반복문사용하여 차례접근 후 데이터 출력
// 					for(secondhand of data){
// 						// 테이블에 표시할 JSON 객체 1개 출력문 생성(= 1개 게시물) => 반복
// 						let item = "<tr height='50'>"
// 									+ "<td>" + board.board_num + "</td>" 
// 									+ "<td id='subject'>"
// 										+ space
// 										+ "<a href='BoardDetail?board_num=" + board.board_num + "'>"
// 										+ board.board_subject 
// 										+ "</a>"
// 									+ "</td>" 
// 									+ "<td>" + board.board_name + "</td>" 
// //	 								+ "<td>" + board.board_date + "</td>" 
// 									+ "<td>" + getFormatDate(board.board_date) + "</td>" 
// 									+ "<td>" + board.board_readcount + "</td>" 
// 									+ "</tr>"
// 						$("table").append(item);	
// 					}
// 			},
		
// 	}//loadList함수 끝	


// 	});
	

</script>

<script type="text/javascript">

// 전역변수 (함수바깥에 정의)
let isOpen = false;
let pageNum = 1;	// 임의로 설정
let maxPage = 1;	// 최대 페이지 번호 미리 저장
// 카테고리 변수 정의
    let selectedCategory = "전체";
    let selectedSort = "최신순";

$(function() {
	
	// (처음 들어왔을 때) 목록 불러오기
	// 게시물 목록 조회를 처음 수행하기 위해 문서 로딩 시 loadList() 함수 호출
// 	loadList(category, sort);
	
	
	
	
	//정렬목록 open/close 함수 =============================================================================
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

    
    
    
    
    
    
    
    //정렬기준선택시 해당하는 목록 불러오는 함수===================================================
	// AJAX + JSON을 활용한 게시물 목록 조회(무한스크롤 기능 포함)
	// 정렬기준 선택 시 호출되는 함수
// 	$(".listSort li").on("click", function() {
// 		$(".listSort li").removeClass("selected");
// 		$(this).addClass("selected");
// 		$(".listSort i").remove();
// 		$(this).append(
// 				'<i class="material-icons">check</i>'
// 		);
		
// 		// 정렬기준 변수 정의
// 		sort = $(".selected span").text();	// 인기순, 가격순, 최신순
		
// 		// 목록 불러오기
// 		loadList(category, sort);
		
// 	});	// onclick 함수 끝

    // 정렬 순서 클릭 이벤트
    $(".listSort li").on("click", function () {
      $(".listSort li").find('i').remove();
//       $(this).append('<i class="material-icons">check</i>');
      
      selectedSort = $(this).text().trim();
      loadList(selectedCategory, selectedSort);
      
      $('.listInfoBtn').text(selectedSort + ' ');
      
//       $('<i>', {class: 'material-icons'}).text('swap_vert').appendTo('.listInfoBtn');
      
      $('.listSort').hide(); 
      console.log("정렬 기준은 " + selectedSort);
    });



	
	
	//카테고리선택시 해당하는 목록 불러오는 함수 ===================================================
	// 카테고리 선택 시 클래스 지정해주기
// 	$("#categoryNav span").on("click", function() {
// 		$("#categoryNav span").removeClass("select");
// 		$(this).addClass("select");
// 		category = $(".select").text();
		
// 		// 목록 불러오기
// 		loadList(category, sort);
// 	});

// 	$("#categoryNav span").on("click", function() {
// 		$("#categoryNav span").removeClass("select");
// 		$(this).addClass("select");
// 		category = $(".select").text();

// 		// 목록 불러오기
// 		loadList(category, sort);
// 	});
	    // 카테고리 클릭 이벤트
	$("#categoryNav span").on("click", function () {
	  $("#categoryNav span").removeClass("select");
	  $(this).addClass("select");
	  selectedCategory = $(this).text().trim();
	  loadList(selectedCategory, selectedSort);
	  console.log("카테고리는 : " + selectedCategory);
	});
		
		
		
		
	
	
	// 무한스크롤 기능 추가==========================================================================
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
				loadList(selectedCategory, selectedSort);
			} else {
					alert("다음 페이지가 없습니다!");
			}
		}
		
	}); // window 끝
}); // $(function(){}) 끝







// 목록 불러오는 함수 정의===================================================

function loadList(selectedCategory, selectedSort) {
	console.log(`카테고리: ${category}, 정렬: ${sort}`);
	let url;
	
	// 컨트롤러로 보낼때 파라미터 처리
	url = "secondhandListJson?pageNum=" + pageNum + "&category=" + selectedCategory + "&sort=" + selectedSort;
	
	
	
	
	$.ajax({
		type: "GET",
		url: url,
		dataType: "JSON",
		success: function(data) {
			alert("글목록요청 성공");

			// 1. 
			maxPage = data.maxPage;
			console.log("maxPage : " + maxPage);
			// => 무한스크롤 시 
			
			
			//목록별 상품의 개수 조회 출력
			$("#listCount").text(data.listCount);
			
			// 기존에 있던 리스트 삭제
			$(".productListArea").empty();
			
			//ajax로받아온리스트 for문으로 반복출력하기
			for(let secondhand of data.changedSecondhandList) {
				let price = secondhand.secondhand_price;
				let formatted_price = Number(price).toLocaleString('en');
				
				// 목록에 표시할 JSON 객체 1개 출력문 생성(= 1개 게시물) => 반복
				$(".productListArea").append(
						
						'<div class="col-lg-3 col-mid-4">'
						+'	<div class="card border-0" >'
						<!-- 썸네일이미지 -->
						+'		<div class="photoDiv">	'
						+'			<a href="secondhand_detail?secondhand_idx=' + secondhand.secondhand_idx + '&member_id= ' + secondhand.member_id + '">'
						+'				<img src="${pageContext.request.contextPath }/resources/upload/' + secondhand.secondhand_image1 +'" class="card-img-top" >'
						+'			</a>	'
						<!-- 찜하기 버튼 -->
						+'			<span class="likebtn" data-secondhand-idx="' + secondhand.secondhand_idx + '">'	
						+'				<a href="#" style="align:right;">'	
						+'					<img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="30px" height="30px">'	
						+'				</a>'	
						+'			</span>'		
						<!-- 거래상태 버튼 -->
						+'			<span class="dealStatus"><button class="btn btn-dark">' + secondhand.secondhand_deal_status + '</button></span>'			
						+'		</div>'			
						+'		<div class="card-body">'		
									<!-- 카테고리 가져오기 -->
						+'			<div class="category" style="font-size:0.8rem; ">'
						+				secondhand.category_name
						+'			</div>'			
						+'			<div class="card-title" style="white-space: nowrap; overflow:hidden; text-overflow: elipsis;">'
										<!-- 제목 링크 -->
						+'				<a href="secondhand_detail?secondhand_idx=' + secondhand.secondhand_idx + '&member_id=' + secondhand.member_id + '">'
						+					secondhand.secondhand_subject		
						+'				</a>'
						+'			</div>'			
						+'			<p>' + secondhand.secondhand_price + '원 </p>'			
						+'			<p>' + secondhand.secondhand_first_date + '</p>'
						+'		</div>'
						+'	</div>'
						+'</div>'
								
						
				); //append끝
			}	// for문 종료
			
		}, error: function() {
			alert("글 목록 요청 실패!");
		}
	});	// ajax 끝
	
} // loadList() 끝

//찜하기 - 정의효
$(document).on("click", ".likebtn a", function(e) {
    e.preventDefault(); // 기본 이벤트 동작 막기
    let member_id = "${member_id}"; // 세션에서 현재 로그인한 사용자의 member_id 가져오기
    let secondhand_idx = $(this).closest(".likebtn").data("secondhand-idx"); // 해당 상품의 secondhand_idx 얻기
    let likeStatus = $(this).find("img").data("like-status"); // 현재 클릭한 이미지의 좋아요 상태 얻기
    let likeInfo = {
        "member_id": member_id,
        "secondhand_idx": secondhand_idx,
        "like_status": likeStatus // 현재 찜 상태를 전달 (liked 또는 unliked)
    };

    $.ajax({
        type: "POST",
        url: "secondhandLike",
        data: JSON.stringify(likeInfo),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(response) {
            let heartIcon = $('.likebtn[data-secondhand-idx="' + secondhand_idx + '"]').find("img");
            // 찜 추가 (response.likeStatus == 'liked')
            if (response.likeStatus == 'liked') {
                heartIcon.attr('src', '${pageContext.request.contextPath}/resources/img/fullheartIcon.png')
                    .data('like-status', 'liked');
            } else {
                // 찜 취소 (response.likeStatus == 'unliked')
                heartIcon.attr('src', '${pageContext.request.contextPath}/resources/img/heartIcon.png')
                    .data('like-status', 'unliked');
            }
        },
        error: function() {
            alert("찜 처리 실패");
        }
    });
});


</script>
<style>
#mainArticle {
	margin-top: 150px;
}
a {
	color:black;
}

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
</style>
</head>
<body>

<header><%@ include file="../inc/header.jsp"%></header>
<%-- pageNum 파라미터 가져와서 저장(없을 경우 기본값 1로 설정) --%>
<c:set var="pageNum" value="1" />
<c:if test="${not empty param.pageNum }">
	<c:set var="pageNum" value="${param.pageNum }" />
</c:if>



	<article id="mainArticle">
		<div class="container">
		<hr>
		
		
<!-- 		<div><h1 style="margin-top: 48px;font-size: 30px;"></h1></div> -->
<!-- 			<div class="webWrapper"> -->
<!-- 				<div class="barWrapper"> -->
<!-- 					<div class="FilterBoxWrapper FilterCategory"> -->
<!-- 						<div class="FilterBoxTopic" > -->
<!-- 							<div class="FilterBoxName">#카테고리</div> -->
<!-- 						</div> -->
<!-- 						<img src="https://ccimage.hellomarket.com/img/web/search/filter/blue_arrow.svg" alt="화살표 아래 아이콘" class="FilterBoxArrow"> -->
<!-- 					</div> -->
<!-- 					<div class="FilterBoxWrapper FilterPrice"> -->
<!-- 						<div class="FilterBoxTopic"> -->
<!-- 							<div class="FilterBoxName">#가격</div> -->
<!-- 						</div> -->
<!-- 						<img src="https://ccimage.hellomarket.com/img/web/search/filter/blue_arrow.svg" alt="화살표 아래 아이콘" class="FilterBoxArrow"> -->
<!-- 					</div> -->
		          	 
<!-- 		        거래완료 제외하고 보기 -->
<!-- 					<div class="FilterBoxWrapper FilterCompleted"> -->
<!-- 						<div class="FilterBoxTopic"> -->
<!-- 							<div class="FilterBoxName"><label for="complete"><input type="checkbox" value="checked" id="complete" checked="checked"/>거래 완료 물품 제외</label></div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 		   		</div> -->
<!-- 	         </div> -->
<!-- 		<div id="__next"> -->

<!-- 				<div id="hello" class="tagListWrapper"> -->
<!-- 				<div class="tagListFilterBox"> -->
<!-- 					<div class="tagListReset"> -->
<!-- 						<div class="tagListResetText">필터초기화</div> -->
<!-- 						<img -->
<!-- 							src="https://ccimage.hellomarket.com/img/web/search/filter/refresh.svg" alt="reset" class="tagListResetImg"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		  			<!-- 정렬 -->
<!-- 					<div class="SortListWrapper"> -->
<!-- 						<div class="SortListList" id="default" 	 title="최근 등록순">최근 등록순</div> -->
<!-- 						<div class="SortListList" id="lowPrice"  title="낮은 가격순">낮은 가격순</div> -->
<!-- 						<div class="SortListList" id="highPrice" title="높은 가격순">높은 가격순</div> -->
<!-- 						<div class="SortListList" id="highGrade" title="높은 등급순">높은 등급순</div> -->
<!--                    	</div> -->
<!--                    	현재 정렬 -->
<!--                     <div class="sortSortBox"> -->
<!--                     	<div class="sortSort">최근 등록순</div> -->
<!--                         정렬버튼 이미지 -->
<!--                         <img src="https://ccimage.hellomarket.com/img/web/search/itemList/ico_sort.png" alt="정렬 아이콘" class="sortSortImg"/> -->
<!--                         </div> -->
		
	
		

			<div class="category">
			
					<!-- 카테고리 기본선택 전체 -->
					<nav id="categoryNav">
						<span class="select">전체</span><br><br>
					<c:forEach var="category" items="${categorylist }">
						<span>
						 	${category.category_name }
						 </span>
					</c:forEach>
					</nav>

				
					
					<!--  상품갯수, 정렬 -->
					<div class="listInfo">
					
						<span class="listInfoCount">상품 <span id="listCount"></span>개</span>
						
						<button class="listInfoBtn">
 							최신순 
<!-- <i class="material-icons">swap_vert</i> --> 
						</button>
							<%-- 정렬 방법(기본 : 보이지 않음, 클릭 : style 지우기) --%>
							<ul class="listSort" style="display: none;"> <%-- style="display: none;" --%>
								<li id="list1">최신순 
<!-- 								<i class="material-icons">check</i> -->
								</li>
								<li id="list2">가격순 </li>
								<li id="list3">인기순 </li>
							</ul>
					</div>
			
<!-- 				<ul class="tabs"> -->
<!-- 					<li class="tab-link current" data-tab="tab-1"> 카테고리 선택하기</li> -->
					
<!-- 					<li class="tab-link" data-tab="tab-2"> 가격대 선택하기</li>		 -->
<!-- 				</ul> -->
				
				
				
				
				
<!-- 				카테고리 선택 영역 -->
<!-- 				<div id="tab-1" class="tab-content"> -->
<!-- 					<select class="input-tag" id="c_idx" name="c_idx" style="width: 30%; height: 35px;"> -->
<!-- 						<option value="0">카테고리 선택</option> -->
<%-- 						<c:forEach var="category" items="${categorylist }"> --%>
<%-- 							<option value="${category.category_idx }"> ${category.category_name }</option> --%>
<%-- 						</c:forEach> --%>
<!-- 					</select> -->
<%-- <%-- 					<c:forEach var="category" items="${categorylist }"> --%> 
<%-- <%-- 						<button class="btn btn-light" style="margin-top:10px;">${category.category_name }</button><br> --%> 
<%-- <%-- 					</c:forEach> --%>
<!-- 				</div> -->
				
				

				
				
				
				
				
				
				
				<!-- 가격대 선택 영역 -->
				<div id="tab-2" class="tab-content">
					<input type="text" placeholder="최저가">
					 ~ <input type="text" placeholder="최고가">
					<button type="submit" class="btn btn-light"> 적용하기</button>
				</div>
				
			</div>
			
<!-- 			<!-- 거래중 상품만 보기 -->
<!-- 			<div class="form-check form-switch"> -->
<!--      			 <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault"> -->
<!--       			<label class="form-check-label" for="flexSwitchCheckDefault"> 거래가능 상품만 보기 </label> -->
<!--     		</div> -->
			
			<hr>
			<!-- 상품개수표시 -->
			<div class="Secondhandcount"> 상품 개수 <b style="color:gray;">${listCount }</b> 개</div>
			

			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			

		<!-- 목록표시 영역 -->
		<div class="row" align="left">
			<div class="productListArea">
				<c:forEach var="secondhand" items="${secondhandList }">
					
					<div class="col-lg-3 col-mid-4">
								<div class="card border-0" >
								
									<!-- 썸네일이미지 -->
									<div class="photoDiv">	
										<a href="secondhand_detail?secondhand_idx=${secondhand.secondhand_idx}&member_id=${secondhand.member_id}">
											<%--<img src="${image1 }" class="card-img-top" > --%>
											<%-- <img src="<spring:url value='${secondhand.secondhand_image1}'/>" class="card-img-top"/> --%>
											<img src="${pageContext.request.contextPath }/resources/upload/${secondhand.secondhand_image1}" class="card-img-top" >
											<%-- <img src="<%= request.getContextPath()%> + ${pageContext.request.contextPath }/resources/upload/${secondhand.secondhand_image1} "/> --%>									
											<%-- <img src="http://localhost:8089/zero/${secondhand.secondhand_image1}" class="card-img-top" > --%>
										</a>
										
										<!-- 찜하기 버튼 -->
										<span class="likebtn" data-secondhand-idx="${secondhand.secondhand_idx}">
											<a href="#" style="align:right;">
												<img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="30px" height="30px">
											</a>
										</span>
		
										<!-- 거래상태 버튼 -->
										<span class="dealStatus"><button class="btn btn-dark">${secondhand.secondhand_deal_status}</button></span>
									</div>
									
									
									
									<div class="card-body">
										<!-- 카테고리 가져오기 -->
										<%-- <input type="hidden" id="seoncdhand_idx" value="${secondhand.secondhand_idx}"> --%>
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
				</div><%--productListArea 끝 --%>
			</div><%--row끝 --%>
		</div><%--container 끝 --%>
		
	</article>
	
	<footer>
	</footer>
</body>

</html>