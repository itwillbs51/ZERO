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
<!-- <link -->
<%-- 	href="${pageContext.request.contextPath }/resources/css/button.css" --%>
<!-- 	rel="stylesheet" type="text/css"> -->
	
<%-- vue.js 링크 --%>
<!-- <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script> -->
<!-- <style type="text/css"> /*# sourceMappingURL=contenteditable.vue.map */</style> -->



<!--   <meta data-n-head="ssr" charset="utf-8"><meta data-n-head="ssr" data-hid="description" name="description" content="한정판 거래의 FLEX, KICKS RULE EVERYTHING AROUND ME"><meta data-n-head="ssr" data-hid="viewport" name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"><meta data-n-head="ssr" name="apple-mobile-web-app-title" content="KREAM"><meta data-n-head="ssr" name="application-name" content="KREAM"><meta data-n-head="ssr" name="msapplication-TileColor" content="#111111"><meta data-n-head="ssr" name="theme-color" content="#ffffff"><meta data-n-head="ssr" name="msapplication-config" content="/browserconfig.xml"><meta data-n-head="ssr" data-hid="google-site-verification" name="google-site-verification" content="n9xvZpoumVa_cedth9bLo1fgwQfIoGkw0Jmkray34FM"><meta data-n-head="ssr" data-hid="naver-site-verification" name="naver-site-verification" property="naver-site-verification" content="ecf6ec0ed503754fbcec5f8c0a1fa4e94297f425"><meta data-n-head="ssr" data-hid="twitter:card" name="twitter:card" property="twitter:card" content="summary_large_image"><meta data-n-head="ssr" data-hid="og:type" name="og:type" property="og:type" content="website"><meta data-n-head="ssr" data-hid="og:title" name="og:title" property="og:title" content="KREAM | 한정판 거래의 FLEX"><meta data-n-head="ssr" data-hid="og:description" name="og:description" property="og:description" content="한정판을 거래하는 가장 확실한 방법"><meta data-n-head="ssr" data-hid="og:image" name="og:image" property="og:image" content="https://kream.co.kr/images/index_og_kream.png"><meta data-n-head="ssr" data-hid="format-detection" name="format-detection" content="telephone=no"><link data-n-head="ssr" rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png"><link data-n-head="ssr" rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png"><link data-n-head="ssr" rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png"><link data-n-head="ssr" rel="manifest" href="/site.webmanifest"><link data-n-head="ssr" rel="mask-icon" href="/safari-pinned-tab.svg" color="#111111"><link data-n-head="ssr" rel="search" type="application/opensearchdescription+xml" href="/resources/opensearch.xml" title="KREAM | 한정판 거래의 FLEX"><link data-n-head="ssr" rel="preconnect" href="//kream-phinf.pstatic.net"><link data-n-head="ssr" rel="preconnect" href="https://www.googletagmanager.com"><link data-n-head="ssr" rel="preconnect" href="https://connect.facebook.net"><script async="" src="https://websdk.appsflyer.com?st=pba&amp;"></script><script async="" src="https://websdk.appsflyer.com?st=pba&amp;"></script><script async="" src="https://websdk.appsflyer.com?st=pba&amp;"></script><script async="" src="https://websdk.appsflyer.com?st=pba&amp;"></script><script async="" src="https://websdk.appsflyer.com?st=pba&amp;"></script><script async="" src="https://websdk.appsflyer.com?st=pba&amp;"></script><script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script><script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=G-5LYDPM15LW&amp;l=dataLayer&amp;cx=c"></script><script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=UA-153398119-1&amp;l=dataLayer&amp;cx=c"></script><script async="" src="https://websdk.appsflyer.com?st=pba&amp;"></script><script src="https://connect.facebook.net/signals/config/740347893514718?v=2.9.111&amp;r=stable" async=""></script><script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script><script data-n-head="ssr" type="application/ld+json">{"@context":"http://schema.org","@type":"Organization","name":"KREAM","url":"https://kream.co.kr/","logo":"https://kream.co.kr/images/logo.png","sameAs":["https://apps.apple.com/app/id1490580239","https://play.google.com/store/apps/details?id=com.fstudio.kream","https://www.instagram.com/kream.co.kr/","https://www.youtube.com/channel/UCHbInfTxnIbWlUFin7drigw"]}</script><link rel="preload" href="/_nuxt/0fc2b9a.js" as="script"><link rel="preload" href="/_nuxt/6d1f03a.js" as="script"><link rel="preload" href="/_nuxt/css/04c034c.css" as="style"><link rel="preload" href="/_nuxt/5402e5b.js" as="script"><link rel="preload" href="/_nuxt/css/6115a6e.css" as="style"><link rel="preload" href="/_nuxt/31641e8.js" as="script"><link rel="preload" href="/_nuxt/css/6ca5ffb.css" as="style"><link rel="preload" href="/_nuxt/c2849e3.js" as="script"><link rel="stylesheet" href="/_nuxt/css/04c034c.css"><link rel="stylesheet" href="/_nuxt/css/6115a6e.css"><link rel="stylesheet" href="/_nuxt/css/6ca5ffb.css"> -->
<!--   <style type="text/css"> /*# sourceMappingURL=contenteditable.vue.map */</style><style type="text/css">.vue-slider-dot{position:absolute;-webkit-transition:all 0s;transition:all 0s;z-index:5}.vue-slider-dot:focus{outline:none}.vue-slider-dot-tooltip{position:absolute;visibility:hidden}.vue-slider-dot-hover:hover .vue-slider-dot-tooltip,.vue-slider-dot-tooltip-show{visibility:visible}.vue-slider-dot-tooltip-top{top:-10px;left:50%;-webkit-transform:translate(-50%,-100%);transform:translate(-50%,-100%)}.vue-slider-dot-tooltip-bottom{bottom:-10px;left:50%;-webkit-transform:translate(-50%,100%);transform:translate(-50%,100%)}.vue-slider-dot-tooltip-left{left:-10px;top:50%;-webkit-transform:translate(-100%,-50%);transform:translate(-100%,-50%)}.vue-slider-dot-tooltip-right{right:-10px;top:50%;-webkit-transform:translate(100%,-50%);transform:translate(100%,-50%)}</style><style type="text/css">.vue-slider-marks{position:relative;width:100%;height:100%}.vue-slider-mark{position:absolute;z-index:1}.vue-slider-ltr .vue-slider-mark,.vue-slider-rtl .vue-slider-mark{width:0;height:100%;top:50%}.vue-slider-ltr .vue-slider-mark-step,.vue-slider-rtl .vue-slider-mark-step{top:0}.vue-slider-ltr .vue-slider-mark-label,.vue-slider-rtl .vue-slider-mark-label{top:100%;margin-top:10px}.vue-slider-ltr .vue-slider-mark{-webkit-transform:translate(-50%,-50%);transform:translate(-50%,-50%)}.vue-slider-ltr .vue-slider-mark-step{left:0}.vue-slider-ltr .vue-slider-mark-label{left:50%;-webkit-transform:translateX(-50%);transform:translateX(-50%)}.vue-slider-rtl .vue-slider-mark{-webkit-transform:translate(50%,-50%);transform:translate(50%,-50%)}.vue-slider-rtl .vue-slider-mark-step{right:0}.vue-slider-rtl .vue-slider-mark-label{right:50%;-webkit-transform:translateX(50%);transform:translateX(50%)}.vue-slider-btt .vue-slider-mark,.vue-slider-ttb .vue-slider-mark{width:100%;height:0;left:50%}.vue-slider-btt .vue-slider-mark-step,.vue-slider-ttb .vue-slider-mark-step{left:0}.vue-slider-btt .vue-slider-mark-label,.vue-slider-ttb .vue-slider-mark-label{left:100%;margin-left:10px}.vue-slider-btt .vue-slider-mark{-webkit-transform:translate(-50%,50%);transform:translate(-50%,50%)}.vue-slider-btt .vue-slider-mark-step{top:0}.vue-slider-btt .vue-slider-mark-label{top:50%;-webkit-transform:translateY(-50%);transform:translateY(-50%)}.vue-slider-ttb .vue-slider-mark{-webkit-transform:translate(-50%,-50%);transform:translate(-50%,-50%)}.vue-slider-ttb .vue-slider-mark-step{bottom:0}.vue-slider-ttb .vue-slider-mark-label{bottom:50%;-webkit-transform:translateY(50%);transform:translateY(50%)}.vue-slider-mark-label,.vue-slider-mark-step{position:absolute}</style><style type="text/css">.vue-slider{position:relative;-webkit-box-sizing:content-box;box-sizing:content-box;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;display:block;-webkit-tap-highlight-color:rgba(0,0,0,0)}.vue-slider-rail{position:relative;width:100%;height:100%;-webkit-transition-property:width,height,left,right,top,bottom;transition-property:width,height,left,right,top,bottom}.vue-slider-process{position:absolute;z-index:1}</style><script charset="utf-8" src="/_nuxt/6b9fce8.js"></script><script charset="utf-8" src="/_nuxt/bf9bb52.js"></script><script type="text/javascript" async="" src="https://wcs.naver.net/wcslog.js" id="naver-ads" data-loaded="true"></script><script src="https://www.googletagmanager.com/gtag/js?l=dataLayer&amp;id=G-SRFKTMTR0R" async=""></script><link rel="preload" as="style" href="/_nuxt/css/caea5a4.css"><script charset="utf-8" src="/_nuxt/ddc8c64.js"></script><meta http-equiv="origin-trial" content="AymqwRC7u88Y4JPvfIF2F37QKylC04248hLCdJAsh8xgOfe/dVJPV3XS3wLFca1ZMVOtnBfVjaCMTVudWM//5g4AAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjk1MTY3OTk5LCJpc1RoaXJkUGFydHkiOnRydWV9"><meta http-equiv="origin-trial" content="AymqwRC7u88Y4JPvfIF2F37QKylC04248hLCdJAsh8xgOfe/dVJPV3XS3wLFca1ZMVOtnBfVjaCMTVudWM//5g4AAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjk1MTY3OTk5LCJpc1RoaXJkUGFydHkiOnRydWV9"><meta data-n-head="ssr" name="robots" content="noindex"><meta data-n-head="ssr" data-hid="page-name" name="page-name" property="page-name" content="sign_in"><meta data-n-head="ssr" data-hid="Pragma" http-equiv="Pragma" content="no-cache"><meta data-n-head="ssr" data-hid="Expires" http-equiv="Expires" content="0"><meta data-n-head="ssr" data-hid="Cache-Control" http-equiv="Cache-Control" content="no-cache"><script data-n-head="ssr" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script> -->
<!-- <style type="text/css">.vue-slider{position:relative;-webkit-box-sizing:content-box;box-sizing:content-box;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;display:block;-webkit-tap-highlight-color:rgba(0,0,0,0)}.vue-slider-rail{position:relative;width:100%;height:100%;-webkit-transition-property:width,height,left,right,top,bottom;transition-property:width,height,left,right,top,bottom}.vue-slider-process{position:absolute;z-index:1}</style> -->
<!-- <script charset="utf-8" src="/_nuxt/6b9fce8.js"></script> -->
<!-- <script charset="utf-8" src="/_nuxt/bf9bb52.js"></script> -->
<!-- <script type="text/javascript" async="" src="https://wcs.naver.net/wcslog.js" id="naver-ads" data-loaded="true"></script> -->
<!-- <script src="https://www.googletagmanager.com/gtag/js?l=dataLayer&amp;id=G-SRFKTMTR0R" async=""></script> -->
<!-- <link rel="preload" as="style" href="/_nuxt/css/caea5a4.css"> -->
<!-- <script charset="utf-8" src="/_nuxt/ddc8c64.js"></script> -->
<!-- <meta http-equiv="origin-trial" content="AymqwRC7u88Y4JPvfIF2F37QKylC04248hLCdJAsh8xgOfe/dVJPV3XS3wLFca1ZMVOtnBfVjaCMTVudWM//5g4AAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjk1MTY3OTk5LCJpc1RoaXJkUGFydHkiOnRydWV9"> -->
<!-- <meta http-equiv="origin-trial" content="AymqwRC7u88Y4JPvfIF2F37QKylC04248hLCdJAsh8xgOfe/dVJPV3XS3wLFca1ZMVOtnBfVjaCMTVudWM//5g4AAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjk1MTY3OTk5LCJpc1RoaXJkUGFydHkiOnRydWV9"> -->
<!-- <meta data-n-head="ssr" name="robots" content="noindex"> -->
<!-- <meta data-n-head="ssr" data-hid="page-name" name="page-name" property="page-name" content="sign_in"> -->
<!-- <meta data-n-head="ssr" data-hid="Pragma" http-equiv="Pragma" content="no-cache"> -->
<!-- <meta data-n-head="ssr" data-hid="Expires" http-equiv="Expires" content="0"> -->
<!-- <meta data-n-head="ssr" data-hid="Cache-Control" http-equiv="Cache-Control" content="no-cache"> -->
<!-- <script data-n-head="ssr" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script> -->
<title>중고거래 사이트</title>
<style>

