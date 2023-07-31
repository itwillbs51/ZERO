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
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/defualt.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<%-- 반응형웹페이지위한 설정 --%>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>ZERO</title>

<!-- 제이쿼리 -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script type="text/javascript">

	//전역변수 pageNum, maxPage 미리저장
	let pageNum = 1;
	let maxPage = 1;
	
	$(function(){
		
		//목록조회 처음수행위해 문서 로딩시 loadList호출
		let searchType = $("#searchType").val();
		let searchKeyword= $("#searchKeyword").val();
		loadList(searchType, searchKeyword);
		
		// 무한스크롤 추가
		// 스크롤바가 바닥에 닿으면->다음목록조회(loadList())
		$(window).on("scroll", function(){ // 스크롤 동작시 이벤트처리
			console.log("scroll");
			//1.
			let scrollTop = $(window).scrollTop(); // 스크롤바의 현재위치
			let windowHeight = $(window).height(); // 브라우저 창의 높이
			let documentHeight = $(document).height(); // 문서의 높이(창의 높이보다 크거나 같음)
			console.log("scrollTop=" + scrollTop + "windowHeight=" + windowHeight + "documentHeight=" + documentHeight);
			
			//2.x+스크롤바위치값+창높이>문서전체 높이 일경우 ⇒ 다음페이지 게시물목록 로딩 → 하단에 추가			
			let x = 1;
			if(scrollTop + windowHeight + x >= documentHeight){
				// 다음페이지 글 목록 로딩 loadList()호출
				// 스크롤바가 바닥에 닿을때마다 pageNum+1 => 다음페이지목록 지정
				
				//최대페이지 번호 초과시 다음페이지로딩 요청않도록
				if(pageNum < maxPage){
					pageNum++;
					loadList(searchType, searchKeyword);
				} else {
					alert("다음페이지 X");
				}
			}
		});//무한스크롤 이벤트처리 끝
	});
	
	
	
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
	
	
	



	//카테고리, 가격대 선택 탭
	$(document).ready(function(){
		
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');
	
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
	
			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		})
	
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
/* 거래상태 버튼 */
.dealStatus{
		font-size: 1.0rem;
		position: absolute;
		top: 263px;
		right: 0px;

/* 		border: 3px double gray;  */
		border-radius: 30%

}
.card-text{
	text-align: center;
	margin-top: 5px;
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
</style>
</head>
<body>


	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
	<%-- pageNum 파라미터 가져와서 저장(없을 경우 기본값 1로 설정) --%>
	<c:set var="pageNum" value="1" />
	<c:if test="${not empty param.pageNum }">
		<c:set var="pageNum" value="${param.pageNum }" />
	</c:if>



	<article id="mainArticle">
		<div class="container">
		
			<hr>	
			<div class="category">
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1"> 카테고리 선택하기</li>
					<li class="tab-link" data-tab="tab-2"> 가격대 선택하기</li>		
				</ul>
				<!-- 카테고리 선택 영역 -->
				<div id="tab-1" class="tab-content">
					<c:forEach var="category" items="${categorylist }">
						<button class="btn btn-light" style="margin-top:10px;">${category.category_name }</button><br>
					</c:forEach>
				</div>
				<!-- 가격대 선택 영역 -->
				<div id="tab-2" class="tab-content">
					<input type="text" placeholder="최저가"> ~ <input type="text" placeholder="최고가"><button class="btn btn-light"> 적용하기</button>
				</div>
				<!-- 초기화,내상품등록 -->
				<div class="secondhandRegist" align="right" style="margin-top:20px;">
					<button class="btn btn-dark"> 필터초기화 </button>
					<a href="secondhandRegistForm"><button class="btn btn-dark"> 내 상품 등록하기 </button></a>
				</div>
			</div>
			
			<!-- 거래중 상품만 보기 -->
			<div class="form-check form-switch">
     			 <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
      			<label class="form-check-label" for="flexSwitchCheckDefault"> 거래가능 상품만 보기 </label>
    		</div>
			

		<hr>
		<div class="row" align="left">
		<c:forEach var="secondhand" items="${secondhandList }">
			<div class="col-lg-3 col-mid-4">
						<div class="card border-0 shadow-sm" >
							<!-- 썸네일이미지 - 서버 업로드시 경로 필요할수도 -->
							<div class="photoDiv">	
								<a href="secondhand_detail?secondhand_idx=${secondhand.secondhand_idx}">
									<img src="${pageContext.request.contextPath }/resources/upload/${secondhand.secondhand_image1}" class="card-img-top" >
								</a>
								<!-- 거래상태 버튼 -->
								<span class="dealStatus"><button class="btn btn-danger">${secondhand.secondhand_deal_status}</button></span>
							</div>
							<div class="card-body">
								<!-- 카테고리 가져오기 -->
								<input type="hidden" id="secondhand_idx" value="${secondhand.secondhand_idx}">
								<button class="btn btn-light">"${category.category_name}</button>
								
								<div class="card-title" style="white-space: nowrap; overflow:hidden; text-overflow: elipsis;">
									<!-- 제목 링크 -->
									<a href="secondhand_detail?secondhand_idx=${secondhand.secondhand_idx}">
										${secondhand.secondhand_subject}
									</a>
									<!-- 찜하기 버튼 -->
									<a href="#" style="margin-left:50px">
										<img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="20px" height="20px">
									</a>
								</div>
								<p>${secondhand.secondhand_price } 원</p>
								<p>${secondhand.secondhand_first_date }</p>
							</div><!-- cardbody끝 -->
						</div><!-- card끝 -->
				
				</div>
			</c:forEach>
		</div><%--row끝 --%>
							
<!-- 						<div class="card"> -->
<!-- 							<div class="photoDiv"> -->
<!-- 								<a href="secondhand_detail"> -->
<%-- 									<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." > --%>
<!-- 								</a> -->
<!-- 								<span class="dealStatus"><button>판매중</button></span> -->
<!-- 							</div> -->
<!-- 						<div class="card-body"> -->
<!-- 							<button class="btn btn-light">패션/잡화/의류/뷰티</button> -->
<!-- 							<p class="card-text"> -->
<!-- 								<a href="secondhand_detail">제목입니다</a> -->
<%-- 								<a href="#" style="margin-left:50px"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="20px" height="20px"></a> --%>
<!-- 							</p> -->
<!-- 							<p>14,000원</p> -->
<!-- 							<p>2023-08-01 11:00:00</p> -->
<!-- 						</div> -->


		
<!-- 			<div class="row col col-3"> -->
<!-- 				<hr> -->
<!-- 				<div class="productArea"> -->
	
<!-- 					<div class="productListArea"> -->
<!-- 						<div class="card"> -->
<!-- 							<div class="photoDiv"> -->
<%-- 								<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." onclick="location.href='secondhand/secondhand_detail.jsp'"> --%>
<!-- 								<span class="dealStatus"><button>판매중</button></span> -->
<!-- 							</div> -->
<!-- 						<div class="card-body"> -->
<!-- 							<button class="btn btn-light">패션/잡화/의류/뷰티</button> -->
<!-- 							<p class="card-text"> -->
<!-- 								<a href="secondhand/secondhand_detail.jsp">제목입니다</a> -->
<%-- 								<a href="#" style="margin-left:50px"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="20px" height="20px"></a> --%>
<!-- 							</p> -->
<!-- 							<p>14,000원</p> -->
<!-- 							<p>2023-08-01 11:00:00</p> -->
<!-- 						</div> -->
<!-- 						</div> -->
						
						
<!-- 						<div class="card"> -->
<!-- 							<div class="photoDiv"> -->
<%-- 								<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." onclick="location.href='secondhand/secondhand_detail.jsp'"> --%>
<!-- 								<span class="dealStatus"><button>판매중</button></span> -->
<!-- 							</div> -->
<!-- 						<div class="card-body"> -->
<!-- 							<button class="btn btn-light">패션/잡화/의류/뷰티</button> -->
<!-- 							<p class="card-text"> -->
<!-- 								<a href="secondhand/secondhand_detail.jsp">제목입니다</a> -->
<%-- 								<a href="#" style="margin-left:50px"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="20px" height="20px"></a> --%>
<!-- 							</p> -->
<!-- 							<p>14,000원</p> -->
<!-- 							<p>2023-08-01 11:00:00</p> -->
<!-- 						</div> -->
<!-- 						</div> -->
						
						
<!-- 						<div class="card"> -->
<!-- 							<div class="photoDiv"> -->
<%-- 								<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." onclick="location.href='secondhand/secondhand_detail.jsp'"> --%>
<!-- 								<span class="dealStatus"><button>판매중</button></span> -->
<!-- 							</div> -->
<!-- 						<div class="card-body"> -->
<!-- 							<button class="btn btn-light">패션/잡화/의류/뷰티</button> -->
<!-- 							<p class="card-text"> -->
<!-- 								<a href="secondhand/secondhand_detail.jsp">제목입니다</a> -->
<%-- 								<a href="#" style="margin-left:50px"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="20px" height="20px"></a> --%>
<!-- 							</p> -->
<!-- 							<p>14,000원</p> -->
<!-- 							<p>2023-08-01 11:00:00</p> -->
<!-- 						</div> -->
<!-- 						</div> -->
						
<!-- 						<div class="card"> -->
<!-- 							<div class="photoDiv"> -->
<%-- 								<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." onclick="location.href='secondhand/secondhand_detail.jsp'"> --%>
<!-- 								<span class="dealStatus"><button>판매중</button></span> -->
<!-- 							</div> -->
<!-- 						<div class="card-body"> -->
<!-- 							<button class="btn btn-light">패션/잡화/의류/뷰티</button> -->
<!-- 							<p class="card-text"> -->
<!-- 								<a href="secondhand/secondhand_detail.jsp">제목입니다</a> -->
<%-- 								<a href="#" style="margin-left:50px"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="20px" height="20px"></a> --%>
<!-- 							</p> -->
<!-- 							<p>14,000원</p> -->
<!-- 							<p>2023-08-01 11:00:00</p> -->
<!-- 						</div> -->
<!-- 						</div> -->
						
<!-- 						<div class="card"> -->
<!-- 							<div class="photoDiv"> -->
<%-- 								<img src="${pageContext.request.contextPath }/resources/img/슬라이드1.jpg" class="card-img-top" alt="..." onclick="location.href='secondhand/secondhand_detail.jsp'"> --%>
<!-- 								<span class="dealStatus"><button>판매중</button></span> -->
<!-- 							</div> -->
<!-- 						<div class="card-body"> -->
<!-- 							<button class="btn btn-light">패션/잡화/의류/뷰티</button> -->
<!-- 							<p class="card-text"> -->
<!-- 								<a href="secondhand/secondhand_detail.jsp">제목입니다</a> -->
<%-- 								<a href="#" style="margin-left:50px"><img src="${pageContext.request.contextPath }/resources/img/heartIcon.png" width="20px" height="20px"></a> --%>
<!-- 							</p> -->
<!-- 							<p>14,000원</p> -->
<!-- 							<p>2023-08-01 11:00:00</p> -->
<!-- 						</div> -->
<!-- 						</div> -->
						
						
<!-- 					</div> -->
<!-- 				</div> -->
<%-- 			</div>row끝 --%>
		</div><%--container 끝 --%>
		
	</article>
	
	<footer>
	</footer>
</body>

</html>