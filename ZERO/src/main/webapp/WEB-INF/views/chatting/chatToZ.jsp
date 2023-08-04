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

	// [충전하기] 버튼의 상태확인 및 변경을 수행하는 함수 ===================================================================
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
		// 금액이 선택될 경우 [금액입력] 란에 입력 및 [충전하기] 버튼 활성화 ================================================
		$("input[name=options]").on("click", function() {
// 			alert($(this).val());
			$("#amountInput").val($(this).val());
			checkButtonStatus();
		});
		
		// 금액이 입력될 경우 [충전하기] 버튼 활성화 ========================================================================
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
			let zpayAmount = $("#amountInput").val().replace(",", "");
			$("input[name=zpayAmount]").val(zpayAmount);
		});
		
	})
	
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

<%-- 우편번호찾기 Daum api --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function DaumPostcode() {
		event.preventDefault();
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
//                     document.getElementById("member_extraAddress").value = extraAddr;
                    addr = addr + " " + extraAddr;
                
                } else {
//                     document.getElementById("member_extraAddress").value = '';
					addr = addr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('member_zipcode1').value = data.zonecode;
                document.getElementById("member_address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
//                 document.getElementById("member_address_detail1").focus();
            }
        }).open();
    }
</script>
<style type="text/css">
/* 	.container { */
/* 		padding-bottom: 0; */
/* 	} */
</style>
</head>
<body>
	<article>
		<div class="container">
			<div class="contentArea">
			<%-- 메인영역 --%>
				<form action="zpay_charge_pro" method="post">
					<input type="hidden" name="zpayAmount" value="">
					<input type="hidden" name="zpay_deal_type" value="충전">
					<div class="chargeContentArea">
						<div class="chargeInputArea">
							<div class="title">
								ZMAN 접수
							</div>
							<div class="has_button input_box" data-v-4e1fd2e6="" data-v-2b15bea4="">
						<h3 class="input_title" data-v-4e1fd2e6="" data-v-2b15bea4="">주소지 입력</h3>
						<div class="btn_input_container">
							<input type="text" 
								   placeholder="우편번호" 
								   id="member_zipcode1" 
								   name="member_zipcode1" 
								   autocomplete="off" 
								   class="input_txt" 
								   data-v-4e1fd2e6=""
								   required="required">
<!-- 							<button onclick="DaumPostcode()">우편번호 찾기</button> -->
								<button onclick="DaumPostcode(event)">우편번호 찾기</button>
							<input type="text" 
								   placeholder="도로명주소" 
								   id="member_address1" 
								   name="member_address1" 
								   autocomplete="off" 
								   class="input_txt" 
								   data-v-4e1fd2e6=""
								   required="required">
						</div>
							<div class="amountArea">
								<div class="amountInputArea">
									<input type="text" id="amountInput" maxlength="10" onkeyup="inputNumberFormat(this);" placeholder="충전할 금액을 입력해 주세요">
									<button type="button" class="btn" onclick="amountReset()">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
											<path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
										</svg>
									</button>							
								</div>							
								<div class="amountShortcutArea">
									<div class="btn-group btn-group-toggle" data-toggle="buttons">
										<label class="btn btn-outline-dark">
											<input type="radio" name="options" id="option1" autocomplete="off" value="10,000">+1만원
										</label>
										<label class="btn btn-outline-dark">
											<input type="radio" name="options" id="option2" autocomplete="off" value="50,000">+5만원
										</label>
										<label class="btn btn-outline-dark">
											<input type="radio" name="options" id="option3" autocomplete="off" value="100,000">+10만원
										</label>								
										<label class="btn btn-outline-dark">
											<input type="radio" name="options" id="option4" autocomplete="off" value="1,000,000">+100만원
										</label>
									</div>
								</div>
							</div><%-- amountArea 영역 끝 --%>
							<div class="withdrawalAccountArea">
								<div class="title">
									출금 계좌
								</div>
								<div class="withdrawalAccount_info">
									<div class="withdrawalBankName">하나</div>
									<div class="withdrawalAccountNum">123-456-789</div>
								</div>
								<div class="dropdown withdrawalAccount_info">
									<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										출금계좌선택
									</button>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<c:choose>
											<c:when test="${empty userInfo.res_list }">
												<a class="btn dropdown-item" id="zpayBankAuthButton">계좌인증하기</a>
											</c:when>
											<c:otherwise>
												<c:forEach var="account" items="${userInfo.res_list }">
													<a class="dropdown-item withdrawalBankName" href="#">${account.bank_name } ${account.account_num_masked }
														<%-- 2.3.1. 잔액조회 API 요청을 위한 폼 --%>
														<form action="bankAccountDetail" method="post">
															<%-- hidden 타입으로 예금주명, 계좌번호(마스킹), 핀테크이용번호 전달 --%>
															<input type="hidden" name="user_name" value="${userInfo.user_name }">
															<input type="hidden" name="fintech_use_num" value="${account.fintech_use_num }">
															<input type="hidden" name="account_num_masked" value="${account.account_num_masked }">
															<input type="submit" value="상세조회">
														</form>
													</a>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									
									</div>
								</div>
								
							</div><%-- withdrawalAccountArea 영역 끝 --%>
						</div><%-- chargeInputArea 영역 끝 --%>
						<div class="chargeButtonArea">
							<button type="submit" class="btn btn-dark btn-lg btn-block">충전하기</button>
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