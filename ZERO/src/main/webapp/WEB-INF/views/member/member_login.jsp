<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link
	href="${pageContext.request.contextPath }/resources/css/default.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/resources/css/sidebar.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/resources/css/member.css"
	rel="stylesheet" type="text/css">
	
<%-- vue.js 링크 --%>
<!-- <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script> -->
<!-- <style type="text/css"> /*# sourceMappingURL=contenteditable.vue.map */</style> -->


<title>중고거래 사이트</title>
<style>

<%-- 구글 로그인 버튼 --%>
.nsm7Bb-HzV7m-LgbsS {
	width: 400px;
	height: 52px;
	border-radius: 12px;
}

</style>

<!-- 네이버 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- 구글 -->
<%-- 구글 api 사용을 위한 스크립트 --%>
<!-- content에 자신의 OAuth2.0 클라이언트ID를 넣습니다. -->
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script type="text/javascript">
	function handleCredentialResponse(response) {
	    // decodeJwtResponse() is a custom function defined by you
	    // to decode the credential response.
	    const responsePayload = parseJwt(response.credential);
	
	    console.log("ID: " + responsePayload.sub);
	    console.log('Full Name: ' + responsePayload.name);
	    console.log('Given Name: ' + responsePayload.given_name);
	    console.log('Family Name: ' + responsePayload.family_name);
	    console.log("Image URL: " + responsePayload.picture);
	    console.log("Email: " + responsePayload.email); 
	    
	    var member_id = responsePayload.email;
	    var member_name = responsePayload.name;
	    var sns_type = 'google';
	     
	    $.ajax({
	         type: 'post',
//	          url: 'checkUserNaver',
	         url: 'ajax/checkUser',
	         data: {"member_id":member_id
	         		, "member_name":member_name
	         		, "sns_type":sns_type
	         	},
	         dataType: 'text',
	         success: function(response) {
	           console.log(response);
	           if (response === 'new') {
//	          	  sessionStorage.setItem('email', member_id);
	         	  location.href = 'join?member_id=' + member_id + '&member_name=' + member_name;
	         	  alert('구글 로그인 성공! 회원가입을 완료해주세요. ');
// 	         	  window.close();

	           }  else if (response === 'existing') { 
//	          	  sessionStorage.removeItem("email");
//	          	  sessionStorage.setItem('member_id', member_id);
	         	  location.href = './';
	         	  alert('구글 로그인 성공!')
// 	         	  window.close();
	           }
	         },
	         error: function(xhr, status, error) {
	           console.log(error);
	         }
	     });
	};

	function parseJwt (token) {
	    var base64Url = token.split('.')[1];
	    var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
	    var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
	        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
	    }).join(''));
	
	    return JSON.parse(jsonPayload);
	};
</script>
<meta name ="google-signin-client_id" content="763453617602-e7goeun627q5nji64obqjr3ir1nc9rd7.apps.googleusercontent.com">
<script type="text/javascript">
	<%-- 공백 입력 방지 --%>
	$(function() {
	    
	 	// 이메일 함수
		const emailCheck = document.getElementById("member_id");
		// 이메일 형식 체크 함수
		emailCheck.addEventListener("keyup",(e)=> {
	        validEmail(e.target)
	    });
		
		// 빈칸 입력시 로그인 금지
		$("#loginForm").submit(function(e) {
		      var memberId = $("#member_id").val().trim();
		      var memberPasswd = $("#member_passwd").val().trim();
		      
		      if (/^\s*$/.test(memberId)) { // 스페이스바로만 이루어진 공백 감지
		          e.preventDefault(); // 등록 방지
		          
		          alert("아이디를 입력해주세요.");
		      } else if (/^\s*$/.test(memberPasswd)) { // 스페이스바로만 이루어진 공백 감지
		    	  e.preventDefault(); // 등록 방지
		    	  alert("비밀번호를 입력해주세요.");
		      }
		      
		});
		
	    
	});

		
	// 로그인 버튼 작동
	function clickLogin() {
// 		alert('로그인 클릭됨');
		$("#loginForm").submit();
	}
	

	
	// 이메일 형식 체크 정규식
	function validEmail(obj){
	    console.log(obj)
	    if(validEmailCheck(obj)==false){ // 이메일 형식에 맞지 않을 때
// 	    	alert('올바르지 않은 메일 형식입니다.')
			$("#input_error_email").css({
			    "display": "block",
			});
// 	        obj.value='';            // 형식에 맞지 않을 때 공백 처리
	        obj.focus();
	        return false;
	    }else{
	    	$("#input_error_email").css({
			    "display": "none",
			});
	    }
	}

	// 이메일 정규식
	function validEmailCheck(obj){
//         var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,}$/i;
        return (obj.value.match(pattern)!=null)
       
    }
