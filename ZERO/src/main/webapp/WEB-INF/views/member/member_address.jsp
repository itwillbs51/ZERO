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

<%-- 모달 --%>
.article_modal {
  /* 화면에 꽉 차게 하는 코드 */
  position: fixed;
  width: 100%;
  height: 100%;
  
background: rgba(0, 0, 0, 0.35); // 어두운 배경색
  z-index: 250; // 위에서 만든 도화지보다 높게 준다.
/*   cursor: pointer; // 누르면 홈으로 이동 */
}

.background_modal {
  /* 화면에 꽉 차게 하는 코드(여기서는 너비를 꽉 채우는 용도) */
  position: fixed;
  top: 50%;
  left: 50%;
  width: 800px;
  
  /* 위아래 너비를 준 상태에서 가로 50%, 세로 50%를 이동시킬 수 있다 (= 한가운데 배치) */
  transform: translate(-50%, -50%);
  
  /* 위의 overlay 배경보다 한 단계 더 높게 배치 */
  z-index: 300;
}

.layer_content {
  // 내부 컨텐츠 세로 정렬
  display: flex;
  flex-direction: column;
  
  // 아래 closeButton 배치 용도(부모)
  position: relative;
 
 // 모달 디자인
 padding: 80px 28px 50px 27px;
 width: 50%;
 background: white;
 border-radius: 8px; padding:20px;
}
<%-- 모달 끝 --%>

.container.my[data-v-78dabb2d] {
    margin-left: auto;
    margin-right: auto;
    max-width: 1280px;
    padding: 40px 40px 160px;
}
.container.my .content_area[data-v-78dabb2d] {
    overflow: hidden;
    min-height: 380px;
}
.my_addressbook[data-v-2e8df47b] {
    min-height: 315px;
}
.content_title[data-v-88eb18f6] {
    display: flex;
    padding: 5px 0 6px;
}
.title[data-v-88eb18f6] {
    font-size: 24px;
    letter-spacing: -.36px;
}
.title>h3[data-v-88eb18f6] {
    line-height: 29px;
    font-size: inherit;
}
.btn_box .btn[data-v-88eb18f6], .btn_box[data-v-88eb18f6] {
    display: flex;
    align-items: center;
}

.btn_box[data-v-88eb18f6] {
    margin-left: auto;
    padding-left: 30px;
    flex-shrink: 0;
}
.btn_box .btn[data-v-88eb18f6].btn_add {
    margin-right: 0;
    padding: 0 14px;
    height: 34px;
    line-height: 32px;
    border-radius: 10px;
    border: 1px solid #222;
    font-size: 12px;
    letter-spacing: -.06px;
}


<%-- 주소등록 --%>
.layer[data-v-0fdfe010] {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgba(34,34,34,.5);
    z-index: 1010;
}
.layer_header .title[data-v-0fdfe010] {
    line-height: 22px;
    padding: 18px 50px 20px;
    min-height: 60px;
    font-size: 18px;
    letter-spacing: -.27px;
    font-weight: 700;
    letter-spacing: -.15px;
    color: #000;
    text-align: center;
    background-color: #fff;
}

.layer_container[data-v-0fdfe010] {
    overflow: hidden;
    position: absolute;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%,-50%);
    transform: translate(-50%,-50%);
    background-color: #fff;
    width: 448px;
    border-radius: 16px;
    box-shadow: 0 4px 10px 0 rgba(0,0,0,.1);
}
.layer[data-v-0fdfe010] {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgba(34,34,34,.5);
    z-index: 1010;
}

.layer_delivery .layer_container[data-v-0fdfe010] {
    width: 520px;
}
.layer_container[data-v-0fdfe010] {
    overflow: hidden;
    position: absolute;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%,-50%);
    transform: translate(-50%,-50%);
    background-color: #fff;
    width: 448px;
    border-radius: 16px;
    box-shadow: 0 4px 10px 0 rgba(0,0,0,.1);
}

.layer_delivery .input_box[data-v-0fdfe010] {
    padding-top: 16px;
}

.input_box[data-v-4e1fd2e6] {
    position: relative;
    padding: 10px 0 14px;
}

