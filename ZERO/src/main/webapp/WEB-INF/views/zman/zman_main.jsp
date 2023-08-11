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

<%-- DatePicker 관련 --%>
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

	/* datepicker */
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
				<div id="main">
					<h1>ZMAN</h1>
					<%--ZMAN 프로필 영역 --%>
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
					<hr>
					
					<section id="sec02">
						<div class="user_membership" data-v-32a5de90="" data-v-412d8616="">
							<div class="user_detail" data-v-32a5de90="">
								<div class="user_thumb01" data-v-32a5de90="">
									<h2>정산 내역</h2>
										<div class="zpayHistoryDateSelect" style="display: flex;">
											<input type="text" name="datetimes"  class="form-control">
										</div>
								</div>
							</div>
						</div>
					</section>
					<hr>
					
				<%--카카오맵 지도 API 시작 --%>
				<div id="map" style="width:100%;height:450px;" data-v-32a5de90=""></div>
					<%-- 발급받은 appkey 를 넣어주기 --%>
					<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7b64b9fe8be0d3ba0e69ecffe2e6efe&libraries=services"></script>
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						    mapOption = {
						        center: new kakao.maps.LatLng(37.56792, 126.97101), // 지도의 중심좌표
						        level: 4, // 지도의 확대 레벨, 숫자가 클수록 넓은 범위를 보여준다
						        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
						    }; 
				
						// 지도를 생성한다 
						var map = new kakao.maps.Map(mapContainer, mapOption); 
				
						// HTML5의 geolocation으로 사용할 수 있는지 확인
						// ZMAN 의 현재 위치 를 마커로 표시하기
						if (navigator.geolocation) {
						    // GeoLocation을 이용해서 접속 위치를 얻어오기
						    navigator.geolocation.getCurrentPosition(function(position) {
						        var lat = position.coords.latitude, // 위도
						            lon = position.coords.longitude; // 경도
						        
						        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
						        var message = '<div style="padding:5px;">ZMAN 현재 위치!</div>'; // 인포윈도우에 표시될 내용입니다
						        
						        // 마커와 인포윈도우를 표시하기
						        displayMarker(locPosition, message);
						            
						        // 지도에 원을 표시한다
						        var circle = new kakao.maps.Circle({
						            map: map, // 원을 표시할 지도 객체
						            center: locPosition, // 지도의 중심 좌표
						            radius: 500, // 원의 반지름 (단위 : m)
						            fillColor: '#666699', // 채움 색
						            fillOpacity: 0.5, // 채움 불투명도
						            strokeWeight: 1, // 선의 두께
						            strokeColor: '#00ff00', // 선 색
						            strokeOpacity: 1, // 선 투명도 
						            strokeStyle: 'solid' // 선 스타일
						        });
						    });
						} else { // HTML5의 GeoLocation을 사용할 수 없을 때 마커 표시 위치와 인포윈도우 내용을 설정하기
						    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);
						    var message = 'geolocation을 사용할 수 없어요..';
						    
						    displayMarker(locPosition, message);
						}
						
						function displayMarker(position, message) {
						    // 마커를 생성합니다
						    var marker = new kakao.maps.Marker({
						        map: map,
						        position: position
						    });
						
						    var iwContent = message; // 인포윈도우에 표시할 내용
						    var infowindow = new kakao.maps.InfoWindow({
						        content: iwContent
						    });
						    
						    // 인포윈도우를 마커위에 표시
						    infowindow.open(map, marker);
						}
		
						// 지도에 마커와 인포윈도우를 표시하는 함수
						function displayMarker(locPosition, message) {
		
						    // 마커를 생성합니다
						    var marker = new kakao.maps.Marker({  
						        map: map, 
						        position: locPosition
						    }); 
						    
						    var iwContent = message, // 인포윈도우에 표시할 내용
						        iwRemoveable = true;
		
						    // 인포윈도우를 생성
						    var infowindow = new kakao.maps.InfoWindow({
						        content : iwContent,
						        removable : iwRemoveable
						    });
						    
						    // 인포윈도우를 마커위에 표시
						    infowindow.open(map, marker);
						    
						    // 지도 중심좌표를 접속위치로 변경
						    map.setCenter(locPosition);      
	
						    // 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
							kakao.maps.event.addListener(marker, 'click', function() {
							    alert('마커를 클릭했습니다!');
							});
						}
						
						// 데이터베이스에서 가져온 주소로 마커를 표시하는 함수
					    function displayMarkersFromDB() {
					        var positionsFromDB = [
					            { title: '서면로 62', address: '부산광역시 부산진구 서면로 62' }
					            , { title: '예시 위치1', address: '부산광역시 부산진구 동천로 109' }
// 					            , { title: '예시 위치2', address: '부산광역시 부산진구 예시주소2' }
// 					            , { title: '예시 위치3', address: '부산광역시 부산진구 예시주소3' }
					            // ... (데이터베이스에서 가져온 주소 정보 추가)
					        ];

					        var geocoder = new kakao.maps.services.Geocoder();

					        for (var i = 0; i < positionsFromDB.length; i++) {
					            var position = positionsFromDB[i];

					            geocoder.addressSearch(position.address, function(result, status) {
					                if (status === kakao.maps.services.Status.OK) {
					                    var markerPosition = new kakao.maps.LatLng(result[0].y, result[0].x);

					                    var marker = new kakao.maps.Marker({
					                        map: map,
					                        position: markerPosition,
					                        title: position.title
					                    });

					                    kakao.maps.event.addListener(marker, 'click', function() {
					                        var infowindow = new kakao.maps.InfoWindow({
					                            content: '<div style="padding:5px;">' + position.title + '</div>'
					                        });
					                        infowindow.open(map, marker);
					                    });
					                }
					            });
					        }
					    }

					    // 데이터베이스에서 가져온 주소로 마커를 표시합니다
					    displayMarkersFromDB();

						
						// 실시간교통 타일 이미지 추가
// 						map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC); 
				
						// 지도 중심 좌표 변화 이벤트를 등록한다
		// 				kakao.maps.event.addListener(map, 'center_changed', function () {
		// 					console.log('지도의 중심 좌표는 ' + map.getCenter().toString() +' 입니다.');
		// 				});
						
						
					</script>
			<%--카카오맵 지도 API 끝 --%>
				</div> <%-- <div id="main">  --%>
			</div>
			</div>
		</div>
	</article>
</body>
</body>
</html>