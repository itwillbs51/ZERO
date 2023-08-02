<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script> -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jtsage-datebox-bootstrap4@5.3.3/jtsage-datebox.min.js" type="text/javascript"></script> -->
<%-- google 아이콘 --%>
<!-- <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> -->
<%-- <link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet" type="text/css"> --%>
<%-- <link href="${pageContext.request.contextPath }/resources/css/aution.css" rel="stylesheet" type="text/css"> --%>
<!-- <meta charset="UTF-8"> -->
<!-- <title> ZERO | 경매 </title> -->
<!-- <style type="text/css"> -->
	
	
<!-- </style> -->
<%-- <script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script> --%>
<!-- <script type="text/javascript"> -->
	
	
// 	// 문서 시작 시 나올 것들
// 	$(function() {
		
// 	});		// function() 끝
	
	
// 	let isOpen = false;
// 	// 버튼 클릭 시 목록보이게하 함수
// 	$(function() {
// 		$(".listInfoBtn").on("click", function() {
// 			if(!isOpen) { // 목록이 열려있지 않으면
// 				$(".listSort").css("display", "initial");
// 				isOpen = true;
// 			} else {	// 목록 열려있으면
// 				$(".listSort").css("display", "none");
// 				isOpen = false;
// 			}
			
// 		});	// 버튼 클릭 시 호출되는 함수 끝
		
// 		// 정렬기준 선택 시 호출되는 함수
// 		$(".listSort li").on("click", function() {
// 			$(".listSort li").removeClass("selected");
// 			$(this).addClass("selected");
// 			$(".listSort i").remove();
// 			$(this).append(
// 					'<i class="material-icons">check</i>'
// 			);
// 			// 클릭된 목록의 아이디를 판별해 상품 목록 다시 불러오는 ajax
// // 			$.ajax({
// // 				type: ,
// // 				dataType: ,
// // 				data: ,
// // 				success: function(result) {
// // 					alert("불러오기 성공!");
					
// // 				},
// // 				error: function() {
// // 					alert("불러오기 실패!");
// // 				}
// // 			}); // ajax 끝
			
// 		});	// onclick 함수 끝
// 	});	// function 끝
	
	
	
	
<!-- </script> -->

<!-- <script type="text/javascript"> -->
// 	// 전역변수 (함수바깥에 정의)
// 	let pageNum = 1;	// 임의로 설정
// 	let maxPage = 1;	// 최대 페이지 번호 미리 저장
	
// 	// AJAX + JSON을 활용한 게시물 목록 조회(무한스크롤 기능 포함)
// 	$(function() {
// 		// 게시물 목록 조회를 처음 수행하기 위해 문서 로딩 시 loadList() 함수 호출
		
// 		// 카테고리 변수 정의
// 		let category;
// 		// 카테고리 선택 시 클래스 지정해주기
// 		$("#categoryNav a").on("click", function() {
// 			$("#categoryNav a").removeClass("select");
// 			$(this).addClass("select");
// 		});
		
// 		category = $(".select").text();
// 		let category_idx;
// 		switch (category) {
// 			case '전체' :
// 				category_idx = 0;
// 				break;
// 			case '럭셔리' :
// 				category_idx = 6;
// 				break;
// 			case '테크' :
// 				category_idx = 7;
// 				break;
// 			case '한정판' :
// 				category_idx = 8;
// 				break;
// 		}
// 		console.log(category + "의 번호는 " + category_idx);
		
// 		// 정렬기준 변수 정의
// 		let sort = $(".selected").text();	// 인기순, 가격순, 최신순
// 		console.log("정렬 기준은 " + sort);
		
// 		// 목록 불러오기
// 		loadList(category_idx, sort);
		
// 		// 무한스크롤 기능 추가
// 		// 웹브라우저의 스크롤바가 바닥에 닿으면 다음 목록 조회를 위해 loadList() 함수 호출
// 		$(window).on("scroll", function() {
			
// 			// 1. window 객체와 document 객체를 활용하여 스크롤 관련 값 가져와서 제어
// 			// => 스크롤바의 현재 위치, 문서가 표시되는 창(window)의 높이, 문서 전체 높이
// 			let scrollTop = $(window).scrollTop();	// 스크롤바 현 높이(위치)를 가지고 옴
// 			let windowHeight = $(window).height();	// 브라우저 창의 높이
// 			let documentHeight = $(document).height();	// 문서의 높이(창의 높이보다 크거나 같음)
// // 			console.log("scrollTop = " + scrollTop);
// // 			console.log("windowHeight = " + windowHeight);
// // 			console.log("documentHeight = " + documentHeight);
			
