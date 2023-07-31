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
					<h1>핀테크 사용자 정보</h1>
					<h3>
						${userInfo.user_name } 고객님의 계좌목록<br>
						(일련번호 : ${userInfo.user_seq_no })
					</h3>
					<table border="1">
						<tr>
							<th>계좌별칭</th>
							<th>계좌번호</th><%-- 일반 계좌번호 대신 마스킹 된 계좌번호(account_num_masked)만 사용 가능 --%>
							<th>은행명</th>
							<th>예금주명</th>
							<th>핀테크이용번호</th>
							<th></th>
						</tr>
						<%-- userInfo 객체의 res_list 객체 반복하여 BankAccountVO 객체에 접근하여 각 데이터 꺼내서 테이블 출력 --%>
						<c:forEach var="account" items="${userInfo.res_list }">
							<tr>
								<td>${account.account_alias }</td>
								<td>${account.account_num_masked }</td>
								<td>${account.bank_name }(${account.bank_code_std })</td>
								<td>${account.account_holder_name }</td>
								<td>${account.fintech_use_num }</td>
								<td>
									<%-- 2.3.1. 잔액조회 API 요청을 위한 폼 --%>
									<form action="bankAccountDetail" method="post">
										<%-- hidden 타입으로 예금주명, 계좌번호(마스킹), 핀테크이용번호 전달 --%>
										<input type="hidden" name="user_name" value="${userInfo.user_name }">
										<input type="hidden" name="fintech_use_num" value="${account.fintech_use_num }">
										<input type="hidden" name="account_num_masked" value="${account.account_num_masked }">
										<input type="submit" value="상세조회">
									</form>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div><%-- contentArea 영역 끝 --%>
		</div><%-- container 영역 끝 --%>
	</article>
	<footer>
	</footer>

</body>
</html>