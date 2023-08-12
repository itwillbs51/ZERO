<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jtsage-datebox-bootstrap4@5.3.3/jtsage-datebox.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#user_membership {
		margin: 25px;
	}
	
	.content_title[data-v-88eb18f6] {
	    display: flex;
	    padding: 5px 0 6px;
	    padding-bottom: 16px;
	    border-bottom: 3px solid #222!important;
	}

	#sec01 {
		margin: 2em;
		display: flex;
		justify-content: center;
		align-items: center;
		
	}
		
</style>
<script>
	// 주간 선택 옵션을 생성하는 함수
	function makeWeekSelectOptions() {
	  var year = $("#sh_year").val();
	  var month = $("#sh_month").val();
	  var obj = document.getElementById("sh_week");
	  obj.options.length = 0; // 기존 옵션 초기화
	  
	  var today = new Date();
	  var firstDayOfMonth = new Date(year, month - 1, 1);
	  var lastDayOfMonth = new Date(year, month, 0);
	  var currentDay = new Date(firstDayOfMonth);
	  
	  while (currentDay <= lastDayOfMonth) {
	    var weekStart = new Date(currentDay);
	    var weekEnd = new Date(currentDay);
	    weekEnd.setDate(weekStart.getDate() + 6);
	    
	    var weekStartStr = formatDate(weekStart);
	    var weekEndStr = formatDate(weekEnd);
	    
	    var optionText = weekStartStr + " ~ " + weekEndStr;
	    var isSelected = today >= weekStart && today <= weekEnd;
	    
	    obj.options[obj.options.length] = new Option(optionText, weekStartStr + "|" + weekEndStr, isSelected, isSelected);
	    
	    currentDay.setDate(currentDay.getDate() + 7);
	  }
	}

	// 날짜 형식을 포맷하는 함수
	function formatDate(date) {
	  var year = date.getFullYear();
	  var month = (date.getMonth() + 1).toString().padStart(2, "0");
	  var day = date.getDate().toString().padStart(2, "0");
	  return year + "-" + month + "-" + day;
	}

	// 초기 로드 시 주간 선택 옵션 생성
	$(document).ready(function () {
	  makeWeekSelectOptions();
	});
</script>
<script>
	$(document).ready(function () {
	  // 조회하기 버튼 클릭 시 AJAX 요청
	  $("button[type='submit']").click(function () {
	    var weekValue = $("#sh_week").val(); // 선택된 주간 값 (시작일|종료일)
	    
	    // AJAX 요청 보내기
	    $.ajax({
	      type: "GET",
	      url: "your_server_url_here", // 실제 서버 URL로 대체
	      data: { week: weekValue }, // 선택된 주간 값을 서버로 전송
	      dataType: "json",
	      success: function (data) {
	        // 서버로부터 받은 JSON 데이터 처리
	        updateTableWithData(data); // 테이블 업데이트 함수 호출
	      },
	      error: function () {
	        console.log("Error occurred during AJAX request.");
	      }
	    });
	  });
	  
	  // 테이블 업데이트 함수
	  function updateTableWithData(data) {
	    var tableBody = $("tbody.table-group-divider");
	    tableBody.empty(); // 기존 테이블 내용 비우기
	    
	    // 받은 JSON 데이터를 이용하여 테이블 행 추가
	    data.forEach(function (item) {
	      var row = $("<tr>");
	      var startDate = item.startDate;
	      var endDate = item.endDate;
	      var deliveryFee = item.deliveryFee;
	      
	      row.append("<th scope='row'>" + startDate + " ~ " + endDate + "</th>");
	      row.append("<td>" + deliveryFee + " 원</td>");
	      row.append("<td><button class='btn btn-dark' type='button'>상세보기</button></td>");
	      
	      tableBody.append(row);
	    });
	  }
	});
</script>
</head>
<body>
	<%-- 헤더 영역 --%>
	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
		
	
	<%-- 본문 영역 --%>
	<article id="mainArticle">
		<div class="container">
			<%-- 사이드 바 영역 --%>
			<nav id="mainNav" class="sidebarArea d-none d-md-block sidebar">
				<jsp:include page="/WEB-INF/views/inc/zman_sidebar.jsp"></jsp:include>
			</nav>
			
			<%-- 본문 내용 --%>
			<div class="container-fluid">
				<div class="contentArea">
					<div id="main">
<!-- 						<h1> 정산 내역 </h1> -->
						<div data-v-88eb18f6="" data-v-cf6a6ef4="" class="content_title">
							<div data-v-88eb18f6="" class="title">
								<h3 data-v-88eb18f6="">정산하기</h3>
							</div>
						</div>
					
					<%--ZMAN 프로필 영역 --%>
					<section id="sec01">
							<div class="user_membership" data-v-32a5de90="" data-v-412d8616="">
								<div class="user_detail" data-v-32a5de90="">
									<div class="user_thumb01" data-v-32a5de90="">
									<strong class="name" data-v-32a5de90="">${zman.zman_name }</strong> &nbsp;|&nbsp;
									<strong class="email" data-v-32a5de90="">${sessionScope.member_id }</strong>&nbsp;|&nbsp;
									<strong class="phone" data-v-32a5de90="">${zman.zman_phone }</strong>&nbsp;|&nbsp;
									<strong class="phone" data-v-32a5de90="">${zman.zman_transport }</strong>&nbsp;|&nbsp;
									<strong class="phone" data-v-32a5de90="">${zman.zman_status }</strong>
								</div>
							</div>
						</div>
					</section>
					<hr>						
						
					<%-- 셀렉트 박스 영역 --%>
					<section id="sec02">
					    <div class="input-group">
					        <select name="sh_year" id="sh_year" class="form-control" onchange="makeWeekSelectOptions();">
					            <option value='2023' selected='selected'>2023년</option>
					        </select>
					        
					        <select name="sh_month" id="sh_month" class="form-control" onchange="makeWeekSelectOptions();">
					            <option value='01'>01월</option>
					            <option value='02'>02월</option>
					            <option value='03'>03월</option>
					            <option value='04'>04월</option>
					            <option value='05'>05월</option>
					            <option value='06'>06월</option>
					            <option value='07'>07월</option>
					            <option value='08' selected='selected'>08월</option>
					            <option value='09'>09월</option>
					            <option value='10'>10월</option>
					            <option value='11'>11월</option>
					            <option value='12'>12월</option>
					        </select>
    
				        <select name="sh_week" id="sh_week" class="form-control">
				        </select>
				        
				        <div class="input-group-append">
				            <button class="btn btn-outline-dark" type="submit">조회하기</button>
				        </div>
				    </div>
				</section>
				
				<%-- 주간 정산 목록 게시판 --%>
				<section id="sec02">
				<form>
					<table class="table">
						<thead>
							<tr>
								<%-- 배달 번호 , 배달물품, 배달거리, 배달료,   --%>
						        <th scope="col">배달날짜</th>
						        <th scope="col">배달료</th>
						        <th scope="col">배달수단</th>
						        <th scope="col">상세보기</th>
						 	</tr>
						 </thead>
						 <tbody class="table-group-divider">
						  	<tr>
						         <th scope="row"></th>
						         <td></td>
						         <td>
			    				 	<button class="btn btn-dark" type="submit">상세보기</button>
			    				 </td>
						    </tr>
						</tbody>
					</table>
				</form>
				</section>
						
						
					</div> <%-- <div id="main">  --%>
				</div> <%-- <div class="contentArea"> --%>
			</div> <%-- <div class="container-fluid"> --%>
		</div>
	</article>
</body>
</body>
</html>