.login_title {
	text-align: center;
}

.login_area[data-v-2b15bea4] {
    margin: 0 auto;
    padding: 60px 0 160px;
    width: 400px;
}

.logo-social[data-v-2b15bea4] {
    position: absolute;
    width: 24px;
    height: 24px;
    top: 13px;
    left: 15px;
}
.input_title[data-v-4e1fd2e6] {
    font-size: 13px;
    letter-spacing: -.07px;
    line-height: 18px;
}

.solid.disabled[data-v-43813796], .solid[data-v-43813796]:disabled {
    background-color: #ebebeb;
    color: #fff;
    cursor: default;
}

.has_button .input_txt[data-v-4e1fd2e6] {
    padding-right: 30px;
    height: 38px;
}

.input_txt[data-v-4e1fd2e6] {
    padding: 8px 0;
    width: 100%;
    font-size: 15px;
    letter-spacing: -.15px;
    line-height: 22px;
    border-bottom: 1px solid #ebebeb;
}

input, textarea {
    padding: 0;
    outline: 0;
    border: 0;
    resize: none;
    border-radius: 0;
    -webkit-appearance: none;
    background-color: transparent;
}

.btn[data-v-43813796] {
    display: inline-flex;
    cursor: pointer;
    align-items: center;
    justify-content: center;
    vertical-align: middle;
    text-align: center;
    color: rgba(34,34,34,.8);
    background-color: #fff;
}

