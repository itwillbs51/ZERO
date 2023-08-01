<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
</style>
<script type="text/javascript">
	$(function() {
		let balance = ${zpay_balance };
// 		alert(inputNumberFormat(balance));
				
		$(".balanceArea .balance").html(comma(balance) + "원");
	});

	function comma(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
		
</script>
<script type="text/javascript">
	$(function() {
		$("#zpayBankAuthButton").on("click", function() {
			// 새 창에서 사용자 인증 페이지 요청
			// => 입금 이체 API 사용을 위해 scope 항목에 oob추가
			let requestUri = "https://testapi.openbanking.or.kr/oauth/2.0/authorize?"
					+ "response_type=code"
					+ "&client_id=4066d795-aa6e-4720-9383-931d1f60d1a9"
					+ "&redirect_uri=http://localhost:8089/zero/callback"
					+ "&scope=login inquiry transfer oob"
					+ "&state=12345678901234567890123456789012"
					+ "&auth_type=0";
			
			window.open(requestUri, "authWindow", "width=600, height=800");
		});
	});
</script>
</head>
<body>
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
									<a href="bankUserInfo" class="zpayChargeButton">충전</a>
								</div>
								<div class="zpayRefundLink">
									<a class="btn" id="zpayBankAuthButton">계좌인증하기</a>
<!-- 									<a href="#" class="zpayRefundButton">환급</a> -->
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