// 			// 2. 스크롤바 위치값 + 창높이 + x 가 문서 전체 높이(documentHeight) 이상일 경우
// 			//		다음 페이지 게시물 목록 로딩하여 목록 하단에 추가
// 			//		=> 
// 			let x = 50;	// 픽셀단위(여유값)
// 			if (scrollTop + windowHeight + x >= documentHeight) {
// 				// 다음 페이지 글목록 로딩을 위한 
// 				// 
// // 				pageNum++;
// // 				loadList(searchType, searchKeyword);
// 				// => 이러면 더이상 요청할 페이지가 없어도 작동함(쓸데없는 요청이 계속 들어옴)
				
// 				// 최대 페이지번호를 초과하면
// 				if(pageNum < maxPage) {
// 					pageNum++;
// 					loadList(searchType, searchKeyword);
// 				} else {
// // 					alert("다음 페이지가 없습니다!");
// 					// 말고 목록 맨 위로 오기 하고 html(버튼) 해서 올라가게 하는 거 만들어도 좋음
// 				}
// 			}
			
			
// 		}); // window 끝
		
// 	});
	
	
// 	function loadList(category_idx, sort) {
// 		let url;
		
// 		// 컨트롤러로 보낼때 파라미터 처리
// 		url = "preAuctionListJson?pageNum=" + pageNum + "&category_idx=" + category_idx
// 					+ "&sort=" + sort;
		
// 		$.ajax({
// 			type: "GET",
// 			url: url,
// 			dataType: "JSON",
// 			success: function(data) {
// 				// 현재는 json 배열안에 json객체로 존재하므로 그냥 boardList를 치면 나오지 않음
// // 				$("table").after(JSON.stringify(boardList));
// 				// JSONArray 객체를 사용하여 리턴받은 JSON 데이터(객체)를
// 				// 반복문을 사용하여 차례대로 접근 후 데이터 출력
// 				// 번호, 제목, 작성자, 날짜, 조회수
				
// 				// ------------------------
// 				// 1. 
// 				maxPage = data.maxPage;	
// 				// => 무한스크롤 시 
// // 				console.log("maxPage : " + maxPage);
				
// 				for(let product of data.preAuctionList) {
					
// 					// board객체의 board_re_lev값이 0보다 크면
// 					// 제목열에 해당 값만큼 공백(&nbsp;) 추가 후 공백 뒤에 답글 아이콘 이미지(re.gif) 추가
// 					let space = "";
// // 					if(product.board_re_lev > 0) {
// // 						// 반복문 사용해 board_re_lev 만큼 공백추가
// // 						for(let i = 0; i < board.board_re_lev; i++) {
// // 							space += "&nbsp;&nbsp;"
// // 						}
// // 						// 반복문 종료 후 답글 아이콘 이미지 추가
// // 						space += "<img src='${pageContext.request.contextPath }/resources/images/re.gif' alt='re:'>";
// // 					}
					
// 					// 목록에 표시할 JSON 객체 1개 출력문 생성(= 1개 게시물) => 반복
// 					$(".productListArea").append(
// 							'<div class="product_card_wrap"> '
// 							+ '	<div class="product_card">'
// 							+ ' 	<a href="auction_detail" class="item_inner">'
// 							+ '			<div class="item_img">'
// 							+ '				<img alt="상품사진" src="${pageContext.request.contextPath }/resources/upload/' + ${product.auction_image1 } + '">'
// 							+ '			</div>'
// 							+ '			<div class="item_title">'
// 							+ '				<p class="product_info_brand">' + ${product.brand_name } + '</p>'
// 							+ '				<div class="product_info_name">' + ${product.auction_title } + '</div>'
// 							+ '			</div>'
// 							+ '		</a>'
// 							+ ' 	<div class="autionTime">'
// 							+ '			경매시작까지'
// 							+ '			<span>n일 nn시간 nn분</span>'
// 							+ '			<div>'
// 							+ '				입찰 예정 시간 : ' + ${product.auction_start_date}
// 							+ '			</div>'
// 							+ '		</div>'
// 							+ '		<div class="price row">'
// 							+ '			<div class="col">'
// 							+ '				입찰 최저가<br>'
// 							+ '				<span>' + ${product.auction_start_price} + '</span>'
// 							+ '			</div>'
// 							+ '			<div class="col colRight">'
// 							+ '				즉시구매가<br>'
// 							+ '				<span>' + ${product.auction_max_price} + '</span>'
// 							+ '			</div>'
// 							+ '		</div>'
// // 							+ '		<div class="applyInfos">'
// // 							+ '			입찰자 수'
// // 							+ '			<div class="person">'
// // 							+ '				<i class="material-icons">people</i>'
<%-- // // 							+ '				<span>참가 ' + ${} + '</span>' --%>
// // 							+ '			</div>'
// // 							+ '			<c:choose>'
// // 							+ '				<c:when test="${not empty sessionScope.member_id">'
// // 							+ '					<button type="button" class="btn btn-outline-danger" id="likeMovie' + ${i.count } + '" data-target="#movie_num' + ${i.count } + '" value="' + ${i.count }+ '" onclick="checkMovie(this, ' + ${i.count } + ')">입찰신청</button>'
// // 							+ '					<input type="hidden" id="clickCk' + ${i.count } + '">'
// // 							+ '				</c:when>'
// // 							+ '				<c:otherwise>'
// // 							+ '					<button type="button" class="btn btn-outline-danger" id="likeMovieNo' + ${i.index } + ' " data-toggle="modal" data-target="#needLogin">입찰신청</button>'
// // 							+ '				</c:otherwise>'
// // 							+ '			</c:choose>'
<%-- // // 							+ '			<button class="applyBtn">' + ${} + '</button>' --%>
// // 							+ '		</div>'
							
