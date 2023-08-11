<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- JSTL 의 함수를 사용하기 위해 functions 라이브러리 추가 --%>
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

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#user_membership {
		margin: 25px;
	}
	
	#sec01 {
		display: flex;
		justify-content: center;
		align-items: center;	
	}
</style>
<script>

</script>
</head>
<body>
	<%-- 헤더 영역 --%>
	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
		
	<article id="mainArticle">
		<div class="container">
			<%-- 사이드 바 영역 --%>
			<nav id="mainNav" class="sidebarArea d-none d-md-block sidebar">
				<jsp:include page="/WEB-INF/views/inc/zman_sidebar.jsp"></jsp:include>
			</nav>
			
			<%-- 본문 내용 --%>
			<div class="container-fluid">
				<div class="contentArea">
					<div>
						<%-- 해당 페이지 이름 출력 --%>
						<h1> 배달 예정 </h1>
						
						<section id="sec01">
							<div class="user_membership" data-v-32a5de90="" data-v-412d8616="">
								<div class="user_detail" data-v-32a5de90="">
									<div class="user_thumb01" data-v-32a5de90="">
										<br>
	<!-- 									<img -->
	<%-- 										src="${pageContext.request.contextPath }/resources/mypage_img/blank_profile.4347742.png" --%>
	<!-- 										alt="사용자 이미지" class="thumb_img" data-v-32a5de90=""> -->
										
										<strong class="name" data-v-32a5de90="">ZMAN 이름</strong> |
										<strong class="email" data-v-32a5de90="">ZMAN 아이디</strong> |
										<strong class="phone" data-v-32a5de90="">ZMAN 전화번호</strong>
											<%-- 프로필 관리는 사이드바로 빼기 --%>
	<!-- 										<a href="/my/profile-edit" type="button" -->
	<!-- 											class="btn btn outlinegrey small" data-v-43813796="" -->
	<!-- 											data-v-32a5de90=""> 프로필 관리 </a> -->
									</div>
								</div>
							</div>
						</section>
						
						<%-- ZMAN 지도 영역 시작  --%>
						<%--
							zman_delivery_want 뷰페이지에서는 배달 예정 목록의 "출발지" 값만 가져와서
							마크로 출력한다.
							AJAX 를 사용하여 해당 마크를 클릭 시 해당 배달 예정(주문건)에 대한 값을 간단하게 출력해준다. 
						--%>
						<div class="container text-center">
							<div class="row">
								<%-- 현재 위치 지도 영역 표시 --%>
								<div class="col">
										<%--카카오맵 지도 API 시작 --%>
										<div id="map" style="width:500px;height:350px;" data-v-32a5de90=""></div>
											<%-- 발급받은 appkey 를 넣어주기 --%>
											<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7b64b9fe8be0d3ba0e69ecffe2e6efe"></script>
								            <script>
								                var mapContainer = document.getElementById('map'),
								                    mapOption = {
								                        center: new kakao.maps.LatLng(37.56792, 126.97101),
								                        level: 5,
								                        mapTypeId: kakao.maps.MapTypeId.ROADMAP
								                    };
								
								                var map = new kakao.maps.Map(mapContainer, mapOption);
								                
								             // 현재 위치와 마커를 표시하는 함수
								                function displayMarker(position, message) {
								                    var marker = new kakao.maps.Marker({
								                        map: map,
								                        position: position
								                    });

								                    var infowindow = new kakao.maps.InfoWindow({
								                        content: message
								                    });

								                    kakao.maps.event.addListener(marker, 'mouseover', function() {
								                        infowindow.open(map, marker);
								                    });

								                    kakao.maps.event.addListener(marker, 'mouseout', function() {
								                        infowindow.close();
								                    });
								                }
								
								             // 현재 위치 가져와서 마커 표시
								                if (navigator.geolocation) {
								                    navigator.geolocation.getCurrentPosition(function(position) {
								                        var lat = position.coords.latitude,
								                            lon = position.coords.longitude;
								
								                        var locPosition = new kakao.maps.LatLng(lat, lon),
								                            message = '<div style="padding:5px;">ZMAN 현재 위치!</div>';
								
								                        displayMarker(locPosition, message);
								
								                        var circle = new kakao.maps.Circle({
								                            map: map,
								                            center: new kakao.maps.LatLng(lat, lon),
								                            radius: 750,
								                            fillColor: '#666699',
								                            fillOpacity: 0.5,
								                            strokeWeight: 1,
								                            strokeColor: '#00ff00',
								                            strokeOpacity: 1,
								                            strokeStyle: 'solid'
								                        });
				
								                        
								                         var positions = []; // 출발지 정보를 담을 배열

								                         function fetchDepartureListAndCreateMarkers() {
								                        	    $.ajax({
								                        	        url: 'getDeliveryStartspotList', // 서버의 API URL을 입력하세요.
								                        	        type: 'GET',
								                        	        dataType: 'json',
								                        	        success: function(data) {
								                        	            var positions = data.map(function(item) {
								                        	                return {
								                        	                    title: item.title,
								                        	                    address: item.address,
								                        	                    latlng: null
								                        	                };
								                        	            });

								                        	            var geocoder = new kakao.maps.services.Geocoder();
								                        	            var remaining = positions.length;

								                        	            positions.forEach(function(position) {
								                        	                geocoder.addressSearch(position.address, function(result, status) {
								                        	                    if (status === kakao.maps.services.Status.OK) {
								                        	                        position.latlng = new kakao.maps.LatLng(result[0].y, result[0].x);

								                        	                        var marker = new kakao.maps.Marker({
								                        	                            map: map,
								                        	                            position: position.latlng,
								                        	                            title: position.title
								                        	                        });

								                        	                        kakao.maps.event.addListener(marker, 'click', function () {
								                        	                            handleMarkerClick(this.getTitle());
								                        	                        });
								                        	                    } else {
								                        	                        console.error('주소를 변환하는데 실패했습니다.');
								                        	                    }

								                        	                    remaining--;

								                        	                    if (remaining === 0) {
								                        	                        // 모든 주소 변환이 완료되면 마커 생성 및 이벤트 핸들링 코드 호출
								                        	                        // 만약 여기서 다른 로직을 실행해야 한다면 이 위치에 추가하세요.
								                        	                    }
								                        	                });
								                        	            });
								                        	        },
								                        	        error: function() {
								                        	            console.error('출발지 리스트를 가져오는데 실패했습니다.');
								                        	        }
								                        	    });
								                        	}

								                        	// 함수 호출
								                        	fetchDepartureListAndCreateMarkers();

													
													    // 마커 클릭 이벤트를 처리하는 함수
													    function handleMarkerClick(markerTitle) {
													        // AJAX를 이용하여 해당 배달 정보를 가져옵니다.
													        $.ajax({
													            url: 'markerClickInfo', // 컨트롤러에서 지정한 URL로 바꾸세요.
													            type: 'GET',
													            data: { markerTitle: markerTitle }, // 마커의 타이틀을 전달합니다.
													            dataType: 'json',
													            success: function (data) {
													                // 받아온 데이터를 가지고 표를 생성합니다.
													                var tableHtml = `
													                    <table class="table">
													                        <thead>
													                            <tr>
													                                <th scope="col">배달 번호</th>
													                                <th scope="col">상품 이름</th>
													                                <th scope="col">출발지</th>
													                                <th scope="col">도착지</th>
													                                <th scope="col">수수료</th>
													                            </tr>
													                        </thead>
													                        <tbody class="table-group-divider">
													                            <tr>
													                                <th scope="row">${data.zman_delivery_idx}</th>
													                                <td>${data.order_secondhand_product}</td>
													                                <td>${data.zman_delivery_startspot}</td>
													                                <td>${data.zman_delivery_endspot}</td>
													                                <td>${data.zman_delivery_commission}</td>
													                            </tr>
													                        </tbody>
													                    </table>
													                `;
													
													                // 배달 정보 표시 영역에 생성한 표를 삽입합니다.
													                $('#deliveryInfo').html(tableHtml);
													            },
													            error: function () {
													                console.error('배달 정보를 가져오는데 실패했습니다.');
													            }
													        });
													    }
													
													</script>
								        </div>
								    </div>
								
								    <hr>
								
								    <div class="row">
								        <div class="col">
								            <div id="deliveryInfo">
								                <!-- AJAX로 받아온 배달 정보가 여기에 표시될 것입니다. -->
								            </div>
								        </div>
								    </div>
								</div>


						
						<hr>
							<h2>배달 예정 게시판</h2>
					    	<%-- 배달 예정 게시판 영역 시작 --%>
							<div class="container text-center">
							<form action="zman_delivery_ing" method="post">
					    		
									<table class="table">
										<thead>
											<tr>
										    	<th scope="col">배달 번호</th>
										        <th scope="col">상품 이름</th>
										        <th scope="col">출발지</th>
										        <th scope="col">도착지</th>
<!-- 										        <th scope="col">배달거리</th> -->
										        <th scope="col">수수료</th>
										        <th scope="col" width="75px"></th>
											</tr>
										</thead>
										<tbody class="table-group-divider">
											<c:forEach var="zd" items="${zmanDeliveryYetList }" varStatus="vs">
											<input type="hidden" name="zman_delivery_idx" value="${zd.zman_delivery_idx }" >
						    				<input type="hidden" name="zman_id" value="${sessionScope.member_id }">
											    <tr>
											        <th scope="row">${zd.zman_delivery_idx }</th>
											        <td>${zd.order_secondhand_product }</td>
											        <td>${zd.zman_delivery_startspot }</td>
								    				<td>${zd.zman_delivery_endspot }</td>
	<!-- 							    				<td>거리</td> -->
								    				<td>${zd.zman_delivery_commission }</td>
								    				<td>
							    				 		<button class="btn btn-dark" type="submit">배달</button>
							    					</td>
											    </tr>
											</c:forEach>
										</tbody>
									</table>
								</form>
								</div>
								<%-- 배달 예정 게시판 영역 끝 --%>
								
						</div> <%-- <div class="container text-center"> 끝 --%>
					</div> <%-- <div id="main"> 끝 --%>
				</div>
			</div> <%-- <div class="container-fluid"> 끝 --%>
		</div>
	</article>
</body>
</body>
</html>