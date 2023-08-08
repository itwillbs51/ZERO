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
	
/* 	.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}     */
/* 	.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;} */
/* 	.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}     */
	.number {font-weight:bold;color:#ee6152;}
	.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
	.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
	.distanceInfo .label {display:inline-block;width:50px;}
	.distanceInfo:after {content:none;}
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
			<div class="contentArea">
				<div id="main">
				<h1>배달 진행 중...</h1>
				<%--카카오맵 지도 API 시작 --%>
					<div id="map" style="width:1000px;height:450px;" data-v-32a5de90=""></div>
					
<!-- 					 <div id="distance"> -->
<!--                         직선 거리: <span id="distanceValue">0</span> km -->
<!--                     </div> -->
						
						<%-- 발급받은 appkey 를 넣어주기 & 주소로 좌표 얻기 위한 서비스 라이브러리 추가  --%>
						<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7b64b9fe8be0d3ba0e69ecffe2e6efe&libraries=services"></script>

						<div id="clickLatlng"></div>
						<hr>
						
						
<!-- 						<h2>배달 w 게시판</h2> -->
					    	<%-- 배달 진행 중인 내역  --%>
<!-- 							<div class="container text-center"> -->
								<%-- 출발지와 도착지 출력하기 --%>
								<div id="check">
									출발지 : ${depart} <br> 
									도착지 : ${arrive}
								</div>
								
								<%-- 직선 거리 출력하기 --%>
								<div id="distance">
			                        직선 거리: <span id="distanceValue">0</span> km
			                    </div>
			                    
			                    <c:choose>
			                    	<c:when test="${empty DeliveryDetail.zman_delivery_starttime }">
					                    <form action="zman_delivery_start" method="post">
					                    	<input type="hidden" id= "zman_delivery_idx" value="${DeliveryDetail.zman_delivery_idx }">
					                    	
				                    		<button class="btn btn-dark" type="submit">배달 시작</button>
					                    </form>
				                    </c:when>
				                    <c:otherwise>
				                     	<form action="zman_delivery_end" method="post">
					                    	<input type="hidden" id= "zman_delivery_idx" value="${DeliveryDetail.zman_delivery_idx }">
					                    	
				                    		<button class="btn btn-dark" type="submit">배달 완료</button>
					                    </form>
				                    </c:otherwise>
			                    </c:choose>
						<hr>

						
						<hr>
						
				<%-- 지도 관련 script --%>
				<script>
			    var mapContainer = document.getElementById('map'),
			        mapOption = {
			            center: new kakao.maps.LatLng(33.450701, 126.570667),
			            level: 5
			        };
			
			    var map = new kakao.maps.Map(mapContainer, mapOption);
				    
    
			 	// 1. ZMAN의 현재 위치 출력
				// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
				if (navigator.geolocation) {
				    
				    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
				    navigator.geolocation.getCurrentPosition(function(position) {
				        
				        var lat = position.coords.latitude, // 위도
				            lon = position.coords.longitude; // 경도
				        
				        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
				        
				        // 마커와 인포윈도우를 표시합니다
				        var marker = new kakao.maps.Marker({
			            map: map,
			            position: locPosition
				        });
				
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">zman 위치</div>'
				        });
				        infowindow.open(map, marker);
				            
				    });
				    
				} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
				    
				    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
				        message = '위치기반 동의 서비스 동의가 필요합니다.'
				        
				    displayMarker(locPosition, message);
				}
	
				// 2. DB 에 저장된 출발지외 도착지 정보 가져와서 표시하기
				var geocoder = new kakao.maps.services.Geocoder();
				
				var markers = [];
				var lines = [];
				
				// 출발지
				geocoder.addressSearch('${depart}', function(result, status) {
				    if (status === kakao.maps.services.Status.OK) {
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
				        markers.push(marker);
				        
				     	// 출발지의 좌표로 지도 중심 이동
			            map.setCenter(coords);
				    }
				});
	
				// 도착
	    		geocoder.addressSearch('${arrive}', function(result, status) {
	        		if (status === kakao.maps.services.Status.OK) {
			            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			            var marker = new kakao.maps.Marker({
			                map: map,
			                position: coords
			            });
	            		markers.push(marker);
	
			            // 선분 생성
			            if (markers.length > 1) {
			                var linePath = [markers[0].getPosition(), markers[1].getPosition()];
			
			                var line = new kakao.maps.Polyline({
			                    path: linePath,
			                    strokeWeight: 7,
			                    strokeColor: '#FF0000',
			                    strokeOpacity: 0.7,
			                    strokeStyle: 'solid'
			                });
			
			                line.setMap(map);
			                lines.push(line);
			
			                // 출발지와 도착지의 직선 거리 계산
			                var distance = getDistanceFromLatLonInKm(markers[0].getPosition().getLat(), markers[0].getPosition().getLng(), markers[1].getPosition().getLat(), markers[1].getPosition().getLng());
			                var distanceValue = document.getElementById('distanceValue');
			                distanceValue.innerText = distance.toFixed(2);
		            	}
	        		}
	    	});

		    // 경도와 위도 좌표를 사용하여 직선 거리 구하기
		    function getDistanceFromLatLonInKm(lat1, lng1, lat2, lng2) {
		        function deg2rad(deg) {
		            return deg * (Math.PI / 180);
		        }
		
		        var R = 6371; // 지구 반지름
		        var dLat = deg2rad(lat2 - lat1);
		        var dLon = deg2rad(lng2 - lng1);
		        var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon / 2) * Math.sin(dLon / 2);
		        var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
		        var d = R * c;
		
		        return d;
		    }
</script>
				<%--카카오맵 지도 API 끝 --%>
				</div> <%-- <div id="main">  --%>
			</div>
		</div>
	</article>
</body>
</body>
</html>