.btn.btn_zipcode[data-v-43813796] {
    position: absolute;
    right: 0;
    bottom: 8px;
}

.outline[data-v-43813796] {
    border: 1px solid #d3d3d3;
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

.btn_layer_close[data-v-0fdfe010] {
    position: absolute;
    top: 18px;
    right: 20px;
    cursor: pointer;
}

a, a:active, a:focus, a:hover {
    text-decoration: none;
}
a {
    color: inherit;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
}

[class*=ico-] {
    width: 24px;
    height: 24px;
}
*, :after, :before {
    box-sizing: border-box;
    -webkit-tap-highlight-color: rgba(0,0,0,0);
}

user agent stylesheet
svg:not(:root) {
    overflow-clip-margin: content-box;
    overflow: hidden;
}

.layer_header .title[data-v-0fdfe010] {
    line-height: 22px;
    padding: 18px 50px 20px;
    min-height: 60px;
    font-size: 18px;
    letter-spacing: -.27px;
    font-weight: 700;
    letter-spacing: -.15px;
    color: #000;
    text-align: center;
    background-color: #fff;
}

.layer_delivery .delivery_bind[data-v-71b8d4b9] {
    padding: 0 32px;
}

.layer_delivery .input_box[data-v-0fdfe010]:first-of-type {
    padding-top: 0;
}

.layer_delivery .input_box[data-v-0fdfe010] {
    padding-top: 16px;
}
.input_box[data-v-4e1fd2e6] {
    position: relative;
    padding: 10px 0 14px;
}

.has_error .input_title[data-v-4e1fd2e6] {
    color: #f15746;
}
.input_title[data-v-4e1fd2e6] {
    font-size: 13px;
    letter-spacing: -.07px;
    line-height: 18px;
}

.input_item[data-v-4e1fd2e6] {
    position: relative;
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
.blind, .u_skip {
    overflow: hidden!important;
    position: absolute!important;
    clip: rect(0,0,0,0)!important;
    width: 1px!important;
    height: 1px!important;
    margin: -1px!important;
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
.checkbox_item[data-v-4c714e9f] {
    position: relative;
    font-size: 0;
}

[class*=ico-] {
    width: 24px;
    height: 24px;
}
.checkbox_item .check_label[data-v-4c714e9f] {
    position: relative;
    cursor: pointer;
    display: inline-block;
}
.checkbox_item .label_txt[data-v-4c714e9f] {
    padding-left: 8px
px
;
    display: inline-block;
    line-height: 24px;
    font-size: 13px;
    letter-spacing: -.07px;
    vertical-align: top;
}

body, button, input, select, table, textarea {
    font-family: Pretendard Variable,Pretendard,-apple-system,BlinkMacSystemFont,system-ui,Segoe UI,Roboto,Ubuntu,Cantarell,Noto Sans,sans-serif,Helvetica Neue,Apple SD Gothic Neo,Noto Sans KR,Malgun Gothic,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol;
    color: #222;
    -webkit-font-feature-settings: "frac" 0,"numr" 0;
    font-feature-settings: "frac" 0,"numr" 0;
}

input:not([type="range"]):not([type="color"]) {
    writing-mode: horizontal-tb !important;
}

*, :after, :before {
    box-sizing: border-box;
    -webkit-tap-highlight-color: rgba(0,0,0,0);
}
user agent stylesheet
svg:not(:root) {
    overflow-clip-margin: content-box;
    overflow: hidden;
}

.layer_delivery .layer_btn[data-v-0fdfe010] {
    padding-top: 32px;
}

.layer_btn[data-v-0fdfe010] {
    padding: 24px 32px 32px;
    display: flex;
    justify-content: center;
}

.layer_btn .btn[data-v-0fdfe010] {
    width: 120px;
}

.outlinegrey[data-v-43813796] {
    border: 1px solid #d3d3d3;
    color: rgba(34,34,34,.8);
}
.medium[data-v-43813796] {
    padding: 0 18px;
    height: 42px;
    border-radius: 12px;
    font-size: 14px;
    letter-spacing: -.14px;
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
a, a:active, a:focus, a:hover {
    text-decoration: none;
}
.layer_btn .btn+.btn[data-v-0fdfe010] {
    margin-left: 8px;
}

.layer_btn .btn[data-v-0fdfe010] {
    width: 120px;
}
.solid.disabled[data-v-43813796], .solid[data-v-43813796]:disabled {
    background-color: #ebebeb;
    color: #fff;
    cursor: default;
}
.solid[data-v-43813796] {
    font-weight: 700;
    color: #fff;
    background-color: #222;
}
.medium[data-v-43813796] {
    padding: 0 18px;
    height: 42px;
    border-radius: 12px;
    font-size: 14px;
    letter-spacing: -.14px;
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


</style>
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
<%--  <header id="pageHeader"><%@ include file="assets/inc/header_zero.jsp"%></header> --%>
 
  <%--본문내용 --%>
  <article id="mainArticle">

	<div data-v-473e7c14="" class="container my lg">
	
		<nav id="mainNav" class="sidebarArea d-none d-md-block sidebar">
			<jsp:include page="/WEB-INF/views/inc/member_sidebar_hyo.jsp"></jsp:include>
		</nav>
	
		<div data-v-473e7c14="" class="background">

			<%-- 본문 - 주소록 관리 --%>
			<div data-v-2e8df47b="" data-v-473e7c14="" class="content_area">
				<div data-v-2e8df47b="" class="my_addressbook">
					<div data-v-88eb18f6="" data-v-2e8df47b="" class="content_title">
						<div data-v-88eb18f6="" class="title">
							<h3 data-v-88eb18f6="">주소록</h3>
						</div>
						<div data-v-88eb18f6="" class="btn_box">
							<a data-v-43813796="" data-v-88eb18f6="" href="#" class="btn btn_add">
								<span data-v-88eb18f6="" class="btn_txt">+ 새 배송지 추가</span>
							</a>
						</div>
					</div>
					<div data-v-1c284ef0="" data-v-2e8df47b="" class="my_list">
						<div data-v-1c284ef0="" class="other">
							<div data-v-1c284ef0="" class="other_list"></div>
						</div>
					</div>
					<div data-v-2e8df47b="">
						<div data-v-6abf8c64="" data-v-2e8df47b="" class="empty_area">
							<p data-v-6abf8c64="" class="desc">배송지 정보가 없습니다.<br>새 배송지를 등록해주세요</p>
							<a data-v-43813796="" data-v-6abf8c64="" href="#" class="btn outlinegrey small"> 새 배송지 추가 </a>
						</div>
					</div>
					
					<%-- 모달 --%>
					<div data-v-78455e2e="" data-v-71b8d4b9="" data-v-2e8df47b="" class="layer_delivery layer lg blind">
					<div data-v-78455e2e="" class="layer_container">
						<a data-v-71b8d4b9="" data-v-78455e2e="" href="#" class="btn_layer_close">
							<div data-v-71b8d4b9="" data-v-78455e2e="">
								<svg data-v-71b8d4b9="" xmlns="http://www.w3.org/2000/svg" class="ico-close icon sprite-icons">
									<use data-v-71b8d4b9="" href="/_nuxt/54eaabd5a726b216f3c53922147167ee.svg#i-ico-close" xlink:href="/_nuxt/54eaabd5a726b216f3c53922147167ee.svg#i-ico-close"></use>
								</svg>
							</div>
						</a>
						<div data-v-78455e2e="" class="layer_content">
							<div data-v-78455e2e="" class="layer_header">
								<h2 data-v-71b8d4b9="" data-v-78455e2e="" class="title"> 새 주소 추가 </h2>
							</div>
							<div data-v-71b8d4b9="" data-v-78455e2e="" class="delivery_bind">
								<div data-v-71b8d4b9="" data-v-78455e2e="" class="delivery_input">
									<div data-v-4e1fd2e6="" data-v-71b8d4b9="" class="input_box has_error" data-v-78455e2e="">
										<h4 data-v-71b8d4b9="" data-v-4e1fd2e6="" class="input_title">이름</h4>
										<div data-v-4e1fd2e6="" class="input_item">
											<input data-v-4e1fd2e6="" type="text" placeholder="수령인의 이름" autocomplete="off" class="input_txt"></div><p data-v-71b8d4b9="" data-v-4e1fd2e6="" class="input_error">올바른 이름을 입력해주세요. (2 - 50자)</p></div>
										<div data-v-4e1fd2e6="" data-v-71b8d4b9="" class="input_box" data-v-78455e2e="">
										<h4 data-v-71b8d4b9="" data-v-4e1fd2e6="" class="input_title">휴대폰 번호</h4>
										<div data-v-4e1fd2e6="" class="input_item">
											<input data-v-4e1fd2e6="" type="tel" placeholder="- 없이 입력" autocomplete="off" class="input_txt">
										</div>
										<p data-v-71b8d4b9="" data-v-4e1fd2e6="" class="input_error">정확한 휴대폰 번호를 입력해주세요.</p>
										</div>
										<div data-v-4e1fd2e6="" data-v-71b8d4b9="" class="input_box" data-v-78455e2e="">
											<h4 data-v-71b8d4b9="" data-v-4e1fd2e6="" class="input_title">우편번호</h4>
											<div data-v-4e1fd2e6="" class="input_item">
												<input data-v-4e1fd2e6="" type="text" placeholder="우편 번호를 검색하세요" readonly="readonly" autocomplete="off" class="input_txt">
													<a data-v-43813796="" data-v-71b8d4b9="" href="#" class="btn btn_zipcode outline small" data-v-4e1fd2e6=""> 우편번호 </a>
											</div>
										</div>
										<div data-v-4e1fd2e6="" data-v-71b8d4b9="" class="input_box" data-v-78455e2e="">
											<h4 data-v-71b8d4b9="" data-v-4e1fd2e6="" class="input_title">주소</h4>
										<div data-v-4e1fd2e6="" class="input_item">
											<input data-v-4e1fd2e6="" type="text" placeholder="우편 번호 검색 후, 자동입력 됩니다" readonly="readonly" autocomplete="off" class="input_txt"></div>
										</div>
										<div data-v-4e1fd2e6="" data-v-71b8d4b9="" class="input_box" data-v-78455e2e="">
											<h4 data-v-71b8d4b9="" data-v-4e1fd2e6="" class="input_title">상세 주소</h4>
											<div data-v-4e1fd2e6="" class="input_item">
												<input data-v-4e1fd2e6="" type="text" placeholder="건물, 아파트, 동/호수 입력" autocomplete="off" class="input_txt">
											</div>
										</div>
									</div>
									<div data-v-71b8d4b9="" data-v-78455e2e="" class="delivery_check">
										<div data-v-4c714e9f="" data-v-71b8d4b9="" class="checkbox_item" data-v-78455e2e="">
											<input data-v-4c714e9f="" id="check1" type="checkbox" name="" class="blind">
											<label data-v-4c714e9f="" for="check1" class="check_label">
												<svg data-v-4c714e9f="" xmlns="http://www.w3.org/2000/svg" class="icon sprite-icons ico-check-inactive">
													<use data-v-4c714e9f="" href="/_nuxt/54eaabd5a726b216f3c53922147167ee.svg#i-ico-check-inactive" xlink:href="/_nuxt/54eaabd5a726b216f3c53922147167ee.svg#i-ico-check-inactive"></use>
												</svg>
												<span data-v-4c714e9f="" class="label_txt">기본 배송지로 설정</span>
											</label>
										</div>
									</div>
								</div>
								<div data-v-71b8d4b9="" data-v-78455e2e="" class="layer_btn">
									<a data-v-43813796="" data-v-71b8d4b9="" href="#" class="btn btn_delete outlinegrey medium" data-v-78455e2e=""> 취소 </a>
									<a data-v-43813796="" data-v-71b8d4b9="" disabled="disabled" href="#" class="btn btn_save solid medium disabled" data-v-78455e2e=""> 저장하기 </a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>							
		</div>
	</div>

  </article>
  
  <nav id="mainNav" class="d-none d-md-block sidebar">
  <%--왼쪽 사이드바 --%>
<%--    <%@ include file="../inc/member_sidebar.jsp"%> --%>

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