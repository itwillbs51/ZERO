<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath }/resources/css/sidebar.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	let currentPosition = parseInt($(".sidebar").css("top"));
	$(window).scroll(function() {
		let position = $(window).scrollTop(); 
		$(".sidebar").stop().animate({"top":position+currentPosition+"px"},800);
	});
});	

</script>
<div class="sidebar">
	<p class="title"> ZMAN </p>
  		<ul class="nav flex-column">
    		<li class="nav-item">
      			<a class="nav-link" href="zman_main">
        			ZMAN 메인<span class="sr-only">(current)</span>
      			</a>
   			</li>
		    <hr>
		    <li class="nav-item">
		    	<a class="nav-link" href="zman_earning">
		        정산내역
		      	</a>
		    </li>
		    <hr>
		    <li class="nav-item">
		    	<a class="nav-link" href="zman_delivery_want">
		        배달 예정 목록
		      	</a>
		    </li>
    		<hr>
		    <li class="nav-item">
		    	<a class="nav-link" href="zman_delivery_done">
		        배달 완료 목록
		      	</a>
		    </li>
		    <hr>
		    <li class="nav-item">
		    	<a class="nav-link" href="zman_myPage">
		        마이페이지
		      	</a>
		    </li>
		    <hr>
		</ul>
</div>