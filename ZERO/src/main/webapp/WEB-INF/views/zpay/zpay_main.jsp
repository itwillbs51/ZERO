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

	$(function() {
		let balance = ${zpay_balance };		
		$(".balanceArea .balance").html(comma(balance) + "원");
		amountColor();
	});

	
	$(function() {
		
		$(".dealType").on("click", function() {
			$(".dealType").removeClass("active");
			$(this).addClass("active");
			
			let searchType = $(this).val();
			
			$.ajax({
				type : "GET", 
				url : "zpay_main_ajax", 
				data : {searchType : searchType}, 
				dataType : "JSON", 
				success : function(data) {
					
					let res = "";

					for(let zpayHistory of data.zpayHistoryList) {
						res += "<li>" + 
									"<div class='zpayHistoryItem'>" + 
										"<div class='zpayHistoryItem_date'>" + 
											getFormatDate(zpayHistory.zpay_time) + 
										"</div>" + 
										"<div class='zpayHistoryItem_infoArea'>" +
											"<div class='zpayHistoryItem_info'>" + 
												"<a href='#' class='itemTitle itemLink'>" + zpayHistory.zpay_deal_type + "</a>" +
												"<div class='zpayHistoryItem_info_sub'>" +
													"<span class='payTime'>" + getFormatTime(zpayHistory.zpay_time) + "</span>" +
													"<span class='paymentType'>" + zpayHistory.zpay_deal_type + "</span>" +
												"</div>" +
											"</div>" + 
											"<div class='zpayHistoryItem_amountArea'>" +
												"<strong class='zpayHistoryItem_amount' data-dealType='" + zpayHistory.zpay_deal_type + "'>" +
													comma(zpayHistory.zpay_amount) +  "원" +
												"</strong>" +
											"<div class='zpayBalance'>" +
												comma(zpayHistory.zpay_balance) +  "원" +
											"</div>" +
										"</div>" +
									"</div>" +
								"</div>" +
							"</li>"
					}	// for문 끝
					
					$(".zpayHistoryListArea > ul").html(res);
					$(".listCount").html(data.listCount);
					amountColor();
					
				}, // success 끝
				error : function() {
					alert("요청실패");
				}
				
			}); // AJAX 끝
			
			
		});	//  onclick 끝
		
		
	});
	
	// 금액 형식 지정 함수
	function comma(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	
	
	// 날짜 형식 지정 함수
	function getFormatDate(date){	// 문자열로 된 날짜 및 시각 데이터 전달받기
		let targetDate = /(\d\d)(\d\d)-(\d\d)-(\d\d)\s(\d\d):(\d\d):(\d\d).(\d)/g;
		let formatDate = "$3.$4";
		return date.replace(targetDate, formatDate);	// 전달받은 날짜 및 시각을 지정된 형식으로 변환하여 리턴
	}

	// 시간 형식 지정 함수
	function getFormatTime(date){	// 문자열로 된 날짜 및 시각 데이터 전달받기
		let targetDate = /(\d\d)(\d\d)-(\d\d)-(\d\d)\s(\d\d):(\d\d):(\d\d).(\d)/g;
		let formatDate = "$5:$6";
		return date.replace(targetDate, formatDate);	// 전달받은 날짜 및 시각을 지정된 형식으로 변환하여 리턴
	}
	
	// 거래타입 별 색, +- 표시 함수
	function amountColor(){
		$("strong.zpayHistoryItem_amount").each(function() {

			let zpayDealType = $(this).attr("data-dealType");
		
			if (zpayDealType == "충전" || zpayDealType == "중고입금" || zpayDealType == "경매입금") {
				$(this).css("color", "#09aa5c");
				$(this).prepend("+ ");
			} else if (zpayDealType == "환급" || zpayDealType == "중고출금" || zpayDealType == "경매출금") {
				$(this).prepend("- ");
			}
		});
		
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
						<div class="btn-group">
							<input type="button" class="dealType btn btn-sm btn-outline-dark rounded-pill mr-1 active" value="전체">
							<input type="button" class="dealType btn btn-sm btn-outline-dark rounded-pill mr-1" value="충전">
							<input type="button" class="dealType btn btn-sm btn-outline-dark rounded-pill mr-1" value="환급">
							<input type="button" class="dealType btn btn-sm btn-outline-dark rounded-pill mr-1" value="사용">
							<input type="button" class="dealType btn btn-sm btn-outline-dark rounded-pill mr-1" value="수익">
<!-- 							<a class="dealType btn btn-sm btn-outline-dark rounded-pill mr-1">충전</a> -->
<!-- 							<a class="dealType btn btn-sm btn-outline-dark rounded-pill mr-1">환급</a> -->
<!-- 							<a class="dealType btn btn-sm btn-outline-dark rounded-pill mr-1">사용</a> -->
<!-- 							<a class="dealType btn btn-sm btn-outline-dark rounded-pill mr-1">수익</a> -->
<!-- 							<a href="zpay_main?searchType='전체'" class="dealType btn btn-sm btn-outline-dark rounded-pill mr-1 active">전체</a> -->
<!-- 							<a href="zpay_main?searchType='충전'" class="dealType btn btn-sm btn-outline-dark rounded-pill mr-1">충전</a> -->
<!-- 							<a href="zpay_main?searchType='환급'" class="dealType btn btn-sm btn-outline-dark rounded-pill mr-1">환급</a> -->
<!-- 							<a href="zpay_main?searchType='사용'" class="dealType btn btn-sm btn-outline-dark rounded-pill mr-1">사용</a> -->
<!-- 							<a href="zpay_main?searchType='수익'" class="dealType btn btn-sm btn-outline-dark rounded-pill mr-1">수익</a> -->
						</div>
					</div>
					<div class="zpayHistoryDateSelect">
						<input type="date" class="form-control datepicker">
					</div>
					<div class="zpayHistoryPeriodArea">
						총 <strong class="listCount">${listCount }</strong> 건
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
							<c:forEach var="zpayHistory" items="${zpayHistoryList }" varStatus="vs">
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
												<strong class="zpayHistoryItem_amount" data-dealType="${zpayHistory.zpay_deal_type }">
															 <fmt:formatNumber value="${zpayHistory.zpay_amount}" pattern="#,##0"/>원
<%-- 													<c:choose> --%>
<%-- 														<c:when test="${zpayHistory.zpay_deal_type eq '충전' or zpayHistory.zpay_deal_type eq '중고입금' or zpayHistory.zpay_deal_type eq '경매입금'}"> --%>
<%-- 															 <fmt:formatNumber value="${zpayHistory.zpay_amount}" pattern="+ #,##0"/>원 --%>
<%-- 														</c:when> --%>
<%-- 														<c:otherwise> --%>
<%-- 															 <fmt:formatNumber value="${zpayHistory.zpay_amount}" pattern="- #,##0"/>원 --%>
<%-- 														</c:otherwise> --%>
<%-- 													</c:choose> --%>
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