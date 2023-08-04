<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jtsage-datebox-bootstrap4@5.3.3/jtsage-datebox.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/zpay.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<meta charset="UTF-8">
<title>ZERO</title>
<style type="text/css">
	.container {
		padding-bottom: 0;
	}
</style>
<script type="text/javascript">
	//AJAX + JSON 을 활용한 게시물 목록 조회(무한스크롤 기능 포함)
	let pageNum = 1;	// 기본 페이지 번호 미리 저장 - 전역변수(함수 밖에 있음)
	let maxPage = 1;	// 최대페이지 번호를 미리 저장
	
	$(function() {
		// 게시물 목록 조회를 처음 수행하기 위해 문서 로딩 시 loadList() 함수 호출
		// => 검색타입과 검색어를 파라미터로 전달받아 변수에 저장 후 함수 호출 시 파라미터로 전달
		let searchType = $("#searchType").val();
		let searchKeyword = $("#searchKeyword").val();
		
		loadList(searchType, searchKeyword);
		
		// 무한스크롤 기능 추가
		// 웹브라우저의 스크롤바가 바닥에 닿으면 다음 목록 조회를 위해 loadList() 함수 호출
		$(window).on("scroll", function() {	// 스크롤 동작 시 이벤트 처리
	//			console.log("scroll");
		
			// 1. window 객체와 document 객체를 활용하여 스크롤 관련 값 가져와서 제어
			// => 스크롤바의 현재 위치, 문서가 표시되는 창(window)의 높이, 문서 전체 높이
			let scrollTop = $(window).scrollTop();	// 스크롤바 현재 위치
			let windowHeight = $(window).height();	// 브라우저 창의 높이
			let documentHeight = $(document).height();	// 문서의 높이(팡의 높이보다 크거나 같음)
	//			console.log("scrollTop : " + scrollTop + ", windowHeight : " + windowHeight + ", documentHeight : " + documentHeight);
		
			// 2. 스크롤바 위치값 + 창 높이 + x 가 문서 전체 높이(documentHeight) 이상일 경우
			//    다음 페이지 게시물 목록 로딩하여 목록 하단에 추가
			//    => 이 때, x 는 스크롤바의 바닥으로부터의 여유 공간
			//       (즉, x가 클 수록 스크롤바를 더 적게 내려도 다음 목록 로딩)
			//       (만약, x = 1 이면 스크롤바가 바닥에 닿아야만 다음 목록 로딩됨)
			let x = 1;
			if(scrollTop + windowHeight + x >= documentHeight){
				// 다음 페이지 글목록 로딩을 위한 loadList() 함수 호출
				// 이때, 페이지 번호로 사용될 pageNum 값을 1증가시켜 다음 페이지 목록 지정
	//				pageNum++;
	//				loadList(searchType, searchKeyword);
				// ------------------------------------------------------------------------------------
				// 최대 페이지번호를 초과하면 다음 페이지 로딩 요청하지 않도록 처리
				// => pageNum 값이 maxPage 보다 작을 동안 페이지번호 증가하면서 다음 페이지 로딩
				if(pageNum < maxPage) {
					pageNum++;
					loadList(searchType, searchKeyword);
				}else{
	//					alert("다음페이지가 없습니다");
				}
			}
			
			
		});
	});
	
	function loadList(searchType, searchKeyword){
		let url;		
		// ----------------------------------------------------------------------------------------------------------------
		// 자바스크립트에서 키워드 입력 여부를 판별하지 않고 컨트롤러로 요청(컨트롤러에서 판별)
		url= "zpay_main_ajax?pageNum=" + pageNum + "&searchType=" + searchType + "&searchKeyword=" + searchKeyword;
		$.ajax({
			type : "GET", 
			url : url, 
			dataType : "json", 
			success : function(data) {
				// ---------------------------------------------------------------------
				// 글 목록과 최대 페이지번호를 함께 절달받은 경우
				// 1. 최대 페이지 번호 꺼내기(최초 페이지 로딩 시 첫번째 목록과 함께 전달됨)
				maxPage = data.maxPage;	// 무한스크롤 다음 페이지 로딩 과정에서 페이지번호와 비교 시 활용
				console.log(maxPage);
				
				let res = "";
				
				for(let zpayHistory of data.zpayHistoryList){
					res += '<li>'
							+ '<div class="zpayHistoryItem">'
								+ '<div class="zpayHistoryItem_date">'
									+ '<fmt:formatDate value="' + zpayHistory.zpay_time  + 'pattern="MM.dd"/>'
								+ '</div>'
							+ '<div class="zpayHistoryItem_infoArea">'
								+ '<div class="zpayHistoryItem_info">'
// 										if(zpayHistory.zpay_deal_type == '충전' || zpayHistory.zpay_deal_type == '환급'){
// 											+ '<a class="itemTitle itemLink">' + zpayHistory.zpay_deal_type  + '</a>
											
// 										} else {
											+ '<a href="#" class="itemTitle itemLink">' + zpayHistory.zpay_deal_type  + '</a>'				
// 										}
								+ '<div class="zpayHistoryItem_info_sub">'
									+ '<span class="payTime">'
										+ '<fmt:formatDate value="' + zpayHistory.zpay_time  + 'pattern="HH:mm"/>'
									+ '</span>'
									+ '<span class="paymentType">' + zpayHistory.zpay_deal_type + '</span>'
								+ '</div>'
								+ '</div>'
								+ '<div class="zpayHistoryItem_amountArea">'
									+ '<strong class="zpayHistoryItem_amount">'
// 										if(zpayHistory.zpay_deal_type = '충전' || zpayHistory.zpay_deal_type = '중고입금' || zpayHistory.zpay_deal_type = '경매입금'){
											 + '<fmt:formatNumber value="' + zpayHistory.zpay_amount + 'pattern="+ #,##0"/>원'
											
// 										} else {
// 											+ '<fmt:formatNumber value="' + zpayHistory.zpay_amount + 'pattern="- #,##0"/>원'				
// 										}
									+ '</strong>'
									+ '<div class="zpayBalance">'
										+ '<fmt:formatNumber value="' + zpayHistory.zpay_balance + 'pattern="#,##0"/>원'
									+ '</div>'
								+ '</div>'
							+ '</div>'
						+ '</div>'
					+ '</li>'
				}
				
				$(".zpayHistoryListArea > ul").html(res);
				$(".balanceArea .balance").html(comma(data.zpay_balance) + "원");
			}, 
			error : function() {
				alert("글 목록 요청 실패!");
			}
		});
	}


