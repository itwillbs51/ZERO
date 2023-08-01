<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jtsage-datebox-bootstrap4@5.3.3/jtsage-datebox.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/zpay.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<title>ZERO</title>
</head>
<body>
	<%-- 세션 아이디가 없을 경우 "로그인 후 사용 가능합니다" 출력 후 로그인 페이지로 이동 --%>
	<%-- 아니면, 엑세스토큰이 없을 경우 "계좌 인증 후 사용 가능합니다" 출력 후 회원정보 페이지로 이동 --%>
	<c:choose>
		<c:when test="${empty sessionScope.member_id }">
			<script>
				alert("로그인 후 사용 가능합니다");
				location.href = "member_login";
			</script>
		</c:when>
		<c:when test="${empty sessionScope.access_token }">
			<script>
				alert("계좌 인증 후 사용 가능합니다");
				location.href = "zpay_main";
			</script>
		</c:when>
	</c:choose>
	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
	<article>
		<div class="container">
			<div class="contentArea">
			<%-- 메인영역 --%>
				<div class="successContentArea">
					<div class="targetArea">
						<div class="icon">
						
						</div>
						<p class="targetMessage">
							<strong>내 ZPAY </strong>로<br>
							<em class="amount">${withdrawResult.tran_amt }원 충전완료</em>
						</p>
						<p class="targetAccountInfo">
							${withdrawResult.bank_name } ${withdrawResult.account_num_masked }
						</p>
					</div>
					<div class="successInfoArea">
						<div class="balanceArea">
							<div class="balanceArea_label">
								ZPAY 잔액
							</div>
							<strong class="balanceArea_balance">
								70,000원
							</strong>	
						</div>
						<div class="accountInfoArea">
							<div class="accountInfoArea_label">
								출금계좌
							</div>
							<div class="accountInfoArea_accountNum">
								${withdrawResult.bank_name } ${withdrawResult.account_num_masked }
							</div>	
						</div>
						<div class="accountInfoArea">
							<div class="accountInfoArea_label">
								출금한도잔여금액
							</div>
							<div class="accountInfoArea_accountNum">
								 <fmt:formatNumber value="${withdrawResult.wd_limit_remain_amt }" pattern="#,##0"/>원			
							</div>	
						</div>
						<div class="successNoticeArea">
							ZPAY는 ZPAY 홈에서 무료로 즉시 인출가능합니다.
						</div>
					</div>
					<div class="buttonArea">
						<a href="zpay_charge_form" class="btn btn-outline-secondary btn-lg moreCharge">추가충전하기</a>
						<a href="zpay_main" class="btn btn-secondary btn-lg zpayHistory">ZPAY 내역</a>
					</div>
				</div><%-- successContentArea 영역 끝 --%>	
			</div><%-- contentArea 영역 끝 --%>
		</div><%-- container 영역 끝 --%>
	</article>
	<footer>
	</footer>

</body>
</html>