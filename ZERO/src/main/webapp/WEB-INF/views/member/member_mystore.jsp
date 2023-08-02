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

<meta charset="UTF-8">
<title>ZERO</title>
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
    background-image: url(/zero/resources/mypage_img/store_bg.png);
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

a {
    color: rgb(33, 33, 33);
    text-decoration: none;
    cursor: pointer;
    background-color: transparent;
}
</style>

<script type="text/javascript">
</script>
</head>
<body>
	<header>
		<%@ include file="../inc/header.jsp"%>
	</header>
	
	<article>
		<div class="container">
			<nav id="mainNav" class="sidebarArea d-none d-md-block sidebar">
				<jsp:include page="/WEB-INF/views/inc/member_sidebar.jsp"></jsp:include>
			</nav>
			<div class="contentArea">
			<%-- 메인영역 --%>
				<div data-v-473e7c14="" class="my lg">
<!-- 				<div data-v-473e7c14="" class="my lg"> -->
<!-- 					<div data-v-473e7c14=""> -->
			
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
										<div class="sc-jxGEyO khHtgc">
											<div>상품
												<span class="sc-ghsgMZ kmGPmj">1</span>
											</div>
											<div class="inRpvj">
<!-- 											<div class="sc-erNlkL ijiqeP"> -->
<!-- 												<div class="sc-iuDHTM zWYgi">전체 -->
<!-- 													<img src="/pc-static/resource/9b606ef2e7d57fafa657.png" width="10" height="6" alt="카테고리 화살표 아이콘"> -->
<!-- 												</div> -->
<!-- 												<div class="sc-FQuPU iDlcuM"> -->
			<!-- 										<a class="sc-kEmuub cohUeK">전체</a> -->
			<!-- 										<a class="sc-kEmuub zPWkt">키덜트</a> -->
													<select class="form-control">
														<option value="전체">전체</option>
														<option value="카테고리1">카테고리1</option>
														<option value="카테고리2">카테고리2</option>
													</select>
<!-- 												</div> -->
<!-- 											</div> -->
											</div>
										</div>
										<div class="sc-dznXNo fpPGpL">
											<div class="sc-ciodno hiHzLz">
												<div class="sc-gacfCG giJkiq">
													<div class="sc-jkCMRl kJRqmA">
														<div>전체</div>
														<div class="sc-bqjOQT kmGPmj">1개</div>
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
							
						</div>	
					</div>
				</div>
			</div>
			
<!-- 		</div> -->
	</article>
	
	<footer>
	</footer>
</body>
</html>