// 							+ '	</div>'
// 							+ '</div>'
							
// 					);
// 				}	// for문 종료
				
// 			}, error: function() {
// 				alert("글 목록 요청 실패!");
// 			}
// 		});	// ajax 끝
		
// 	}
	
// 	// 자바스크립트를 통한 문자열 포맷(형식) 변경하기
// 	// => 현재 날짜 및 시각 형식 : "yyyy-MM-dd HH:mm:ss" (ex. 2023-07-07 12:31:30.0)
// 	// => 변경할 날짜 및 시각 형식 : "yy-MM-dd HH:mm" (ex. 23-07-07 12:31)
// 	// => replace() 메서드와 정규표현식 활용하여 포맷 변경 가능
// 	//    정규표현식으로 변경할 부분을 소괄호() 로 감싼 후, 해당 () 부분을 $순서번호 형식으로 지정하여
// 	//    replace() 메서드로 치환
// // 	function getFormatDate(date) { // 문자열로 된 날짜 및 시각 데이터 전달받기
// // 		let targetDate = /(\d\d)(\d\d)-(\d\d)-(\d\d)\s(\d\d):(\d\d):(\d\d).(\d)/g;
// // 		let formatDate = "$2-$3-$4 $5:$6";
// 		// => 연도 숫자 4자리를 2자리씩 분리하여 소괄호로 감싸기(\d\d) => 앞 두자리 제거를 위해 2자리씩 분리
// 		//    나머지 월, 일, 시, 분, 초도 2자리씩 소괄호로 감싸고, 남은 밀리초는 1자리 숫자로 지정
// 		// => 정규표현식에서 각 소괄호 그룹마다 인덱스가 자동으로 부여됨
// 		//    인덱스는 1번부터 시작하며, 변환할 데이터 지정 시 
// 		//    치환할 문자열 대상을 $인덱스번호 형식으로 지정 시 원하는 대상 지정
// 		//    즉, 원하는 대상을 $인덱스번호 를 통해 원하는 형식으로 변경 가능
// 		// => 2번데이터-3번데이터-4번데이터 5번데이터:6번데이터 형식으로 변환
// 		//    연도2자리-월2자리-일2자리 시2자리:분2자리 형식으로 지정("$2-$3-$4 $5:$6")
// // 		return date.replace(targetDate, formatDate); // 전달받은 날짜 및 시각을 지정된 형식으로 변환하여 리턴
// // 	}
	
	
// 	// 입찰 신청하기 받아오기
// 	$(function() {
		
// 		let sId = $("#sessionId").val();
// // 		console.log(sId);
// 		$.ajax ({
// 			type: 'GET',
// 			url: 'likeMovieShow',
// 			data: {'member_id' : sId},
// 			dataType: 'JSON',
// 			success: function(result) {
// // 			console.log(result);
				
// 				for(let i = 1; i <= 4; i++) {
// 					let movieNo = $("" + $("#likeMovie" + i).data("target")).val();	// movie_num
// // 					console.log(movieNo);
					