.look_link[data-v-2b15bea4] {
    margin: auto;
    padding: 0 10px;
    display: inline-flex;
    font-size: 13px;
    letter-spacing: -.07px;
}


	
<%-- 인증에러 --%>
.input_error[data-v-4e1fd2e6] {
    display: none;
}

*, :after, :before {
    box-sizing: border-box;
    -webkit-tap-highlight-color: rgba(0,0,0,0);
}

.full[data-v-43813796] {
    width: 100%;
    font-size: 16px;
    letter-spacing: -.16px;
    font-weight: 700;
    height: 52px;
    border-radius: 12px;
}

 div {
    padding: 0px;
    background: white;
    display: block;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}



.solid[data-v-43813796] {
    font-weight: 700;
    color: #fff;
    background-color: #222;
}

*, :after, :before {
    box-sizing: border-box;
    -webkit-tap-highlight-color: rgba(0,0,0,0);
}

link {
    display: none;
}

body, button, input, select, table, textarea {
    font-family: Pretendard Variable,Pretendard,-apple-system,BlinkMacSystemFont,system-ui,Segoe UI,Roboto,Ubuntu,Cantarell,Noto Sans,sans-serif,Helvetica Neue,Apple SD Gothic Neo,Noto Sans KR,Malgun Gothic,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol;
    color: #222;
    -webkit-font-feature-settings: "frac" 0,"numr" 0;
    font-feature-settings: "frac" 0,"numr" 0;
}