// 	$(function() {
// 		let balance = ${zpay_balance };
				
// 		$(".balanceArea .balance").html(comma(balance) + "원");
// 	});

	function comma(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
		
</script>
</head>
<body>
	<c:set var="pageNum" value="1"/>
	<c:if test="${!empty param.pageNum }">
		<c:set var="pageNum" value="${param.pageNum }"/>
	</c:if>
	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
	<article>
		<div class="container">
			<div class="contentArea">
			<%-- 메인영역 --%>
				<div class="zpayManageArea">
					<div class="profileArea">
						<a class="profileLink" href="#">
							<span class="profileImg">
							</span>
							<span class="profileInfo">
								<strong class="profileName">
									${sessionScope.member_id } 님
<!-- 									홍길동 님 -->
								</strong>
								hong
							</span>
						</a>
					</div>
					<div class="payWalletWidgetArea">
						<div class="zpayArea">
							<div class="balanceArea">
								<strong class="title">
									ZPAY 잔액
								</strong>
								<div class="balance">
								</div>
							</div>
							<div class="zpayLinkArea">
								<div class="zpayChargeLink">
									<a href="zpay_charge_form" class="zpayChargeButton">충전</a>
								</div>
								<div class="zpayRefundLink">
									<a href="zpay_refund_form" class="zpayRefundButton">환급</a>
								</div>
							</div>
						</div>
					</div>
				</div><%-- zpayManageArea 영역 끝 --%>
				<div class="zpayHistoryArea">
					<div class="zpayHistoryFilter">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-sm btn-outline-secondary rounded-pill mr-1 active">
								<input type="radio" name="options" id="option1" autocomplete="off" checked> 전체
							</label>
							<label class="btn btn-sm btn-outline-secondary rounded-pill mr-1">
								<input type="radio" name="options" id="option2" autocomplete="off"> 충전
							</label>
							<label class="btn btn-sm btn-outline-secondary rounded-pill mr-1">
								<input type="radio" name="options" id="option3" autocomplete="off"> 환급
							</label>
						
							<label class="btn btn-sm btn-outline-secondary rounded-pill mr-1">
								<input type="radio" name="options" id="option4" autocomplete="off"> 사용
							</label>
						
							<label class="btn btn-sm btn-outline-secondary rounded-pill mr-1">
								<input type="radio" name="options" id="option5" autocomplete="off"> 수익
							</label>
						</div>
					</div>
					<div class="zpayHistoryDateSelect">
						<input type="date" class="form-control datepicker">
					</div>
					<div class="zpayHistoryPeriodArea">
						총 <strong class="listCount">10</strong> 건
						<span class="listPeriod">
							2023.01.01 ~ 2023.07.29
						</span>
					</div>
					<div class="zpayHistoryListArea">
						<ul>
							<li>
								<div class="zpayHistoryItem">
									<div class="zpayHistoryItem_date">
										07.29
									</div>
									<div class="zpayHistoryItem_infoArea">
										<div class="zpayHistoryItem_info">
											<a href="#" class="itemTitle itemLink">신발</a>
											<div class="zpayHistoryItem_info_sub">
												<span class="payTime">09:00</span>
												<span class="paymentType">사용</span>
											</div>
										</div>
										<div class="zpayHistoryItem_amountArea">
											<strong class="zpayHistoryItem_amount">
												- 10,000원
											</strong>
											<div class="zpayBalance">
												50,000원
											</div>
										</div>
									</div>
								</div>
							</li>
							<c:forEach var="zpayHistory" items="${zpayHistoryList }">
								<li>
									<div class="zpayHistoryItem">
										<div class="zpayHistoryItem_date">
											<fmt:formatDate value="${zpayHistory.zpay_time }" pattern="MM.dd"/>
										</div>
										<div class="zpayHistoryItem_infoArea">
											<div class="zpayHistoryItem_info">
												<c:choose>
													<c:when test="${zpayHistory.zpay_deal_type eq '충전' or zpayHistory.zpay_deal_type eq '환급' }">
														<a class="itemTitle itemLink">${zpayHistory.zpay_deal_type }</a>
													</c:when>
													<c:otherwise>
														<a href="#" class="itemTitle itemLink">${zpayHistory.zpay_deal_type }</a>
													</c:otherwise>
												</c:choose>
												<div class="zpayHistoryItem_info_sub">
													<span class="payTime">
														<fmt:formatDate value="${zpayHistory.zpay_time }" pattern="HH:mm"/>
													</span>
													<span class="paymentType">${zpayHistory.zpay_deal_type }</span>
												</div>
											</div>
											<div class="zpayHistoryItem_amountArea">
												<strong class="zpayHistoryItem_amount">
													<c:choose>
														<c:when test="${zpayHistory.zpay_deal_type eq '충전' or zpayHistory.zpay_deal_type eq '중고입금' or zpayHistory.zpay_deal_type eq '경매입금'}">
															 <fmt:formatNumber value="${zpayHistory.zpay_amount}" pattern="+ #,##0"/>원
														</c:when>
														<c:otherwise>
															 <fmt:formatNumber value="${zpayHistory.zpay_amount}" pattern="- #,##0"/>원
														</c:otherwise>
													</c:choose>
												</strong>
												<div class="zpayBalance">
													 <fmt:formatNumber value="${zpayHistory.zpay_balance}" pattern="#,##0"/>원
												</div>
											</div>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div><%-- zpayHistoryListArea 영역 끝 --%>
				</div><%-- zpayHistoryArea 영역 끝 --%>
			</div><%-- contentArea 영역 끝 --%>
		</div><%-- container 영역 끝 --%>
	</article>
	<footer>
	</footer>

</body>
</html>