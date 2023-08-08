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
<link href="${pageContext.request.contextPath }/resources/css/alarm.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<title>ZERO</title>
<script type="text/javascript">

	
</script>
<style type="text/css">
	/* ---------- 알람창 크기조절 ----------------- */
body {
	min-width: 320px;
}
article{
	width: inherit;
	min-height: 100%;
	background-color: #f4f6f8;
}
.container {
	margin: auto;
/* 	max-width: 300px; */
	padding: 15px;
}
.contentArea {
	margin: auto;
	padding: 10px;
	border-radius: 10px;
	background-color: white;
}
.titleArea {
	display: flex;
	justify-content: space-between;
}
.title {
	font-weight: bold;
	margin-left: 5px;
	font-size: 20px;
}
.detail {
	text-decoration: none;
	color: #555;
	font-size: 14px;
}

hr {
	margin: 0;
	padding: 0;
}
#alarmList {
	list-style:none;
/* 	align-items: center; */
	margin:0;
	padding: 0;
}
.alarmItem {
	margin: 10px 8px;
}
.alarmTitle {
	font-size: 17px;
}
.alarmContent {
	font-size: 15px;
	color: gray;
}
/* .btnArea { */
/* 	margin: 10px auto; */
/* } */
/* .btnArea .btn { */
/* 	margin: auto; */
/* } */
</style>
</head>
<body>
	<article>
		<div class="container">
			<div class="contentArea">
				<div class="titleArea">
					<div class="title">
						알림
					</div>
					<div class="detailArea">
						<a class="detail" href="">더보기 > </a>
					</div>
				</div>
				<hr>
				<ul id="alarmList">
					<c:forEach var="i" begin="1" end="5">
						<li class="alarmItem">
							<div class="alarmTitle">
								채팅
							</div>
							<div class="alarmContent">
								채팅이 도착했어요!
							</div>
						</li>
					</c:forEach>
				</ul>
				
				<%-- sse 연결 테스트 --%>
				<input type="text" id="id" value="${sessionScope.member_id }"/>
    			<button type="button" onclick="login()">로그인</button>
    			
    			<script type="text/javaScript">
//     			const eventSource = new EventSource('http://localhost:8089/zero/subscribe/1');
//     			eventSource.addEventListener('sse', event => {
//     				console.log(event);
//     			});
    			
// 				    function login() {
// 				        const id = document.getElementById('id').value;
				
// 				        const eventSource = new EventSource(`/subscribe/` + id);
				
// 				        eventSource.addEventListener("sse", function (event) {
// 				            console.log(event.data);
				
// 				            const data = JSON.parse(event.data);
				
// 				            (async () => {
// 				                // 브라우저 알림
// 				                const showNotification = () => {
				                    
// 				                    const notification = new Notification('채팅', {
// 				                        body: data.content
// 				                    });
				                    
// 				                    setTimeout(() => {
// 				                        notification.close();
// 				                    }, 10 * 1000);
// 				                    // 아마 10분 설정
				                    
// 				                    notification.addEventListener('click', () => {
// 				                        window.open(data.url, '_blank');
// 				                    });
// 				                }
				
// 				                // 브라우저 알림 허용 권한
// 				                let granted = false;
				
// 				                if (Notification.permission === 'granted') {
// 				                    granted = true;
// 				                } else if (Notification.permission !== 'denied') {
// 				                    let permission = await Notification.requestPermission();
// 				                    granted = permission === 'granted';
// 				                }
				
// 				                // 알림 보여주기
// 				                if (granted) {
// 				                    showNotification();
// 				                }
// 				            })();
// 				        })
// 				    }
				</script>
    			
    			
    			
			</div>
		</div><%-- container 영역 끝 --%>
	</article>

</body>
</html>