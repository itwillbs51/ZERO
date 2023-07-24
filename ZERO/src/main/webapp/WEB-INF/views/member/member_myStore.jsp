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
<%-- 상점 프로필 상단 --%>
.eLimnD {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    background: rgb(255, 255, 255);
}

.gHsrAW {
    /* width: 1024px; */
    margin-top: 30px;
}

.efKeHO {
    display: flex;
    width: 100%;
}
<%-- 프로필 설정 --%>
.cpvyzS {
    width: 310px;
    height: 310px;
    position: relative;
    color: rgb(255, 255, 255);
}
.jhHppC {
    position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
    height: 100%;
    overflow: hidden;
}

.jBJukb {
    position: absolute;
    background-size: cover;
    background-repeat: no-repeat;
    z-index: 0;
    width: 100%;
    height: 100%;
    background-image: url(/pc-static/resource/a1e2916….png);
    background-color: rgb(181, 181, 181);
}

.fFhxdm {
    position: inherit;
    display: flex;
    width: 100%;
    height: 100%;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    flex-direction: column;
    box-shadow: rgba(4, 0, 0, 0.03) 0px 5px 10px 0px;
}

<%-- 프로필 이미지 --%>
.bHnJBW {
    border-radius: 50%;
    margin-bottom: 15px;
    cursor: pointer;
}

img {
    vertical-align: bottom;
    border-style: none;
}

.dxKilp {
    font-size: 16px;
    margin-bottom: 10px;
}

.gIaRHa {
    display: flex;
}

<%-- 내상점관리 버튼 --%>
.jLHspK {
    display: flex;
    margin-top: 20px;
}

.hzlLUQ:first-child {
    margin-left: 0px;
}

.hzlLUQ {
    width: 106px;
    border: 1px solid rgb(255, 255, 255);
    color: rgb(255, 255, 255);
    height: 40px;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    margin-left: 10px;
    font-size: 13px;
}

a {
    color: rgb(33, 33, 33);
    text-decoration: none;
    cursor: pointer;
}

a {
    background-color: transparent;
}

<%-- 상점명 탭 --%>
.hBpLcq {
    flex: 1 0 0%;
    padding: 0px 30px;
    border-top: 1px solid rgb(238, 238, 238);
    border-right: 1px solid rgb(238, 238, 238);
    border-bottom: 1px solid rgb(238, 238, 238);
    display: flex;
    height: 310px;
    flex-direction: column;
}

.fawuLi {
    font-size: 18px;
    height: 75px;
    font-weight: 600;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: justify;
    justify-content: space-between;
    flex-shrink: 0;
}
.fJiQAJ {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
}

<%-- 상점명 수정 버튼 --%>
.fawuLi .sc-ecaExY {
    margin-left: 10px;
}

.cxNNaK {
    height: 20px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    padding: 0px 5px;
    color: rgb(136, 136, 136);
    border: 1px solid rgb(238, 238, 238);
    font-size: 11px;
}

button {
    background-color: transparent;
    cursor: pointer;
    outline: none;
}

button, input[type="text"], input[type="tel"], input[type="number"] {
    appearance: none;
}

button, input {
    padding: 0px;
    border: 0px;
}

body, input, textarea, select, button {
    font-synthesis: none;
    -webkit-font-smoothing: antialiased;
    direction: ltr;
    text-align: left;
    color: rgb(33, 33, 33);
    letter-spacing: -0.5px;
    outline: 0px;
    border: 0px;
}


<%-- 본인인증 완료 --%>
.hYzNdy {
    font-size: 11px;
    color: rgb(77, 77, 77);
    position: relative;
}
.hYzNdy::after {
    content: "OK";
    color: rgb(255, 255, 255);
    font-size: 9px;
    background: rgb(255, 195, 34);
    border-radius: 6px;
    position: absolute;
    padding: 2px 4px 1px;
    top: -1px;
    left: -25px;
}

<%-- 상점오픈일/상점방문수/상품판매/택배발송 --%>
.zhbnl {
    height: 45px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    border-top: 1px solid rgb(250, 250, 250);
    border-bottom: 1px solid rgb(250, 250, 250);
    margin-bottom: 20px;
    flex-shrink: 0;
}
.adWrx {
    margin-right: 30px;
    font-size: 13px;
    color: rgb(136, 136, 136);
    display: flex;
}
.adWrx > img {
    margin-right: 10px;
}

img {
    vertical-align: bottom;
}