</script>


</head>
<body>
<%-- 구글 로그인 --%>
 <%
    String clientId = "763453617602-e7goeun627q5nji64obqjr3ir1nc9rd7.apps.googleusercontent.com";//애플리케이션 클라이언트 아이디값";
//     String redirectURI = URLEncoder.encode("http://localhost:8089/zero/callback_login_google", "UTF-8");
    String redirectURI = URLEncoder.encode("http://c5d2302t1.itwillbs.com/zero/callback_login_google", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
         + "&client_id=" + clientId
         + "&redirect_uri=" + redirectURI
         + "&state=" + state;
    session.setAttribute("state", state);
 %>


 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
<%--  <header id="pageHeader"><%@ include file="assets/inc/header_zero.jsp"%></header> --%>
 
  <%--본문내용 --%>
  <article id="mainArticle">
  	<form action="member_login_pro" method="POST" id="loginForm">
		<div class="container login" data-v-2b15bea4="" data-v-1d0b532e="">
			<div class="content lg" data-v-2b15bea4="">
				<div class="login_area" data-v-2b15bea4="">
				<h2 class="login_title" data-v-2b15bea4="">
					<span class="" data-v-2b15bea4="">ZERO</span>
				</h2>
				<div class="has_button input_box" data-v-4e1fd2e6="" data-v-2b15bea4="">
					<h3 class="input_title" data-v-4e1fd2e6="" data-v-2b15bea4="">이메일 주소</h3>
					<div class="input_item" data-v-4e1fd2e6="">
						<input type="email" placeholder="예) zero@zero.co.kr" autocomplete="off" class="input_txt" data-v-4e1fd2e6="" id="member_id" name="member_id" <c:if test="${not empty cookie.member_id.value }">value="${cookie.member_id.value }"</c:if>>
						<button type="button" class="btn input_delete" style="display:none;" data-v-43813796="" data-v-2b15bea4="" data-v-4e1fd2e6="">
<!-- 							<svg xmlns="http://www.w3.org/2000/svg" class="ico-delete-circle icon sprite-icons" data-v-2b15bea4=""> -->
<!-- 								<use href="/_nuxt/54eaabd5a726b216f3c53922147167ee.svg#i-ico-delete-circle" xlink:href="/_nuxt/54eaabd5a726b216f3c53922147167ee.svg#i-ico-delete-circle" data-v-2b15bea4=""></use> -->
<!-- 							</svg> -->
						</button>
					</div>
					<p class="input_error" data-v-4e1fd2e6="" data-v-2b15bea4="" id="input_error_email">이메일 주소를 정확히 입력해주세요.</p>
				</div>
				<div class="input_box has_button" data-v-4e1fd2e6="" data-v-2b15bea4="">
				<h3 class="input_title" data-v-4e1fd2e6="" data-v-2b15bea4="">비밀번호</h3>
				<div class="input_item" data-v-4e1fd2e6="">
					<input type="password" placeholder="" autocomplete="off" class="input_txt" data-v-4e1fd2e6="" id="member_passwd" name="member_passwd"></div>
					<p class="input_error" data-v-4e1fd2e6="" data-v-2b15bea4=""> 영문, 숫자, 특수문자를 조합해서 입력해주세요. (8-16자) </p></div>
				<%-- 이메일 주소& 비밀번호 주소 미입력시 --%>
	<!-- 			<div class="login_btn_box" data-v-2b15bea4=""> -->
	<!-- 				<a disabled="disabled" href="#" class="btn full solid disabled" data-v-43813796="" data-v-2b15bea4=""> 로그인 </a> -->
	<!-- 			</div> -->
				<div data-v-2b15bea4="" class="login_btn_box">
					<a data-v-43813796="" data-v-2b15bea4="" class="btn full solid" onclick="clickLogin()"> 로그인 </a>
				</div>
				<ul class="look_box" data-v-2b15bea4="">
					<li class="look_list" data-v-2b15bea4="">
						<a href="join" class="look_link" data-v-2b15bea4=""> 이메일 가입 </a>
					</li> |
					<li class="look_list" data-v-2b15bea4="">
						<a href="member_find_id" class="look_link" data-v-2b15bea4=""> 이메일 찾기 </a>
					</li> |
					<li class="look_list" data-v-2b15bea4="">
						<a href="member_find_passwd" class="look_link" data-v-2b15bea4=""> 비밀번호 찾기 </a>
					</li>
				</ul>
				<label>
		      	<%-- 쿠키에 member_id가 있는 경우 check 상태로 보이게 하기  --%>
		      	<input type="checkbox" class="input_check" name="remember_me" <c:if test="${not empty cookie.member_id.value }">checked</c:if>> 
		      		<a class="input_title" data-v-4e1fd2e6="" data-v-2b15bea4="">아이디 저장</a>
		      	</label>
<!-- 				<div><a href="member_find_emailAuth" class="look_link" data-v-4e1fd2e6="" data-v-2b15bea4="">인증 메일이 오지 않아요</a></div> -->
				<div class="social_login" data-v-2b15bea4="">
					<button type="button" class="btn btn_login_naver full outline" data-v-43813796="" data-v-2b15bea4="" >
						<img src="${pageContext.request.contextPath}/resources/mypage_img/btn_naver.svg">
<!-- 						<svg xmlns="http://www.w3.org/2000/svg" class="logo-social icon sprite-icons" data-v-2b15bea4=""> -->
<!-- 							<use href="/_nuxt/54eaabd5a726b216f3c53922147167ee.svg#i-logo-naver" xlink:href="/_nuxt/54eaabd5a726b216f3c53922147167ee.svg#i-logo-naver" data-v-2b15bea4=""></use> -->
<!-- 						</svg>  -->
						네이버로 로그인 
					</button>
					
					

					
					<button type="button" class="btn btn_login_apple full outline" data-v-43813796="" data-v-2b15bea4="">
						<img src="${pageContext.request.contextPath}/resources/mypage_img/btn_kakao.svg">
<!-- 						<svg xmlns="http://www.w3.org/2000/svg" class="logo-social icon sprite-icons" data-v-2b15bea4=""> -->
<!-- 							<use href="/_nuxt/54eaabd5a726b216f3c53922147167ee.svg#i-logo-apple" xlink:href="/_nuxt/54eaabd5a726b216f3c53922147167ee.svg#i-logo-apple" data-v-2b15bea4=""></use> -->
<!-- 						</svg>  -->
						카카오로 로그인 
					</button>
					<button type="button" class="btn btn_login_google full outline" data-v-43813796="" data-v-2b15bea4="" >
					<img src="${pageContext.request.contextPath}/resources/mypage_img/btn_google.svg">
<!-- <!-- 						<svg xmlns="http://www.w3.org/2000/svg" class="logo-social icon sprite-icons" data-v-2b15bea4=""> -->
<!-- <!-- 							<use href="/_nuxt/54eaabd5a726b216f3c53922147167ee.svg#i-logo-apple" xlink:href="/_nuxt/54eaabd5a726b216f3c53922147167ee.svg#i-logo-google" data-v-2b15bea4=""></use> -->
<!-- <!-- 						</svg>  -->
						구글로 로그인 
					</button>
<!-- 					<div class="blind" style="visibility: hidden;"> -->
						<div id="g_id_onload"
						     data-client_id="763453617602-e7goeun627q5nji64obqjr3ir1nc9rd7.apps.googleusercontent.com"
						     data-callback="handleCredentialResponse">
						</div>
						<div class="g_id_signin" data-size="large" data-type="standard" data-logo_alignment="center" data-text="signup_with" data-shape="rectangular" ></div>
<!-- 					</div> -->
				</div>
				</div>
			</div>
		</div>
	</form>
  </article>
  
  <nav id="mainNav" class="d-none d-md-block sidebar">
  <%--왼쪽 사이드바 --%>
  </nav>
  
  <div id="sieAds"></div>
  <%--페이지 하단 --%>
<%--   <footer id="pageFooter"><%@ include file="assets/inc/footer.jsp"%></footer> --%>

  
  <%-- 스크립트 코드 --%>
<!--   <script src="/_nuxt/0fc2b9a.js" defer=""></script> -->
<!--   <script src="/_nuxt/c2849e3.js" defer=""></script> -->
<!--   <script src="/_nuxt/6d1f03a.js" defer=""></script> -->
<!--   <script src="/_nuxt/5402e5b.js" defer=""></script> -->
<!--   <script src="/_nuxt/31641e8.js" defer=""></script> -->
<!--   <link href="/_nuxt/css/6ca5ffb.css" rel="stylesheet" type="text/css"> -->
<!--   <link href="/_nuxt/css/caea5a4.css" rel="stylesheet" type="text/css"> -->
<!-- <script src="https://accounts.google.com/gsi/client" async></script> -->
<script>
// 	function init() {
// 		 gapi.load('auth2', function() {
// 		  console.log("init()시작");
// 		  auth2 = gapi.auth2.init({
// 		        client_id: '763453617602-e7goeun627q5nji64obqjr3ir1nc9rd7.apps.googleusercontent.com'
// // 		        cookiepolicy: 'single_host_origin',
// 		      });
// 		      attachSignin(document.getElementById('google_login'));
// 		 });
// 	}
</script>
<script>

	//처음 실행하는 함수
	//google signin API
// 	var googleUser = {};
	
//     $(".btn_login_google").on("click",function(){
    	
// 	   	var googleUrl ="https://accounts.google.com/o/oauth2/auth?" +
// 	   	  "client_id=763453617602-e7goeun627q5nji64obqjr3ir1nc9rd7.apps.googleusercontent.com&"+
// 	   	  "redirect_uri=http://localhost:8089/zero/callback_login_google&"+
// 	   	  "response_type=token&"+
// 	   	  "scope=https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile";
    	
// 	   	window.open(googleUrl, 'googleloginpop', 'titlebar=1, resizable=1, scrollbars=yes, width=600, height=550, top=100, left=600');
//     });

	// 구글 로그인 버튼 작동
// 	$(document).ready(function() {
// 	    // 새로 추가한 버튼 클릭 시 동작할 함수를 정의합니다.
// 	    $(".btn_login_google").on("click", function() {
// // 	      alert('구글 버튼 클릭됨');
// 	      // 기존 구글 로그인 버튼을 클릭합니다.
// 	      $(".uaxL4e-RbRzK").on("click");
// // 	      $(".JGcpL-RbRzK").on("click");
// 		// class="nsm7Bb-HzV7m-LgbsSe jVeSEe i5vt6e-Ia7Qfc uaxL4e-RbRzK"
// 	    });
// 	});
	

</script>


<!--  구글 로그인 -->
<script type="text/javascript">
// 	var naver_id_login = new naver_id_login("lmCZvEMfrqOMLdWO1M_n", "http://localhost:8089/zero/callback_login_naver"); // YOUR_CLIENT_ID, YOUR_CALLBACK_URL 
//     var state = naver_id_login.getUniqState();
//     naver_id_login.setButton("white", 2, 40);
//     naver_id_login.setDomain("http://localhost:8089/zero/member_login"); // YOUR_SERVICE_URL
//     naver_id_login.setState(state);
//     naver_id_login.setPopup();
//     naver_id_login.init_naver_id_login();
				        
    var client_id = "763453617602-e7goeun627q5nji64obqjr3ir1nc9rd7.apps.googleusercontent.com";
    var redirect_uri = "http://localhost:8089/zero/callback_login_google";
//     var redirect_uri = "http://c5d2302t1.itwillbs.com/zero/callback_login_google";
    var url = "https://accounts.google.com/o/oauth2/v2/auth?client_id=" + client_id + "&redirect_uri=" + redirect_uri + "&response_type=code&scope=email profile";
    $(".btn_login_google").on("click",function(){
    	window.open(url, "googleloginpop", "titlebar=1, resizable=1, scrollbars=yes, width=600, height=550, top=100 left=600");
//     	location.href=url;
    })
    
//     	https://accounts.google.com/o/oauth2/v2/auth?client_id=
//     	763453617602-e7goeun627q5nji64obqjr3ir1nc9rd7.apps.googleusercontent.com
//     	&redirect_uri=
//     		http://localhost:8089/zero/callback_login_google
//     		&response_type=code
//     		&scope=email profile
</script>
<%-- 네이버 로그인 --%>

<script type="text/javascript">
// 	var naver_id_login = new naver_id_login("lmCZvEMfrqOMLdWO1M_n", "http://localhost:8089/zero/callback_login_naver"); // YOUR_CLIENT_ID, YOUR_CALLBACK_URL 
//     var state = naver_id_login.getUniqState();
//     naver_id_login.setButton("white", 2, 40);
//     naver_id_login.setDomain("http://localhost:8089/zero/member_login"); // YOUR_SERVICE_URL
//     naver_id_login.setState(state);
//     naver_id_login.setPopup();
//     naver_id_login.init_naver_id_login();
				        
    var client_id = "lmCZvEMfrqOMLdWO1M_n";
    var redirect_uri = "http://localhost:8089/zero/callback_login_naver";
	var state = "90aada36-5411-4fe5-bec6-11bc1e78e029";
    $(".btn_login_naver").on("click",function(){
    	window.open("https://nid.naver.com/oauth2.0/authorize?response_type=token&amp;client_id=" + client_id + "&amp;redirect_uri=" + redirect_uri + "&amp;state=" + state, 'naverloginpop', 'titlebar=1, resizable=1, scrollbars=yes, width=600, height=550, top=100 left=600');
    })
</script>

<%--   <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a> --%>
</body>
</html>