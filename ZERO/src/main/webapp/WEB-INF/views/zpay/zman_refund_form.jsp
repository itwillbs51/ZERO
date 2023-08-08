<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jtsage-datebox-bootstrap4@5.3.3/jtsage-datebox.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/zpay.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<title>ZERO</title>
<script type="text/javascript">
	
	$(function() {
		checkButtonStatus();
	});

	// 입력된 금액의 형태 지정하는 함수 ==================================================================================
	function inputNumberFormat(obj) {
		obj.value = comma(uncomma(obj.value));
	}

	// [^\d]+ : 숫자가 아닌 것이 1개 이상 반복되는 문자열 => 없애기
	function uncomma(str) {
		str = String(str);
		return str.replace(/[^\d]+/g, '');
	} 

	// uncomma() 수행후 리턴된 숫자만 천단위로 ',(콤마)' 추가
	// (?= ...) : 양의 전방 탐색. 현재 위치 뒤에 특정 패턴이 따라오는지 확인
	// (?: ) : 이는 비캡처 그룹. 여러 요소를 하나로 묶지만, 캡처를 생성하지는 않음
	// (\d{3}) : 숫자가 3번 반복되는 문자열
	// (?!\d) : 부정적 전방 탐색. 현재 위치 뒤에 숫자가 오지 않아야 함
	// (?:\d{3})+(?!\d) : ((숫자가 3번 반복되는 문자열)이 1번 이상 반복되는 문자열) 뒤에 더이상 숫자가 없는 문자열
	function comma(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	
	function inputOnlyNumberFormat(obj) {
		obj.value = onlynumber(uncomma(obj.value));
	}
	
	function onlynumber(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
	}

	// [환급하기] 버튼의 상태확인 및 변경을 수행하는 함수 ===================================================================
	function checkButtonStatus(){
		let amountInput =  $("#amountInput").val();
		let chargeButton = $(".chargeButtonArea>button");
		
		if(amountInput === ""){
			chargeButton.attr("disabled", "disabled");
		} else {
			chargeButton.removeAttr("disabled");
		}
	}
	
	
	$(function(){
		// 금액이 선택될 경우 [금액입력] 란에 입력 및 [환급하기] 버튼 활성화 ================================================
		$("input[name=options]").on("click", function() {
// 			alert($(this).val());
			$("#amountInput").val($(this).val());
			checkButtonStatus();
		});
		
		// 금액이 입력될 경우 [환급하기] 버튼 활성화 ========================================================================
		$("#amountInput").on("input", function() {
			checkButtonStatus();
		});
	});
	
	
	// [금액입력] 란의 [x]버튼
	// 클릭 시 [금액입력] 란의 내용 null로 바꾸고
	// 선택된 금액의 active 클래스 해제
	function amountReset() {
		$("#amountInput").val(null);
		$("input[name=options]").parent().removeClass("active");
		checkButtonStatus();
	}

	$(function() {
		$("form").submit(function() {
			let zpayAmount = $("#amountInput").val().replaceAll(",", "");
			$("input[name=zpayAmount]").val(zpayAmount);
		});
		
	})
	
</script>
<style type="text/css">
	.container {
		padding-bottom: 0;
	}
</style>
</head>
<body>
	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
	<article>
		<div class="container">
			<div class="contentArea">
			<%-- 메인영역 --%>
				<form action="zman_refund_pro" method="post">
					<input type="hidden" name="member_id" value="${sessionScope.member_id }">
					<input type="hidden" name="zman_net_profit" value="">
					<input type="hidden" name="zman_balance" value="${zman_balance }">
					<div class="chargeContentArea">
						<div class="chargeInputArea">
							<div class="title">
								정산금액&nbsp;&nbsp;<div class="zpay_amount"><fmt:formatNumber value="${zman_net_profit }" pattern="#,##0"/></div>
							</div>
							<div class="amountArea">
								<div class="amountInputArea">
									<input type="text" id="amountInput" maxlength="10" onkeyup="inputNumberFormat(this);" value="${zman_net_profit }">
									<button type="button" class="btn" onclick="amountReset()">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
											<path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
										</svg>
									</button>							
								</div>							
							</div><%-- amountArea 영역 끝 --%>
							<div class="withdrawalAccountArea">
								<div class="title">
									정산 계좌
								</div>
								<div class="withdrawalAccount_info">
									<div class="withdrawalBankName">${zpay.zpay_bank_name }</div>
									<div class="withdrawalAccountNum">${zpay.zpay_bank_account }</div>
								</div>
							</div><%-- withdrawalAccountArea 영역 끝 --%>
						</div><%-- chargeInputArea 영역 끝 --%>
						<div class="chargeButtonArea">
							<button type="submit" class="btn btn-dark btn-lg btn-block">정산하기</button>
						</div><%-- chargeButtenArea 영역 끝 --%>
					</div><%-- chargeContetnArea 영역 끝 --%>
				</form>
			</div><%-- contentArea 영역 끝 --%>
		</div><%-- container 영역 끝 --%>
	</article>
	<footer>
	</footer>

</body>
</html>