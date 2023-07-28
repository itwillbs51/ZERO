<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jtsage-datebox-bootstrap4@5.3.3/jtsage-datebox.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/sidebar.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/button.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>ZERO</title>
<style>

.help_area {
    margin: 0 auto;
    padding: 60px 0 160px;
    width: 400px;
}

.help-social {
    position: absolute;
    width: 24px;
    height: 24px;
    top: 13px;
    left: 15px;
}

.help_title {
    padding-bottom: 41px;
    text-align: center;
    font-size: 32px;
    letter-spacing: -.48px;
    color: #000;
    border-bottom: 2px solid #000;
}

.help_notice {
    padding: 40px 0 30px;
}
.help_notice .notice_txt {
    font-size: 14px;
    letter-spacing: -.21px;
}

.input_txt {
    padding: 8px 0;
    width: 100%;
    font-size: 15px;
    letter-spacing: -.15px;
    line-height: 22px;
    border-bottom: 1px solid #ebebeb;
}

.input_title {
    font-size: 13px;
    letter-spacing: -.07px;
    line-height: 18px;
}

.solid.disabled, .solid:disabled {
    background-color: #ebebeb;
    color: #fff;
    cursor: default;
}

.has_button .input_txt {
    padding-right: 30px;
    height: 38px;
}

.input_txt {
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

.btn {
    display: inline-flex;
    cursor: pointer;
    align-items: center;
    justify-content: center;
    vertical-align: middle;
    text-align: center;
    color: rgba(34,34,34,.8);
    background-color: #fff;
}

.look_link {
    margin: auto;
    padding: 0 10px;
    display: inline-flex;
    font-size: 13px;
    letter-spacing: -.07px;
}


	
<%-- 인증에러 --%>
.input_error {
    display: none;
}

*, :after, :before {
    box-sizing: border-box;
    -webkit-tap-highlight-color: rgba(0,0,0,0);
}

.full {
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



.solid {
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

.look_box {
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

h2 {
    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
<%-- 버튼 --%>

.help_btn_box {
    padding-top: 44px;
}

.help_btn_box>.btn {
    margin-bottom: 8px;
}

.outline {
    border: 1px solid #d3d3d3;
}


	
</style>
<script type="text/javascript">
</script>
</head>
<body>
	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
	
	<article id="mainArticle">
		<div class="container help">
<!-- 			<nav id="mainNav" class="sidebarArea d-none d-md-block sidebar"> -->
<%-- 				<jsp:include page="/WEB-INF/views/inc/member_sidebar.jsp"></jsp:include> --%>
<!-- 			</nav> -->
			<div class="contentArea">
			<%-- 메인영역 --%>
							<%-- 메인영역 --%>
				<div class="">
					<div class="content lg">
						<div class="help_area">
							<div>
								<h2 class="help_title" data-v-2b15bea4="">이메일 인증 요청</h2>
								<div class="help_notice">
									<p class="notice_txt"> 가입 시 등록한 이메일 주소를 입력하면<br> 
									인증 코드를 메일로 발송해드립니다. </p>
								</div>
								<div class="input_box">
									<h3 class="input_title">이메일 주소</h3>
									<div class="input_item">
										<input type="tel" placeholder="가입하신 이메일 주소" autocomplete="off" class="input_txt">
									</div>
								</div>
								<div class="help_btn_box">
									<a disabled="disabled" href="#" class="btn full solid disabled"> 인증 메일 발송 요청 </a>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
			</div>
			
		</div>
	
	<footer>
	</footer>
	</article>
</body>
</html>