.look_box[data-v-2b15bea4] {
    margin-top: 20px;
    display: flex;
    justify-content: space-evenly;
}

li, ol, ul {
    list-style: none;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
<%-- 로그인 버튼 --%>
.login_btn_box[data-v-2b15bea4] {
    padding-top: 20px;
}

.social_login>.btn[data-v-2b15bea4] {
    margin-bottom: 8px;
}

.outline[data-v-43813796] {
    border: 1px solid #d3d3d3;
}

.social_login img {
	width:30px;
}

.input_check {
	width:20px;
	height:20px;
}

<%-- 체크박스 버튼 --%>
input[type=checkbox] {
    width: 20px;
    height: 20px;
    background-color: #fff;
    border: 1px solid #ccc;
    appearance: checkbox;
    -webkit-appearance: checkbox;
    -moz-appearance: checkbox;
}

<%-- 구글 로그인 버튼 --%>
.nsm7Bb-HzV7m-LgbsS {
	width: 400px;
	height: 52px;
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
	

		
	// 로그인 버튼 작동
	function clickLogin() {
		alert('로그인 클릭됨');
		$("#loginForm").submit();
	}
</script>


</head>
<body>
<%-- 구글 로그인 --%>
 <%
    String clientId = "763453617602-e7goeun627q5nji64obqjr3ir1nc9rd7.apps.googleusercontent.com";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8089/zero/callback_login_google", "UTF-8");
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
					<span class="blind" data-v-2b15bea4="">ZERO</span>
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
					<p class="input_error" data-v-4e1fd2e6="" data-v-2b15bea4="">이메일 주소를 정확히 입력해주세요.</p>
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
				<div><a href="member_find_emailAuth" class="look_link" data-v-4e1fd2e6="" data-v-2b15bea4="">인증 메일이 오지 않아요</a></div>
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
<!-- 						<svg xmlns="http://www.w3.org/2000/svg" class="logo-social icon sprite-icons" data-v-2b15bea4=""> -->
<!-- 							<use href="/_nuxt/54eaabd5a726b216f3c53922147167ee.svg#i-logo-apple" xlink:href="/_nuxt/54eaabd5a726b216f3c53922147167ee.svg#i-logo-google" data-v-2b15bea4=""></use> -->
<!-- 						</svg>  -->
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
	$(document).ready(function() {
	    // 새로 추가한 버튼 클릭 시 동작할 함수를 정의합니다.
	    $(".btn_login_google").on("click", function() {
// 	      alert('구글 버튼 클릭됨');
	      // 기존 구글 로그인 버튼을 클릭합니다.
	      $(".uaxL4e-RbRzK").on("click");
// 	      $(".JGcpL-RbRzK").on("click");
		// class="nsm7Bb-HzV7m-LgbsSe jVeSEe i5vt6e-Ia7Qfc uaxL4e-RbRzK"
	    });
	  });

</script>


<!--  네이버 로그인 시작 -->
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