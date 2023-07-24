<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	href="${pageContext.request.contextPath }/resources/css/button.css"
	rel="stylesheet" type="text/css">
	
<%-- vue.js 링크 --%>
<!-- <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script> -->
<!-- <style type="text/css"> /*# sourceMappingURL=contenteditable.vue.map */</style> -->



<!-- <meta data-n-head="ssr" charset="utf-8"><meta data-n-head="ssr" data-hid="description" name="description" content="한정판 거래의 FLEX, KICKS RULE EVERYTHING AROUND ME"><meta data-n-head="ssr" data-hid="viewport" name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"><meta data-n-head="ssr" name="apple-mobile-web-app-title" content="KREAM"><meta data-n-head="ssr" name="application-name" content="KREAM"><meta data-n-head="ssr" name="msapplication-TileColor" content="#111111"><meta data-n-head="ssr" name="theme-color" content="#ffffff"><meta data-n-head="ssr" name="msapplication-config" content="/browserconfig.xml"><meta data-n-head="ssr" data-hid="google-site-verification" name="google-site-verification" content="n9xvZpoumVa_cedth9bLo1fgwQfIoGkw0Jmkray34FM"><meta data-n-head="ssr" data-hid="naver-site-verification" name="naver-site-verification" property="naver-site-verification" content="ecf6ec0ed503754fbcec5f8c0a1fa4e94297f425"><meta data-n-head="ssr" data-hid="twitter:card" name="twitter:card" property="twitter:card" content="summary_large_image"><meta data-n-head="ssr" data-hid="og:type" name="og:type" property="og:type" content="website"><meta data-n-head="ssr" data-hid="og:title" name="og:title" property="og:title" content="KREAM | 한정판 거래의 FLEX"><meta data-n-head="ssr" data-hid="og:description" name="og:description" property="og:description" content="한정판을 거래하는 가장 확실한 방법"><meta data-n-head="ssr" data-hid="og:image" name="og:image" property="og:image" content="https://kream.co.kr/images/index_og_kream.png"><meta data-n-head="ssr" data-hid="format-detection" name="format-detection" content="telephone=no"><link data-n-head="ssr" rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png"><link data-n-head="ssr" rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png"><link data-n-head="ssr" rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png"><link data-n-head="ssr" rel="manifest" href="/site.webmanifest"><link data-n-head="ssr" rel="mask-icon" href="/safari-pinned-tab.svg" color="#111111"><link data-n-head="ssr" rel="search" type="application/opensearchdescription+xml" href="/resources/opensearch.xml" title="KREAM | 한정판 거래의 FLEX"><link data-n-head="ssr" rel="preconnect" href="//kream-phinf.pstatic.net"><link data-n-head="ssr" rel="preconnect" href="https://www.googletagmanager.com"><link data-n-head="ssr" rel="preconnect" href="https://connect.facebook.net"><script async="" src="https://websdk.appsflyer.com?st=pba&amp;"></script><script async="" src="https://websdk.appsflyer.com?st=pba&amp;"></script><script async="" src="https://websdk.appsflyer.com?st=pba&amp;"></script><script async="" src="https://websdk.appsflyer.com?st=pba&amp;"></script><script async="" src="https://websdk.appsflyer.com?st=pba&amp;"></script><script async="" src="https://websdk.appsflyer.com?st=pba&amp;"></script><script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script><script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=G-5LYDPM15LW&amp;l=dataLayer&amp;cx=c"></script><script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=UA-153398119-1&amp;l=dataLayer&amp;cx=c"></script><script async="" src="https://websdk.appsflyer.com?st=pba&amp;"></script><script src="https://connect.facebook.net/signals/config/740347893514718?v=2.9.111&amp;r=stable" async=""></script><script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script><script data-n-head="ssr" type="application/ld+json">{"@context":"http://schema.org","@type":"Organization","name":"KREAM","url":"https://kream.co.kr/","logo":"https://kream.co.kr/images/logo.png","sameAs":["https://apps.apple.com/app/id1490580239","https://play.google.com/store/apps/details?id=com.fstudio.kream","https://www.instagram.com/kream.co.kr/","https://www.youtube.com/channel/UCHbInfTxnIbWlUFin7drigw"]}</script><link rel="preload" href="/_nuxt/0fc2b9a.js" as="script"><link rel="preload" href="/_nuxt/6d1f03a.js" as="script"><link rel="preload" href="/_nuxt/css/04c034c.css" as="style"><link rel="preload" href="/_nuxt/5402e5b.js" as="script"><link rel="preload" href="/_nuxt/css/6115a6e.css" as="style"><link rel="preload" href="/_nuxt/31641e8.js" as="script"><link rel="preload" href="/_nuxt/css/6ca5ffb.css" as="style"><link rel="preload" href="/_nuxt/c2849e3.js" as="script"><link rel="stylesheet" href="/_nuxt/css/04c034c.css"><link rel="stylesheet" href="/_nuxt/css/6115a6e.css"><link rel="stylesheet" href="/_nuxt/css/6ca5ffb.css"> -->
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

