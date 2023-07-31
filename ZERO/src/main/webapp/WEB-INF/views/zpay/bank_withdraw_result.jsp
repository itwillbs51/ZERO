<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
				<div class="zpayManageArea" style="overflow: scroll;">
					<div class="profileArea">
						<a class="profileLink" href="#">
							<span class="profileImg">
							</span>
							<span class="profileInfo">
								<strong class="profileName">
									${sessionScope.member_id }님 계좌정보
<!-- 									홍길동 님 -->
								</strong>
								hong
							</span>
						</a>
					</div>
<!-- 					<div class="payWalletWidgetArea"> -->
<!-- 						<div class="zpayArea"> -->
<!-- 							<div class="balanceArea"> -->
<!-- 								<strong class="title"> -->
<!-- 									ZPAY 잔액 -->
<!-- 								</strong> -->
<!-- 								<div class="balance"> -->
<!-- 									등록된 ZPAY가 없습니다. -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="zpayLinkArea"> -->
<!-- 								<div class="zpayChargeLink"> -->
<!-- <!-- 									<a href="zpay_bank_auth_form" class="zpayBankAuthButton">계좌인증하기</a> --> -->
<!-- 									<a class="btn" id="zpayBankAuthButton">계좌인증하기</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<h1>출금이체 결과 확인</h1>
					<table border="1">
						<tr>
							<th>출금은행명</th>
							<th>출금은행기관코드</th>
							<th>거래일자</th>
							<th>송금인성명</th>
							<th>출금금액</th>
							<th>출금한도잔여금액</th>
							<th>출금계좌인자내역</th>
						</tr>
						<tr>
							<td>${withdrawResult.bank_name }</td>
							<td>${withdrawResult.bank_code_std }</td>
							<td>${withdrawResult.bank_tran_date }</td>
							<td>${withdrawResult.account_holder_name }</td>
							<td>${withdrawResult.tran_amt }</td>
							<td>${withdrawResult.wd_limit_remain_amt }</td>
							<td>${withdrawResult.print_content }</td>
						</tr>
					</table>
				</div>
			</div><%-- contentArea 영역 끝 --%>
		</div><%-- container 영역 끝 --%>
	</article>
	<footer>
	</footer>

</body>
</html>