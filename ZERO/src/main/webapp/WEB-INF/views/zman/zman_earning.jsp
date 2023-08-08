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
</style>
<script>
	// 셀렉트박스 일주일 단위 선택
	function makeWeekSelectOptions() {
		var year = $("#sh_year").val();
		var month = $("#sh_month").val();
		
		var today = new Date();
		
		var sdate = new Date(year, month-1, 01);
		var lastDay = (new Date(sdate.getFullYear(), sdate.getMonth()+1, 0)).getDate();
		var endDate = new Date(sdate.getFullYear(), sdate.getMonth(), lastDay);
		
		var week = sdate.getDay();
		sdate.setDate(sdate.getDate() - week);
		var edate = new Date(sdate.getFullYear(), sdate.getMonth(), sdate.getDate());
		
		var obj = document.getElementById("sh_week");
		obj.options.length = 0;
		var seled = "";
		
		while(endDate.getTime() >= edate.getTime()) {
		
			var sYear = sdate.getFullYear();
			var sMonth = (sdate.getMonth()+1);
			var sDay = sdate.getDate();
			
			sMonth = (sMonth < 10) ? "0"+sMonth : sMonth;
			sDay = (sDay < 10) ? "0"+sDay : sDay;
			
			var stxt = sYear + "-" + sMonth + "-" + sDay;
			
			edate.setDate(sdate.getDate() + 6);
			
			var eYear = edate.getFullYear();
			var eMonth = (edate.getMonth()+1);
			var eDay = edate.getDate();
			
			eMonth = (eMonth < 10) ? "0"+ eMonth : eMonth;
			eDay = (eDay < 10) ? "0"+ eDay : eDay;
			
			var etxt = eYear + "-" + eMonth + "-" + eDay;
			
			if(today.getTime() >= sdate.getTime() && today.getTime() <= edate.getTime()) {
				seled = stxt+"|"+etxt;
			}
			
			obj.options[obj.options.length] = new Option(stxt+"~"+etxt, stxt+"|"+etxt);
			
			sdate = new Date(edate.getFullYear(), edate.getMonth(), edate.getDate() + 1);
			edate = new Date(sdate.getFullYear(), sdate.getMonth(), sdate.getDate());
		}
		
		if(seled) obj.value = seled;
	}
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
						<h1> 정산 내역 </h1>
						
						<%--ZMAN 프로필 영역 --%>
						<select name="sh_year" id="sh_year" onchange="makeWeekSelectOptions();">
							<option value='2023' selected='selected'>2023년</option>
						</select>
						
						<select name="sh_month" id="sh_month" onchange="makeWeekSelectOptions();">
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

						<select name="sh_week" id="sh_week">
						</select>


				
						<%-- 주간 정산 목록 게시판 --%>
						<section id="sec02">
						<form>
							<table class="table">
								<thead>
									<tr>
										<%-- 배달 번호 , 배달물품, 배달거리, 배달료,   --%>
								        <th scope="col">날짜</th>
								        <th scope="col">배달료</th>
								        <th scope="col">상세보기</th>
								 	</tr>
								 </thead>
								 <tbody class="table-group-divider">
								  	<tr>
								         <th scope="row">7/31 ~ 8/13</th>
								         <td>18,000 원</td>
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