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
<%-- <script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script> --%>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<meta charset="UTF-8">
<title>ZERO</title>
<style type="text/css">
	.container {
		padding-bottom: 0;
	}
	
	.daterangepicker td.in-range {
		background-color: #EBF4E9;
		border-color: transparent;
		color: #000;
		border-radius: 0;
	}
	
	.daterangepicker td.active, .daterangepicker td.active:hover {
		background-color: #09aa5c;
		border-color: transparent;
		color: #fff;
	}
	
	.daterangepicker td.end-date {
		border-radius: 0 4px 4px 0;
	}
	
	.daterangepicker td.start-date {
		border-radius: 4px 0 0 4px;
	}
</style>
<script type="text/javascript">
		

</script>
</head>
<body>
	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
	<article>
		<div class="container">
			<div class="contentAreaZpay">
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
						</div>
					</div>
					<div class="zpayHistoryDateSelect" style="display: flex;">
						<input type="text" name="datetimes"  class="form-control">
					</div>
					<div class="zpayHistoryPeriodArea">
						총 <strong class="listCount">${listCount }</strong> 건
						<span class="listPeriod">
							<span class="startDate"></span>
							<span class="endDate"></span>
						</span>
					</div>
					<div class="zpayHistoryListArea">
						<ul>
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
												<strong class="zpayHistoryItem_amount" data-dealType="${zpayHistory.zpay_deal_type }">
													<fmt:formatNumber value="${zpayHistory.zpay_amount}" pattern="#,##0"/>원
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