img {
    border-style: none;
}

img[Attributes Style] {
    width: 14px;
    aspect-ratio: auto 14 / 13;
    height: 13px;
}

img {
    overflow-clip-margin: content-box;
    overflow: clip;
}

.dBzPWd {
    margin-left: 5px;
    color: rgb(33, 33, 33);
}

.czeXQe {
    -webkit-box-flex: 1;
    flex-grow: 1;
    width: 100%;
    overflow-y: auto;
    line-height: 1.57;
    white-space: pre-wrap;
}

.isYF {
    height: 56px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    flex-shrink: 0;
}

<%-- 상품/상점후기/찜/팔로잉/팔로워창 --%>
.lmEPCP {
    margin-bottom: 30px;
}

*, ::before, ::after {
    box-sizing: border-box;
}
user agent stylesheet
div {
    display: block;
}

.kcRaQl {
    display: flex;
    height: 50px;
}

.JoOgK:first-child {
    border-left: 1px solid rgb(33, 33, 33);
}

.JoOgK {
    flex: 1 1 0%;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    display: flex;
    border-top: 1px solid rgb(33, 33, 33);
    border-right: 1px solid rgb(33, 33, 33);
    border-bottom: 1px solid rgb(255, 255, 255);
    background: rgb(255, 255, 255);
    color: rgb(33, 33, 33);
    font-weight: 600;
}

a {
    color: rgb(33, 33, 33);
    text-decoration: none;
    cursor: pointer;
}

.gtokyO {
    margin-left: 10px;
}

<%-- 선택안된 목록 --%>
.eXINrs {
    flex: 1 1 0%;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    display: flex;
    border-top: 1px solid rgb(238, 238, 238);
    border-right: 1px solid rgb(238, 238, 238);
    border-bottom: 1px solid rgb(33, 33, 33);
    background: rgb(250, 250, 250);
    color: rgb(136, 136, 136);
}


a {
    color: rgb(33, 33, 33);
    text-decoration: none;
    cursor: pointer;
}

<%-- 상품탭 --%>
.khHtgc {
    font-size: 18px;
    padding: 50px 0px 20px;
    border-bottom: 1px solid rgb(238, 238, 238);
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
}
.kmGPmj {
    color: rgb(247, 47, 51);
}

<%-- 상품 분류 목록 --%>
.inRpvj {
    width: 140px;
}
.ijiqeP {
    border: 1px solid rgb(238, 238, 238);
    display: flex;
    width: 100%;
    height: 28px;
    -webkit-box-align: center;
    align-items: center;
    position: relative;
    font-size: 12px;
    color: rgb(77, 77, 77);
    background: rgb(255, 255, 255);
}

.zWYgi {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    padding: 0px 25px 0px 10px;
    position: relative;
    width: 100%;
}

.zWYgi img {
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
}

.geECny {
    position: absolute;
    top: 27px;
    left: -1px;
    width: calc(100% + 2px);
    background: rgb(255, 255, 255);
    max-height: 280px;
    overflow-y: auto;
    z-index: 3;
    border-left: 1px solid rgb(238, 238, 238);
    border-bottom: 1px solid rgb(238, 238, 238);
    border-right: 1px solid rgb(238, 238, 238);
    display: none;
}

.buSjuK {
    width: 100%;
    height: 28px;
    padding: 0px 10px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    color: rgb(247, 47, 51);
}

.ilUMhx {
    font-size: 13px;
    display: flex;
}