// 					for(let like of result) {
// 						if(like.movie_num == movieNo) {	// 일치하면
// // 							console.log(i);
// 							$("#likeMovie" + i).removeClass("btn-outline-danger");
// 							$("#likeMovie" + i).addClass("btn-danger");
// 							$("#likeMovie" + i).text("신청완료");
// 							$("#clickCk" + i).attr("disabled", true);
// 						}
// 					}
// 				}
// 			},
// 			error: function() {
// 				console.log("에러");
// 			}
// 		});
		
// 	});// function 끝
	
	
// 	// 입찰 신청하기 기능
// 	function checkMovie(element, i) {
		
// 		let sId = $("#sessionId").val();
// // 		console.log($(element).val());
// 		let movie_num = $("" + $(element).data('target')).val();
// 		let targetId = 'clickCk' + i;
// // 		console.log(targetId);	// 타겟아이디
// 		let isLike = $("#" + targetId).prop("disabled");	// 찜 안했을 땐 false
// // 		console.log(sId);	// 세션아이디 확인
// // 		console.log(movie_num);
// // 		console.log(isLike);
		
// 		$.ajax({
// 			type: 'POST',
// 			url: 'likeMovie',
// 			data: {'member_id': sId, 'movie_num': movie_num, 'isLike': isLike },
// 			dataType: 'JSON',
// 			success : function(result) {
// 				console.log("성공!");
// 				console.log(isLike);
				
// 				if(isLike) {	// 찜 상태가 false면
// 					$(element).removeClass("btn-danger");
// 					$(element).addClass("btn-outline-danger");
// 					$(element).text("입찰신청");
					
// 					// 찜 상태 전환(false로)
// 					$("#" + targetId).attr("disabled", false);
					
// 				} else {	// 찜 상태가 true이면
// 					$(element).removeClass("btn-outline-danger");
// 					$(element).addClass("btn-danger");
// 					$(element).text("신청완료");
					
// 					// 찜 상태 전환(true로)
// 					$("#" + targetId).attr("disabled", true);
// 				}
// 			},
// 			error : function(xhr, status, error) {
// 			    console.error(error);
// 			}
			
// 		});	// ajax끝
		
// 	} // 입찰신청 버튼 클릭 함수 끝
	
	
	
	
<!-- </script> -->


<!-- </head> -->
<!-- <body> -->
<!-- 	<!-- header --> -->
<!-- 	<header> -->
<%-- 		<%@ include file="../inc/header.jsp"%> --%>
<!-- 	</header> -->
	
<!-- 	<!-- nav - 메뉴영역 --> -->
<%-- 	<%-- 크기 조절을 위해 main에 다 넣음 --%> --%>
<!-- 	<div id="main"> -->
<!-- 		<nav> -->
<!-- 			<a href="auctionList_present">경매중</a>&nbsp;&nbsp; -->
<!-- 			<a>입찰 예정 경매</a>&nbsp;&nbsp; -->
<!-- 			<a href="auctionList_end">종료된 경매</a> -->
<!-- 		</nav> -->
<!-- 		<hr> -->
<!-- 		<nav id="categoryNav"> -->
<!-- 			<a class="select">전체</a>&nbsp;&nbsp; -->
<!-- 			<a>럭셔리</a>&nbsp;&nbsp; -->
<!-- 			<a>테크</a>&nbsp;&nbsp; -->
<!-- 			<a>한정판</a> -->
<!-- 		</nav> -->
		
<!-- 		<section> -->
<!-- 			<!-- 1. 배너 --> -->
<!-- 			<article> -->
				
<!-- 			</article> -->
			
<!-- 			<!-- 2. 컨텐츠 --> -->
<!-- 			<article> -->
<!-- 				2-1. 상품갯수, 검색창, 정렬 -->
<!-- 				<div class="listInfo"> -->
<!-- 					<span class="listInfoCount">상품 nn개</span> -->
<!-- <!-- 					<input type="search" placeholder="모델명, 브랜드명 등"> --> -->
<!-- 					<button class="listInfoBtn"> -->
<!-- 						인기순 <i class="material-icons">swap_vert</i> -->
<!-- 					</button> -->
<%-- 						정렬 방법(기본 : 보이지 않음, 클릭 : style 지우기) --%>
<%-- 						<ul class="listSort" style="display: none;"> style="display: none;" --%>
<!-- 							<li id="list1">인기순 <i class="material-icons">check</i></li> -->
<!-- 							<li id="list2">가격순 </li> -->
<!-- 							<li id="list3">최신순 </li> -->
<!-- 						</ul> -->
<!-- 				</div> -->
<!-- 				2-2. 상품 목록 -->
<!-- 				<div class="productListArea"> -->
				