.container.my .content_area[data-v-78dabb2d] {
    overflow: hidden;
    min-height: 380px;
}
.content_title.border[data-v-88eb18f6] {
    padding-bottom: 16px;
    border-bottom: 3px solid #222;
}
.profile_info[data-v-cf6a6ef4] {
    padding-top: 38px;
    max-width: 480px;
}
.profile_group[data-v-8b96a82e]:first-of-type {
    padding-top: 0;
}
.group_title[data-v-8b96a82e] {
    font-size: 18px;
    letter-spacing: -.27px;
}
.unit[data-v-0c9f3f9e] {
    display: flex;
    flex-direction: column;
    padding: 25px 0 12px;
    position: relative;
    border-bottom: 1px solid #ebebeb;
}
.title[data-v-0c9f3f9e] {
    font-size: 13px;
    letter-spacing: -.07px;
    font-weight: 400;
    color: rgba(34,34,34,.5);
}
.unit_content[data-v-0c9f3f9e] {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}
.desc[data-v-24a03828] {
    flex: 1;
    padding-top: 8px;
    padding-bottom: 8px;
    font-size: 16px;
    letter-spacing: -.16px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.btn_modify[data-v-cf6a6ef4] {
    position: absolute;
    right: 0;
}

.outlinegrey[data-v-43813796] {
    border: 1px solid #d3d3d3;
    color: rgba(34,34,34,.8);
}
.small[data-v-43813796], .xsmall[data-v-43813796] {
    font-size: 12px;
    letter-spacing: -.06px;
}
.small[data-v-43813796] {
    padding: 0 14px;
    height: 34px;
    border-radius: 10px;
}
.lg .profile_group[data-v-8b96a82e], .md .profile_group[data-v-8b96a82e] {
    padding-top: 58px;
}
.radio_txt_box .radio_item[data-v-42808438] {
    position: relative;
    margin-top: 0;
    float: left;
}
.radio_txt_box .radio_label[data-v-42808438] {
    overflow: hidden;
    padding: 0;
    font-size: 14px;
    letter-spacing: -.21px;
    color: rgba(34,34,34,.8);
}
.radio_txt_box [class*=ico-][data-v-42808438] {
    float: right;
}
.radio_txt_box .label_txt[data-v-42808438] {
    float: right;
    margin-top: 2px;
    margin-right: 4px;
}
h4 {
    display: block;
    margin-block-start: 1.33em;
    margin-block-end: 1.33em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
*, :after, :before {
    box-sizing: border-box;
    -webkit-tap-highlight-color: rgba(0,0,0,0);
}
input:not([type="range"]):not([type="color"]) {
    writing-mode: horizontal-tb !important;
}


p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
body, button, dd, div, dl, dt, fieldset, figcaption, figure, form, h1, h2, h3, h4, h5, h6, input, legend, li, ol, select, table, td, textarea, th, ul {
    margin: 0;
    padding: 0;
}


</style>
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
<%--  <header id="pageHeader"><%@ include file="assets/inc/header_zero.jsp"%></header> --%>
 
  <%--본문내용 --%>
  <article id="mainArticle">
	<div data-v-cf6a6ef4="" data-v-78dabb2d="" class="content_area">
		<div data-v-cf6a6ef4="" class="my_profile">
			<div data-v-88eb18f6="" data-v-cf6a6ef4="" class="content_title border">
				<div data-v-88eb18f6="" class="title">
					<h3 data-v-88eb18f6="">로그인 정보</h3>
				</div>
			</div>
			<div data-v-cf6a6ef4="" class="profile_info">
				<div data-v-8b96a82e="" data-v-cf6a6ef4="" class="profile_group">
					<h4 data-v-8b96a82e="" class="group_title">내 계정</h4>
					<div data-v-0c9f3f9e="" data-v-cf6a6ef4="" class="unit" data-v-8b96a82e="">
						<h5 data-v-0c9f3f9e="" class="title">이메일 주소</h5>
						<div data-v-0c9f3f9e="" class="unit_content">
							<p data-v-24a03828="" data-v-cf6a6ef4="" class="desc email" data-v-0c9f3f9e="">itwillbs5.1@google.com</p>
							<button data-v-43813796="" data-v-cf6a6ef4="" type="button" class="btn btn_modify outlinegrey small" data-v-0c9f3f9e=""> 변경 </button>
						</div>
					</div>
					<div data-v-cf6a6ef4="" data-v-8b96a82e="" class="modify" style="display: none;">
						<div data-v-4e1fd2e6="" data-v-cf6a6ef4="" class="input_box" data-v-8b96a82e="">
							<h6 data-v-cf6a6ef4="" data-v-4e1fd2e6="" class="input_title">이메일 주소 변경</h6>
						<div data-v-4e1fd2e6="" class="input_item">
							<input data-v-4e1fd2e6="" type="email" autocomplete="off" class="input_txt" placeholder="s******3@naver.com"></div>
							<p data-v-cf6a6ef4="" data-v-4e1fd2e6="" class="input_error">  </p>
						</div>
						<div data-v-cf6a6ef4="" data-v-8b96a82e="" class="modify_btn_box">
							<button data-v-43813796="" data-v-cf6a6ef4="" type="button" class="btn outlinegrey medium" slot="button" data-v-8b96a82e=""> 취소 </button>
							<button data-v-43813796="" data-v-cf6a6ef4="" disabled="disabled" type="button" class="btn solid medium disabled" slot="button" data-v-8b96a82e=""> 인증 메일 발송 </button>
						</div>
					</div>
					<div data-v-0c9f3f9e="" data-v-cf6a6ef4="" class="unit" data-v-8b96a82e="">
						<h5 data-v-0c9f3f9e="" class="title">비밀번호</h5>
						<div data-v-0c9f3f9e="" class="unit_content">
							<p data-v-24a03828="" data-v-cf6a6ef4="" class="desc password" data-v-0c9f3f9e="">●●●●●●●●●</p>
							<button data-v-43813796="" data-v-cf6a6ef4="" type="button" class="btn btn_modify outlinegrey small" data-v-0c9f3f9e=""> 변경 </button>
						</div>
					</div>
					<div data-v-cf6a6ef4="" data-v-8b96a82e="" class="modify" style="display: none;">
						<h5 data-v-cf6a6ef4="" data-v-8b96a82e="" class="title">비밀번호 변경</h5>
						<div data-v-4e1fd2e6="" data-v-cf6a6ef4="" class="input_box" data-v-8b96a82e="">
							<h6 data-v-cf6a6ef4="" data-v-4e1fd2e6="" class="input_title">이전 비밀번호</h6>
							<div data-v-4e1fd2e6="" class="input_item">
								<input data-v-4e1fd2e6="" type="password" placeholder="영문, 숫자, 특수문자 조합 8-16자" autocomplete="off" class="input_txt">
							</div>
							<p data-v-cf6a6ef4="" data-v-4e1fd2e6="" class="input_error"> 영문, 숫자, 특수문자를 조합해서 입력해주세요. (8-16자) </p>
						</div>
						<div data-v-4e1fd2e6="" data-v-cf6a6ef4="" class="input_box" data-v-8b96a82e="">
							<h6 data-v-cf6a6ef4="" data-v-4e1fd2e6="" class="input_title">새 비밀번호</h6>
							<div data-v-4e1fd2e6="" class="input_item">
								<input data-v-4e1fd2e6="" type="password" placeholder="영문, 숫자, 특수문자 조합 8-16자" autocomplete="off" class="input_txt">
							</div>
							<p data-v-cf6a6ef4="" data-v-4e1fd2e6="" class="input_error"> 영문, 숫자, 특수문자를 조합해서 입력해주세요. (8-16자) </p>
						</div>
						<div data-v-cf6a6ef4="" data-v-8b96a82e="" class="modify_btn_box">
							<button data-v-43813796="" data-v-cf6a6ef4="" type="button" class="btn outlinegrey medium" slot="button" data-v-8b96a82e=""> 취소 </button>
							<button data-v-43813796="" data-v-cf6a6ef4="" disabled="disabled" type="button" class="btn solid medium disabled" slot="button" data-v-8b96a82e=""> 저장 </button>
						</div>
					</div>
				</div>
				<div data-v-8b96a82e="" data-v-cf6a6ef4="" class="profile_group">
					<h4 data-v-8b96a82e="" class="group_title">개인 정보</h4>
					<div data-v-0c9f3f9e="" data-v-cf6a6ef4="" class="unit" data-v-8b96a82e="">
						<h5 data-v-0c9f3f9e="" class="title">휴대폰 번호</h5>
						<div data-v-0c9f3f9e="" class="unit_content">
							<p data-v-24a03828="" data-v-cf6a6ef4="" class="desc" data-v-0c9f3f9e="">010-1234-1234</p>
							<button data-v-43813796="" data-v-cf6a6ef4="" type="button" class="btn btn_modify outlinegrey small" data-v-0c9f3f9e=""> 변경 </button>
						</div>
					</div>
					<div data-v-0c9f3f9e="" data-v-cf6a6ef4="" class="unit" data-v-8b96a82e="">
						<h5 data-v-0c9f3f9e="" class="title">신발 사이즈</h5>
						<div data-v-0c9f3f9e="" class="unit_content">
							<p data-v-24a03828="" data-v-cf6a6ef4="" class="desc" data-v-0c9f3f9e="">260</p>
							<button data-v-43813796="" data-v-cf6a6ef4="" type="button" class="btn btn_modify outlinegrey small" data-v-0c9f3f9e=""> 변경 </button>
						</div>
					</div>
					<div data-v-0fdfe010="" data-v-feb03f9c="" data-v-cf6a6ef4="" class="layer lg" data-v-8b96a82e="" style="display: none;">
						<div data-v-0fdfe010="" class="layer_container">
							<a data-v-feb03f9c="" data-v-0fdfe010="" class="btn_layer_close">
								<svg data-v-feb03f9c="" data-v-0fdfe010="" xmlns="http://www.w3.org/2000/svg" class="ico-close icon sprite-icons">
									<use data-v-feb03f9c="" data-v-0fdfe010="" href="/_nuxt/acb390973b7035ca670703769afdcb18.svg#i-ico-close" xlink:href="/_nuxt/acb390973b7035ca670703769afdcb18.svg#i-ico-close"></use>
								</svg>
							</a>
							<div data-v-0fdfe010="" class="layer_header">
								<h2 data-v-feb03f9c="" data-v-0fdfe010="" class="title">사이즈 선택</h2>
							</div>
							<div data-v-0fdfe010="" class="layer_content">
								<div data-v-feb03f9c="" data-v-0fdfe010="" class="size_list_area">
									<div data-v-1b874462="" data-v-feb03f9c="" class="size_item" data-v-0fdfe010="">
										<a data-v-43813796="" data-v-1b874462="" href="#" class="btn outlinegrey medium">
											<span data-v-1b874462="" class="info_txt">220</span>
										</a>
									</div>
									<div data-v-1b874462="" data-v-feb03f9c="" class="size_item" data-v-0fdfe010="">
										<a data-v-43813796="" data-v-1b874462="" href="#" class="btn outlinegrey medium">
											<span data-v-1b874462="" class="info_txt">225</span>
										</a>
									</div>
									<div data-v-1b874462="" data-v-feb03f9c="" class="size_item" data-v-0fdfe010="">
										<a data-v-43813796="" data-v-1b874462="" href="#" class="btn outlinegrey medium">
											<span data-v-1b874462="" class="info_txt">230</span>
										</a>
									</div>
									<div data-v-1b874462="" data-v-feb03f9c="" class="size_item" data-v-0fdfe010="">
										<a data-v-43813796="" data-v-1b874462="" href="#" class="btn outlinegrey medium">
											<span data-v-1b874462="" class="info_txt">235</span>
										</a>
									</div>
									<div data-v-1b874462="" data-v-feb03f9c="" class="size_item" data-v-0fdfe010="">
										<a data-v-43813796="" data-v-1b874462="" href="#" class="btn outlinegrey medium">
											<span data-v-1b874462="" class="info_txt">240</span>
										</a>
									</div>
									<div data-v-1b874462="" data-v-feb03f9c="" class="size_item" data-v-0fdfe010="">
										<a data-v-43813796="" data-v-1b874462="" href="#" class="btn outlinegrey medium">
											<span data-v-1b874462="" class="info_txt">245</span>
										</a>
									</div>
									<div data-v-1b874462="" data-v-feb03f9c="" class="size_item" data-v-0fdfe010="">
										<a data-v-43813796="" data-v-1b874462="" href="#" class="btn outlinegrey medium">
											<span data-v-1b874462="" class="info_txt">250</span>
										</a>
									</div>
									<div data-v-1b874462="" data-v-feb03f9c="" class="size_item" data-v-0fdfe010="">
										<a data-v-43813796="" data-v-1b874462="" href="#" class="btn outlinegrey medium">
											<span data-v-1b874462="" class="info_txt">255</span>
										</a>
									</div>
									<div data-v-1b874462="" data-v-feb03f9c="" class="size_item" data-v-0fdfe010="">
										<a data-v-43813796="" data-v-1b874462="" href="#" class="btn outlinegrey medium on">
											<span data-v-1b874462="" class="info_txt">260</span>
										</a>
									</div>
									<div data-v-1b874462="" data-v-feb03f9c="" class="size_item" data-v-0fdfe010="">
										<a data-v-43813796="" data-v-1b874462="" href="#" class="btn outlinegrey medium">
											<span data-v-1b874462="" class="info_txt">265</span>
										</a>
									</div>
									<div data-v-1b874462="" data-v-feb03f9c="" class="size_item" data-v-0fdfe010="">
										<a data-v-43813796="" data-v-1b874462="" href="#" class="btn outlinegrey medium">
											<span data-v-1b874462="" class="info_txt">270</span>
										</a>
									</div>
									<div data-v-1b874462="" data-v-feb03f9c="" class="size_item" data-v-0fdfe010="">
										<a data-v-43813796="" data-v-1b874462="" href="#" class="btn outlinegrey medium">
											<span data-v-1b874462="" class="info_txt">275</span>
										</a>
									</div>
									<div data-v-1b874462="" data-v-feb03f9c="" class="size_item" data-v-0fdfe010="">
										<a data-v-43813796="" data-v-1b874462="" href="#" class="btn outlinegrey medium">
											<span data-v-1b874462="" class="info_txt">280</span>
										</a>
									</div>
									<div data-v-1b874462="" data-v-feb03f9c="" class="size_item" data-v-0fdfe010="">
										<a data-v-43813796="" data-v-1b874462="" href="#" class="btn outlinegrey medium">
											<span data-v-1b874462="" class="info_txt">285</span>
										</a>
									</div>
									<div data-v-1b874462="" data-v-feb03f9c="" class="size_item" data-v-0fdfe010="">
										<a data-v-43813796="" data-v-1b874462="" href="#" class="btn outlinegrey medium">
											<span data-v-1b874462="" class="info_txt">290</span>
										</a>
									</div>
									<div data-v-1b874462="" data-v-feb03f9c="" class="size_item" data-v-0fdfe010="">
										<a data-v-43813796="" data-v-1b874462="" href="#" class="btn outlinegrey medium">
											<span data-v-1b874462="" class="info_txt">295</span>
										</a>
									</div>
									<div data-v-1b874462="" data-v-feb03f9c="" class="size_item" data-v-0fdfe010="">
										<a data-v-43813796="" data-v-1b874462="" href="#" class="btn outlinegrey medium">
											<span data-v-1b874462="" class="info_txt">300</span>
										</a>
									</div>
								</div>
								<div data-v-feb03f9c="" data-v-0fdfe010="" class="layer_btn">
									<a data-v-43813796="" data-v-feb03f9c="" href="#" class="btn solid medium" data-v-0fdfe010=""> 확인 </a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div data-v-8b96a82e="" data-v-cf6a6ef4="" class="profile_group">
					<h4 data-v-8b96a82e="" class="group_title">광고성 정보 수신</h4>
					<div data-v-0c9f3f9e="" data-v-cf6a6ef4="" class="unit to_receive" data-v-8b96a82e="">
						<div data-v-0c9f3f9e="" class="unit_content">
							<p data-v-24a03828="" data-v-cf6a6ef4="" class="desc" data-v-0c9f3f9e="">문자 메시지</p>
							<div data-v-cf6a6ef4="" data-v-0c9f3f9e="" class="radio_txt_box">
								<div data-v-42808438="" data-v-cf6a6ef4="" class="radio_item" data-v-0c9f3f9e="">
									<input data-v-42808438="" id="agree1" type="radio" name="message_radio" class="radio_input">
									<label data-v-42808438="" for="agree1" class="radio_label">
										<svg data-v-42808438="" xmlns="http://www.w3.org/2000/svg" class="ico-radio-inactive icon sprite-icons">
											<use data-v-42808438="" href="/_nuxt/acb390973b7035ca670703769afdcb18.svg#i-ico-radio-inactive" xlink:href="/_nuxt/acb390973b7035ca670703769afdcb18.svg#i-ico-radio-inactive"></use>
										</svg>
										<span data-v-42808438="" class="label_txt">수신 동의</span>
									</label>
								</div>
								<div data-v-42808438="" data-v-cf6a6ef4="" class="radio_item" data-v-0c9f3f9e="">
									<input data-v-42808438="" id="disagree1" type="radio" name="message_radio" class="radio_input">
									<label data-v-42808438="" for="disagree1" class="radio_label">
										<svg data-v-42808438="" xmlns="http://www.w3.org/2000/svg" class="ico-radio-inactive icon sprite-icons">
											<use data-v-42808438="" href="/_nuxt/acb390973b7035ca670703769afdcb18.svg#i-ico-radio-inactive" xlink:href="/_nuxt/acb390973b7035ca670703769afdcb18.svg#i-ico-radio-inactive"></use>
										</svg>
										<span data-v-42808438="" class="label_txt">수신거부</span>
									</label>
								</div>
							</div>
						</div>
					</div>
					<div data-v-0c9f3f9e="" data-v-cf6a6ef4="" class="unit to_receive" data-v-8b96a82e="">
						<div data-v-0c9f3f9e="" class="unit_content">
							<p data-v-24a03828="" data-v-cf6a6ef4="" class="desc" data-v-0c9f3f9e="">이메일</p>
							<div data-v-cf6a6ef4="" data-v-0c9f3f9e="" class="radio_txt_box">
								<div data-v-42808438="" data-v-cf6a6ef4="" class="radio_item" data-v-0c9f3f9e="">
									<input data-v-42808438="" id="agree2" type="radio" name="email_radio" class="radio_input">
									<label data-v-42808438="" for="agree2" class="radio_label">
										<svg data-v-42808438="" xmlns="http://www.w3.org/2000/svg" class="ico-radio-inactive icon sprite-icons">
											<use data-v-42808438="" href="/_nuxt/acb390973b7035ca670703769afdcb18.svg#i-ico-radio-inactive" xlink:href="/_nuxt/acb390973b7035ca670703769afdcb18.svg#i-ico-radio-inactive"></use>
										</svg>
										<span data-v-42808438="" class="label_txt">수신 동의</span>
									</label>
								</div>
								<div data-v-42808438="" data-v-cf6a6ef4="" class="radio_item" data-v-0c9f3f9e="">
									<input data-v-42808438="" id="disagree2" type="radio" name="email_radio" class="radio_input">
									<label data-v-42808438="" for="disagree2" class="radio_label">
										<svg data-v-42808438="" xmlns="http://www.w3.org/2000/svg" class="ico-radio-inactive icon sprite-icons">
											<use data-v-42808438="" href="/_nuxt/acb390973b7035ca670703769afdcb18.svg#i-ico-radio-inactive" xlink:href="/_nuxt/acb390973b7035ca670703769afdcb18.svg#i-ico-radio-inactive"></use>
										</svg>
										<span data-v-42808438="" class="label_txt">수신거부</span>
									</label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<a data-v-cf6a6ef4="" href="/my/withdrawal" class="btn_withdrawal">회원 탈퇴</a>
			</div>
		</div>
	</div>

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
  
</body>