.cMlJLU {
    margin-right: 20px;
    position: relative;
    display: block;
    color: rgb(247, 47, 51);
}
.gYGcwB {
    margin-right: 20px;
    position: relative;
    display: block;
}
<style>
a {
    color: rgb(33, 33, 33);
    text-decoration: none;
    cursor: pointer;
}
<style>
a {
    background-color: transparent;
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
		<div data-v-473e7c14="">

			<%-- 본문 - 나의 상점 --%>
			<div class="sc-fAJaQT gHsrAW">
				<div class="sc-jotlie lmEPCP">
					<div class="sc-hRmvpr efKeHO">
						<div class="sc-cZBZkQ dagUQO">
							<div class="sc-iiUIRa fgbAbR">
								<div size="310" class="sc-hgRTRy cpvyzS">
									<div class="sc-cJOK jhHppC">
										<div class="sc-ccSCjj jBJukb"></div>
									</div>
									<div class="sc-iIHSe fFhxdm">
										<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgdmlld0JveD0iMCAwIDEwMCAxMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgICA8ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxjaXJjbGUgZmlsbD0iI0ZBRkFGQSIgY3g9IjUwIiBjeT0iNTAiIHI9IjUwIi8+CiAgICAgICAgPHBhdGggZD0iTTM2LjIxNiA0MS42ODNjLjI0OC0xLjkzMS40OTgtMy44NjIuNzUtNS43OTRoNi43OWwtLjI4MyA1LjUzN2MwIC4wMTcuMDA3LjAzNC4wMDcuMDUxLS4wMDIuMDEtLjAwMi4wMi0uMDAyLjAzLS4wOTggMS44NzYtMS44OTcgMy4zOTItNC4wMzUgMy4zOTItMS4wNjYgMC0yLjAxOC0uMzktMi42MTUtMS4wNzItLjUxLS41ODUtLjcyMi0xLjMyNS0uNjEyLTIuMTQ0em04Ljg4OCA0LjA3OGMxLjIyNCAxLjI4OSAzLjAwOSAyLjAyOCA0Ljg5IDIuMDI4IDEuODkgMCAzLjY3NC0uNzQgNC45LTIuMDMzLjEwNy0uMTEyLjIwNy0uMjI4LjMwNC0uMzQ1IDEuMjggMS40NDcgMy4yMTcgMi4zNzggNS4zNSAyLjM3OC4xMTIgMCAuMjE2LS4wMjcuMzI4LS4wMzJWNjMuNkgzOS4xMTVWNDcuNzU3Yy4xMTIuMDA1LjIxNS4wMzIuMzI4LjAzMiAyLjEzMyAwIDQuMDcxLS45MzEgNS4zNTEtMi4zOC4wOTkuMTIxLjIuMjM4LjMxLjM1MnptMS41NDUtOS44NzJoNi42OThsLjI4MiA1LjYxOWMwIC4wMTUtLjAwNy4wMjctLjAwNy4wNGwuMDA0LjA4NmEyLjkzOSAyLjkzOSAwIDAgMS0uODI2IDIuMTMyYy0xLjM2NyAxLjQ0LTQuMjMzIDEuNDQxLTUuNjA0LjAwM2EyLjk1IDIuOTUgMCAwIDEtLjgzLTIuMTQybC4wMDQtLjA3OGMwLS4wMTYtLjAwOC0uMDMtLjAwOC0uMDQ4bC4yODctNS42MTJ6bTE2LjM3NiAwYy4yNTIgMS45MzMuNTAyIDMuODY1Ljc1MyA1LjgwNC4xMDkuODEtLjEwNCAxLjU0Ny0uNjE0IDIuMTMyLS41OTYuNjgzLTEuNTUgMS4wNzQtMi42MTYgMS4wNzQtMi4xMzcgMC0zLjkzMi0xLjUxNC00LjAzNC0zLjM4OGEuMzU5LjM1OSAwIDAgMC0uMDAzLS4wNDRjMC0uMDE1LjAwNi0uMDI3LjAwNi0uMDRsLS4yNzgtNS41MzhoNi43ODZ6TTM2LjIyNiA0Ni45NDZ2MTguMDk4YzAgLjc5OC42NDYgMS40NDUgMS40NDQgMS40NDVoMjQuNjVjLjc5OSAwIDEuNDQ1LS42NDcgMS40NDUtMS40NDVWNDYuOTQ2Yy41OS0uMzI4IDEuMTM3LS43MTkgMS41NzUtMS4yMiAxLjA2MS0xLjIxNCAxLjUyMi0yLjc4NSAxLjMwMS00LjQxLS4zLTIuMzU1LS42MDctNC43MDctLjkxOC03LjA2YTEuNDQzIDEuNDQzIDAgMCAwLTEuNDMxLTEuMjU3SDM1LjY5OWMtLjcyNCAwLTEuMzM4LjUzOC0xLjQzMSAxLjI1Ny0uMzExIDIuMzU0LS42MTcgNC43MDctLjkxNiA3LjA1LS4yMjEgMS42MzcuMjQgMy4yMDggMS4zIDQuNDIxLjQzOS41MDIuOTg0Ljg5MyAxLjU3NCAxLjIyeiIgZmlsbD0iI0NDQyIvPgogICAgPC9nPgo8L3N2Zz4K" width="100" height="100" alt="상점 프로필 이미지" class="sc-gldTML bHnJBW">
										<div class="sc-feryYK dxKilp">상점81695109호</div>
										<div class="sc-eLdqWK gIaRHa">
											<img src="/pc-static/resource/982587b0e24b8bccea13.png" width="15" height="14" alt="작은 별점 0점 이미지">
											<img src="/pc-static/resource/982587b0e24b8bccea13.png" width="15" height="14" alt="작은 별점 0점 이미지">
											<img src="/pc-static/resource/982587b0e24b8bccea13.png" width="15" height="14" alt="작은 별점 0점 이미지">
											<img src="/pc-static/resource/982587b0e24b8bccea13.png" width="15" height="14" alt="작은 별점 0점 이미지">
											<img src="/pc-static/resource/982587b0e24b8bccea13.png" width="15" height="14" alt="작은 별점 0점 이미지">
										</div>
										<div class="sc-jKmXuR jLHspK">
											<a class="sc-jUpvKA hzlLUQ" href="/products/manage">내 상점 관리</a>
										</div>
									</div>
								</div>
								<div class="sc-kafWEX jzkZCA">
									<div class="sc-feJyhm dcmPGl">
										<h2 class="sc-iELTvK iBiqya">프로필 수정</h2>
										<p class="sc-cmTdod fLuLKj">프로필 사진 추가/수정은 번개장터 앱에서만 가능해요</p>
										<div class="sc-jwKygS iTENYU">
											<button type="button" class="sc-btzYZH FwXcU">앱으로 이동하기</button>
											<button type="button" class="sc-lhVmIH jxfGgv">취소</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="sc-gbzWSY hBpLcq">
							<div class="sc-jqIZGH fawuLi">
								<div class="sc-jRuhRL fJiQAJ">상점81695109호<button class="sc-ecaExY cxNNaK">상점명 수정</button>
							</div>
							<div class="sc-eopZyb hYzNdy">본인인증 완료</div>
							</div>
							<div class="sc-jMMfwr zhbnl">
								<div class="sc-jGxEUC adWrx">
									<img src="/pc-static/resource/4b323fe1ef79c2b715fe.png" width="14" height="13" alt="상점오픈일 아이콘">상점오픈일
									<div class="sc-jdeSqf dBzPWd">3 일 전</div>
								</div>
								<div class="sc-jGxEUC adWrx">
									<img src="/pc-static/resource/e6792c64a6ba6f2b10a2.png" width="14" height="13" alt="상점방문수 아이콘">상점방문수
									<div class="sc-jdeSqf dBzPWd">1 명</div>
								</div>
								<div class="sc-jGxEUC adWrx">
									<img src="/pc-static/resource/ef9d606d24890f02bde0.png" width="14" height="13" alt="상품판매 아이콘">상품판매
									<div class="sc-jdeSqf dBzPWd">0 회</div>
								</div>
								<div class="sc-jGxEUC adWrx">
									<img src="/pc-static/resource/b6ca1c340805703d7c62.png" width="14" height="13" alt="상퓸발송 아이콘">택배발송
									<div class="sc-jdeSqf dBzPWd">0 회</div>
								</div>
							</div>
							<div class="sc-cBrjTV czeXQe"></div>
							<div class="sc-fkyLDJ isYF">
								<button class="sc-ecaExY cxNNaK">소개글 수정</button>
							</div>
						</div>
					</div>
				</div>
				<div class="sc-cNnxps cdXYEZ">
					<div class="sc-eMRERa ebVkwH">
						<div class="sc-RbTVP kcRaQl">
							<a class="sc-hMrMfs JoOgK" href="/shop/81695109/products">상품 
								<span class="sc-bIqbHp gtokyO">1</span>
							</a>
							<a class="sc-hMrMfs eXINrs" href="/shop/81695109/reviews">판매후기 
								<span class="sc-bIqbHp gtokyO">0</span>
							</a>
							<a class="sc-hMrMfs eXINrs" href="/shop/81695109/favorites">경매
								<span class="sc-bIqbHp gtokyO">3</span>
							</a>
							<a class="sc-hMrMfs eXINrs" href="/shop/81695109/followings">경매후기 
								<span class="sc-bIqbHp gtokyO">0</span>
							</a>
							<a class="sc-hMrMfs eXINrs" href="/shop/81695109/followers">찜 
								<span class="sc-bIqbHp gtokyO">0</span>
							</a>
						</div>
					</div>
					<div class="sc-eqPNPO crpdHA">
						<div class="sc-ileJJU ljwWRl">
							<div class="sc-jxGEyO khHtgc"><div>상품
								<span class="sc-ghsgMZ kmGPmj">1</span>
							</div>
							<div class="sc-ekulBa inRpvj">
								<div class="sc-erNlkL ijiqeP">
									<div class="sc-iuDHTM zWYgi">전체
										<img src="/pc-static/resource/9b606ef2e7d57fafa657.png" width="10" height="6" alt="카테고리 화살표 아이콘">
									</div>
									<div class="sc-FQuPU iDlcuM">
<!-- 										<a class="sc-kEmuub cohUeK">전체</a> -->
<!-- 										<a class="sc-kEmuub zPWkt">키덜트</a> -->
										<select class="form-control">
											<option value="전체">전체</option>
											<option value="카테고리1">카테고리1</option>
											<option value="카테고리2">카테고리2</option>
										</select>
									</div>
								</div>
							</div>
							</div>
							<div class="sc-dznXNo fpPGpL">
								<div class="sc-ciodno hiHzLz">
									<div class="sc-gacfCG giJkiq">
										<div class="sc-jkCMRl kJRqmA">
											<div>전체</div>
											<div class="sc-bqjOQT kIgFPj">1개</div>
										</div>
										<div class="sc-dEfkYy fAkqZn">
											<a class="sc-cqPOvA kPUmxO">최신순</a>
											<a class="sc-cqPOvA izfehG">인기순</a>
											<a class="sc-cqPOvA izfehG">저가순</a>
											<a class="sc-cqPOvA izfehG">고가순</a>
										</div>
									</div>
								</div>
								<div class="sc-hwcHae fQrqBm">
									<div class="sc-lnmtFM iUmdcc">
										<a data-pid="229889159" class="sc-bGbJRg iZZEyc" href="/products/229889159?ref=%EC%83%81%EC%A0%90%EC%A0%84%EC%B2%B4%EC%83%81%ED%92%88">
											<div class="sc-bEjcJn jwhhcG">
												<img src="https://media.bunjang.co.kr/product/229889159_1_1689295310_w292.jpg" width="194" height="194" alt="상품 이미지">
												<div class="styled__BadgeArea-sc-3zkh6z-0 dwFxLs">
													<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzNSIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDM1IDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKC05NTguMDAwMDAwLCAtODQ2LjAwMDAwMCkgdHJhbnNsYXRlKDk1OC4wMDAwMDAsIDg0Ni4wMDAwMDApIj4KICAgICAgICAgICAgICAgIDxyZWN0IHdpZHRoPSIzNSIgaGVpZ2h0PSIxNiIgZmlsbD0iI0Q4MEMxOCIgcng9IjIiLz4KICAgICAgICAgICAgICAgIDxwYXRoIGZpbGw9IiNGRkYiIGQ9Ik05LjIyNiAzLjAwM2wtLjU2IDQuNTYzaDIuMzI1Yy4wNDMgMCAuMDY2LjA1Mi4wMzYuMDgzbC01LjAyNCA1LjM4OGMtLjAzMy4wMzUtLjA5MS4wMDgtLjA4NS0uMDRsLjU2LTQuNTYzSDQuMTUzYy0uMDQzIDAtLjA2Ni0uMDUyLS4wMzYtLjA4M0w5LjE0IDIuOTYzYy4wMzMtLjAzNS4wOTEtLjAwOC4wODUuMDR6bTExLjgwMy43MDZ2OC41OWgtMS4zMDZWMy43MWgxLjMwNnptOC40NDcgMHY4LjU5aC0xLjM0NVYzLjcxaDEuMzQ1em0tMTAuMjY1LjA0OHY4LjM4aC0xLjI4OFY4LjEzOGgtLjc3NlY2Ljg3NWguNzc2VjMuNzU3aDEuMjg4em01LjM5OC0uMDJjLjM1MyAwIC42NzcuMDUuOTcuMTQ5LjI5NC4wOTkuNTQ4LjI1Ljc2My40NTUuMjE0LjIwMy4zODUuNDU4LjUxMS43NjUuMTI2LjMwNi4xOTkuNjYzLjIxOCAxLjA3MS4wMTIuMjc0LjAyMi41MzcuMDI4Ljc5LjAwNi4yNTEuMDEuNS4wMS43NDUgMCAuMjQ2LS4wMDQuNDkzLS4wMS43NDJzLS4wMTYuNTA3LS4wMjguNzc1Yy0uMDIuNDE0LS4wOTIuNzczLS4yMTggMS4wNzYtLjEyNi4zMDMtLjI5Ny41NTctLjUxMS43Ni0uMjE1LjIwNC0uNDcuMzU2LS43NjIuNDU1LS4yOTQuMDk5LS42MTguMTQ4LS45NzEuMTQ4LS43MTQgMC0xLjI5MS0uMi0xLjczMy0uNjAyLS40NDItLjQwMi0uNjg1LTEuMDE1LS43My0xLjgzN2wtLjAzMy0uNzg1Yy0uMDEtLjI0OC0uMDE0LS40OTYtLjAxNC0uNzQgMC0uMjQ2LjAwNS0uNDk0LjAxNC0uNzQzLjAxLS4yNDguMDIxLS41MS4wMzQtLjc4NC4wNDQtLjgyMy4yODctMS40MzUuNzI5LTEuODM2LjQ0Mi0uNDAzIDEuMDItLjYwNCAxLjczMy0uNjA0em0tNy4wODQuMTgydjEuMTg3aC0uNTMxbC0uMDE2IDUuMDc1LjYxNC0uMDI0djEuMTY3bC00LjQ3LjE5MnYtMS4xODdsLjYyNC0uMDI0LS4wMTctNS4yaC0uNTMxVjMuOTJoNC4zMjd6bTcuMDg0IDEuMDA1Yy0uMTY1IDAtLjMxMi4wMjctLjQ0LjA4MS0uMTMuMDU0LS4yNDIuMTQ0LS4zMzcuMjY4LS4wOTUuMTI0LS4xNy4yODgtLjIyNy40OTItLjA1Ny4yMDUtLjA5NS40Ni0uMTE0Ljc2Ni0uMDI1LjM3Ni0uMDM4Ljc2Ny0uMDM4IDEuMTcyIDAgLjQwNS4wMTMuNzk2LjAzOCAxLjE3Mi4wMi4zMDYuMDU3LjU2MS4xMTQuNzY1LjA1Ny4yMDQuMTMyLjM2OC4yMjcuNDkzLjA5NS4xMjQuMjA3LjIxMy4zMzYuMjY4LjEzLjA1NC4yNzYuMDguNDQuMDguMTY1IDAgLjMxMi0uMDI2LjQ0LS4wOC4xMy0uMDU1LjI0My0uMTQ0LjMzNy0uMjY4LjA5NS0uMTI1LjE3LS4yODkuMjI4LS40OTMuMDU2LS4yMDQuMDk0LS40Ni4xMTMtLjc2NS4wMjUtLjM3Ni4wMzgtLjc2Ni4wMzgtMS4xNjcgMC0uNDAyLS4wMTMtLjc5NC0uMDM4LTEuMTc3LS4wMTktLjMwNi0uMDU3LS41NjEtLjExMy0uNzY2LS4wNTctLjIwNC0uMTMzLS4zNjgtLjIyOC0uNDkyLS4wOTQtLjEyNC0uMjA3LS4yMTQtLjMzNi0uMjY4LS4xMy0uMDU0LS4yNzYtLjA4MS0uNDQtLjA4MXptLTguODk0LjE4MmgtLjcwN2wuMDE2IDUuMTUuNjc1LS4wMjYuMDE2LTUuMTI0eiIvPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K" alt="번개페이" class="styled__IconBadge-sc-3zkh6z-2 iDmRbz">
													<div class="styled__Badge-sc-3zkh6z-1 kpHfXu">배송비포함</div>
												</div>
												<div class="sc-cpmKsF drqQHd"></div>
											</div>
											<div class="sc-ePZHVD iwDtPu">
												<div class="sc-likbZx eKgVJL">테스트</div>
												<div class="sc-fgfRvd taYSl">
													<div class="sc-eKZiaR kfxCyR">223,222</div>
													<div class="sc-hIVACf QYklO"><span>3일 전</span></div>
												</div>
											</div>
											<div class="sc-drMfKT kbfGHc">
												<img src="/pc-static/resource/5dcce33ad99f3020a4ab.png" width="15" height="17" alt="위치 아이콘">전국
											</div>
										</a>
									</div>
								</div>
								<div class="sc-gGCbJM igUjHg"></div>
							</div>
						</div>
						<div class="sc-ileJJU cLznef">
							<div class="sc-jxGEyO khHtgc">
								<div>찜<span class="sc-keFjpB edhbau">0</span></div>
							</div>
							<div class="sc-AnqlK hYpuCz">
								<div class="sc-jWojfa hwzHa">
									<div class="sc-kVrTmx lcBRID">
										<div class="sc-cEvuZC hzgTJv"></div>
										<button class="sc-crNyjn dRjcfF">선택삭제</button>
									</div>
									<div class="sc-ekkqgF cTdzXF">
										<a class="sc-iBmynh gjtVmz">최신순</a>
										<a class="sc-iBmynh iHPPlM">인기순</a>
										<a class="sc-iBmynh iHPPlM">저가순</a>
										<a class="sc-iBmynh iHPPlM">고가순</a>
									</div>
								</div>
								<div class="sc-eitiEO uLBJN"></div>
							</div>
							<div class="sc-fKGOjr ffOQYS"></div>
						</div>
						<div class="sc-ileJJU cLznef">
							<div class="sc-jxGEyO khHtgc">
								<div>상점후기<span class="sc-gJqsIT dULvPK">0</span></div>
							</div>
							<div class="sc-kDhYZr izbPOa">상점후기가 없습니다.</div>
						</div>
						<div class="sc-ileJJU cLznef">
							<div class="sc-OxbzP cPmpNi">
								<div class="sc-jxGEyO khHtgc">
									<div>팔로잉<span class="sc-lnrBVv hIZyef">0</span></div>
								</div>
								<div class="sc-hvvHee cdYewf">아직 팔로우한 사람이 없습니다.</div>
							</div>
						</div>
						<div class="sc-ileJJU cLznef">
							<div class="sc-jHXLhC dItGrF">
								<div class="sc-jxGEyO khHtgc">
									<div>팔로워<span class="sc-bOCYYb jGomlc">0</span></div>
								</div>
								<div class="sc-clBsIJ hLgItk">아직 이 상점을 팔로우한 사람이 없습니다.</div>
							</div>
						</div>
					</div>
				</div>
				<div class="sc-kafWEX jzkZCA">
					<div class="sc-iGrrsa IoRZr">
						<div class="sc-bmyXtO krGqvP">
							<div class="sc-dEoRIm wdAXE">신고하기</div>
							<button class="sc-kxynE QJnSk">
								<img src="/pc-static/resource/ee442d3dd827628bc5fe.png" width="24" height="24" alt="닫기 버튼 아이콘">
							</button>
						</div>
						<div class="sc-jtggT buLuLa">
							<div class="sc-ebFjAB evNEPA">
								<div class="sc-jKVCRD hTkMZK"><span>광고성 콘텐츠(상점)예요.</span>
									<button type="button">
										<img src="/pc-static/resource/1a9417569b749c43c5d4.png" width="13" height="8" alt="화살표 아이콘">
									</button>
								</div>
								<div class="sc-LKuAh gIaBit">
									<div class="sc-iBEsjs bWMBii">
										<button type="button">상점 및 타사이트 홍보</button>
									</div>
									<div class="sc-iBEsjs bWMBii">
										<button type="button">상품 도배</button>
									</div>
								</div>
							</div>
							<div class="sc-ebFjAB evNEPA">
								<div class="sc-jKVCRD hTkMZK"><span>상품 정보가 부정확해요.</span>
									<button type="button">
										<img src="/pc-static/resource/1a9417569b749c43c5d4.png" width="13" height="8" alt="화살표 아이콘">
									</button>
								</div>
								<div class="sc-LKuAh gIaBit">
									<div class="sc-chbbiW liJktR">
										<textarea placeholder="신고 내용을 직접 작성해주세요.자세하게 적어주시면 신고처리에 큰 도움이 됩니다."></textarea>
										<button type="button">등록</button>
									</div>
								</div>
							</div>
							<div class="sc-ebFjAB evNEPA">
								<div class="sc-jKVCRD hTkMZK">
									<span>거래 금지 품목으로 판단돼요.</span>
									<button type="button">
										<img src="/pc-static/resource/1a9417569b749c43c5d4.png" width="13" height="8" alt="화살표 아이콘">
									</button>
								</div>
								<div class="sc-LKuAh gIaBit">
									<div class="sc-iBEsjs bWMBii">
										<button type="button">가품(위조품/이미테이션)</button>
									</div>
									<div class="sc-iBEsjs bWMBii">
										<button type="button">개인정보 거래(SNS계정, 인증번호 등)</button>
									</div>
									<div class="sc-iBEsjs bWMBii">
										<button type="button">게임계정/아이템/대리육성</button>
									</div>
									<div class="sc-iBEsjs bWMBii">
										<button type="button">담배</button>
									</div>
									<div class="sc-iBEsjs bWMBii">
										<button type="button">반려동물(분양/입양 글)</button>
									</div>
									<div class="sc-iBEsjs bWMBii">
										<button type="button">비매품 판매(화장품 샘플 등)</button>
									</div>
									<div class="sc-iBEsjs bWMBii">
										<button type="button">음란물/성인용품(중고속옷 포함)</button>
									</div>
									<div class="sc-iBEsjs bWMBii">
										<button type="button">의약품/의료기기</button>
									</div>
									<div class="sc-iBEsjs bWMBii">
										<button type="button">조건부 무료나눔</button>
									</div>
									<div class="sc-iBEsjs bWMBii">
										<button type="button">주류</button>
									</div>
									<div class="sc-hzNEM ivAbVl">
										<input type="text" placeholder="기타" value="">
										<button type="button">등록</button>
									</div>
								</div>
							</div>
							<div class="sc-ebFjAB evNEPA">
								<div class="sc-jKVCRD hTkMZK"><span>안전거래를 거부해요</span>
									<button type="button">
										<img src="/pc-static/resource/1a9417569b749c43c5d4.png" width="13" height="8" alt="화살표 아이콘">
									</button>
								</div>
								<div class="sc-LKuAh gIaBit">
									<div class="sc-iBEsjs bWMBii">
										<button type="button">안전결제 거부</button>
									</div>
									<div class="sc-iBEsjs bWMBii">
										<button type="button">배송전 구매확정 요청</button>
									</div>
									<div class="sc-iBEsjs bWMBii">
										<button type="button">추가 금액 요청</button>
									</div>
								</div>
							</div>
							<div class="sc-ebFjAB evNEPA">
								<div class="sc-jKVCRD hTkMZK"><span>사기가 의심돼요. (외부 채널 유도)</span>
									<button type="button">
										<img src="/pc-static/resource/1a9417569b749c43c5d4.png" width="13" height="8" alt="화살표 아이콘">
									</button>
								</div>
								<div class="sc-LKuAh gIaBit">
									<div class="sc-chbbiW liJktR"><textarea placeholder="신고 내용을 직접 작성해주세요.자세하게 적어주시면 신고처리에 큰 도움이 됩니다."></textarea>
										<button type="button">등록</button>
									</div>
								</div>
							</div>
							<div class="sc-ebFjAB evNEPA">
								<div class="sc-jKVCRD hTkMZK"><span>전문 업자 같아요. (프로상점 미가입)</span>
									<button type="button">
										<img src="/pc-static/resource/1a9417569b749c43c5d4.png" width="13" height="8" alt="화살표 아이콘">
									</button>
								</div>
								<div class="sc-LKuAh gIaBit">
									<div class="sc-chbbiW liJktR">
										<textarea placeholder="신고 내용을 직접 작성해주세요.자세하게 적어주시면 신고처리에 큰 도움이 됩니다."></textarea>
										<button type="button">등록</button>
									</div>
								</div>
							</div>
							<div class="sc-ebFjAB evNEPA">
								<div class="sc-jKVCRD hTkMZK"><span>기타</span>
									<button type="button">
										<img src="/pc-static/resource/1a9417569b749c43c5d4.png" width="13" height="8" alt="화살표 아이콘">
									</button>
								</div>
								<div class="sc-LKuAh gIaBit">
									<div class="sc-chbbiW liJktR">
										<textarea placeholder="신고 내용을 직접 작성해주세요.자세하게 적어주시면 신고처리에 큰 도움이 됩니다."></textarea>
										<button type="button">등록</button>
									</div>
								</div>
							</div>
						</div>
						<div class="sc-kafWEX jzkZCA">
							<div class="sc-feJyhm dcmPGl">
								<h2 class="sc-iELTvK iBiqya">신고하기</h2>
								<p class="sc-cmTdod fLuLKj">신고 내용은 번개장터 이용약관 및 정책에 의해서 처리되며, 허위신고 시 번개장터 이용이 제한될 수 있습니다.</p>
								<div class="sc-jwKygS iTENYU">
									<button type="button" class="sc-btzYZH FwXcU">확인</button>
									<button type="button" class="sc-lhVmIH jxfGgv">취소</button>
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
  		<%@ include file="../inc/member_sidebar.jsp"%>
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