<%-- 					<c:forEach var="i" begin="1" end="6"> --%>
<%-- 						상품 하나 --%>
<!-- 						<div class="product_card_wrap">  -->
<!-- 							<div class="product_card"> -->
<%-- 								클릭 시 상세페이지로 이동(사진, 상품명 클릭 시 이동) --%>
<!-- 								<a href="auction_detail" class="item_inner"> -->
<!-- 									<div class="item_img"> -->
<%-- 										<img alt="..." src="${pageContext.request.contextPath }/resources/img/슬라이드3.jpg"> --%>
<%-- 	<%-- 									<img alt="조던" src="${pageContext.request.contextPath }/resources/img/p_e1ef5e002eda49adb7f5d0c8a41f798d.webp"> --%> --%>
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
						
<!-- 				</div> -->
					
<!-- 			</article> -->
<!-- 		</section> -->
<!-- 	</div> -->
<%-- 	<%-- 메인 영역 --%> --%>
	
<%-- 	<%-- 입찰 신청하기 안내 모달 영역 --%> --%>
<!-- <!-- 	<div class="modal fade" id="needLogin" tabindex="-1" role="dialog" aria-labelledby="needSessionId" aria-hidden="true"> --> -->
<!-- <!-- 	  <div class="modal-dialog modal-dialog-centered" role="document"> --> -->
<!-- <!-- 	    <div class="modal-content"> --> -->
<!-- <!-- 	      <div class="modal-header"> --> -->
<!-- <!-- 	        <h5 class="modal-title" id="needSessionId">찜하기 - 로그인 필요</h5> --> -->
<!-- <!-- 	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> --> -->
<!-- <!-- 	          <span aria-hidden="true">&times;</span> --> -->
<!-- <!-- 	        </button> --> -->
<!-- <!-- 	      </div> --> -->
<%-- <%-- 	      <c:choose> --%> --%>
<%-- <%-- 		    세션에 아이디가 있을 때 --%> --%>
<%-- <%-- 	      	<c:when test="${empty sessionScope.member_id }"> --%> --%>
<!-- <!-- 		      <div class="modal-body text-center" id="modalMsg"> --> -->
<%-- <%-- 		      메세지가 표시되는 부분 --%> --%>
<!-- <!-- 			      로그인이 필요한 작업입니다. 로그인 하시겠습니까? --> -->
<!-- <!-- 		      </div> --> -->
<!-- <!-- 		      <div class="modal-footer justify-content-center"> --> -->
<!-- <!-- 	        	<button type="button" class="btn btn-danger" onclick="location.href='member_login_form'">로그인</button> --> -->
<!-- <!-- 		        <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">아니오</button> --> -->
<!-- <!-- 		      </div> --> -->
<%-- <%-- 	      	</c:when> --%> --%>
<%-- <%-- 		    세션에 아이디가 없을 때 --%> --%>
<%-- <%-- 	        <c:otherwise> --%> --%>
<!-- <!-- 		      <div class="modal-body text-center" id="modalMsg"> --> -->
<%-- <%-- 		      메세지가 표시되는 부분 --%> --%>
<!-- <!-- 			      해당 상품 경매 입찰 등록하시겠습니까?<br> --> -->
<!-- <!-- 			      입찰 시작 n시간 전까지 취소가 가능하며<br> --> -->
<!-- <!-- 			      참가 등록 후 미 참가시 불이익이 있을 수 있습니다.<br> --> -->
<!-- <!-- 			      <b class="importRed">최소 10명</b> 이상 등록해야 입찰이 열립니다.<br> --> -->
<!-- <!-- 			      (이 경매의 경우 Z페이가 100,000원 이상 충전 된 경우만 입찰등록, 경매참가 가능) --> -->
<!-- <!-- 		      </div> --> -->
<!-- <!-- 		      <div class="modal-footer justify-content-center"> --> -->
<!-- <!-- 	        	<button type="button" class="btn btn-danger" onclick="location.href='member_login_form'">로그인</button> --> -->
<!-- <!-- 		        <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">아니오</button> --> -->
<!-- <!-- 		      </div> --> -->
<%-- <%-- 	        </c:otherwise> --%> --%>
<%-- <%--           </c:choose> --%> --%>
<!-- <!-- 	    </div> --> -->
<!-- <!-- 	  </div> --> -->
<!-- <!-- 	</div> --> -->
	
	
	
<!-- 	<!-- footer --> -->
<!-- 	<footer> -->
<!-- 		<div>여기 footer</div> -->
<!-- 	</footer> -->
<!-- </body> -->
<!-- </html> -->