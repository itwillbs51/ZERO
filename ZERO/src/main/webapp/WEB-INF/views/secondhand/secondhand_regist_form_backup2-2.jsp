<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/zero/resources/js/jquery-3.7.0.js"></script>


<!-- <!-- 부트스트랩 --> 
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> -->
<!-- <!-- daum API -->
<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
<!-- <!-- 제이쿼리 -->
<%-- <script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script> --%>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script> -->
<!-- 반응형웹페이지위한 설정 --> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">

<!-- 머니또 -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">


$(window).load(function() {
	  var maxImageCount = 3; //이미지최대
	  var fileInput = document.querySelector('input[type="file"]');
	  var imageList = document.querySelector('.image_list');
	  var countImg = document.querySelector('.count_img span');
	  var defaultImage = document.querySelector('.default');
	  var draggedItem = null;
	  var files = [];
	  function handleFileSelect(event) {
		  
	     files = event.target.files;

	     
	     
	     
	    if (files.length + imageList.children.length > maxImageCount) {
	      swal('최대 ' + maxImageCount + '장의 사진만 업로드할 수 있습니다.');
	      fileInput.value = '';
	      return;
	    }

	    for (var i = 0; i < files.length; i++) {
	      var file = files[i];

	      if (imageList.children.length >= maxImageCount) {
	        swal('최대 ' + maxImageCount + '장의 사진만 업로드할 수 있습니다.');
	        fileInput.value = '';
	        return;
	      }

	      
	      
	      
		//미리보기영역에 이미지추가(item_img)	      
	      var previewContainer = document.createElement('li');
	      var img = document.createElement('img');
	      img.classList.add('item_img');
	      img.src = URL.createObjectURL(file);

	      
	      
		//미리보기 X버튼 -> 미리보기 제거	      
	      var deleteIcon = document.createElement('img');
	      deleteIcon.classList.add('img_delete_icon');
	      deleteIcon.src = 'https://ccimage.hellomarket.com/img/web/regist/image_delete_x3.png';
	      deleteIcon.alt = '상품 썸네일 제거 아이콘';

	      
	     //이미지박스
	      var imageBox = document.createElement('div');
	      imageBox.classList.add('up_img_box');
	      imageBox.appendChild(deleteIcon);
	      imageBox.appendChild(img);


	      //프리뷰영역에 이미지박스 추가
	      //이미지리스트에 프리뷰영역 추가?
	      previewContainer.appendChild(imageBox);
	      imageList.appendChild(previewContainer);

	     // 
	      updateImageCount();
	    }
	  }


		//이미지 장수 계산 함수		  
	  function updateImageCount() {
	    countImg.textContent = imageList.children.length;
	  }

	  defaultImage.addEventListener('click', function() {
	    fileInput.click();
	  });

	  fileInput.addEventListener('change', handleFileSelect, false);

	  
	  
	  //======================================================================
	  imageList.addEventListener('click', function(event) {
	    if (event.target.classList.contains('img_delete_icon')) {
	    	var imageContainer = event.target.closest('li');
	    	
	    	console.log($(this).closest('ul').find('li').index(imageContainer));
			// 삭제버튼 눌렀을때 이미지 삭제되게
			
			//=================================================
	    	var arrayNum = $(this).closest('ul').find('li').index(imageContainer);
	    	
	    	const dataTransfer = new DataTransfer();
	        
	        let files = fileInput.files;	//사용자가 입력한 파일을 변수에 할당
	        
	        let fileArray = Array.from(files);	//변수에 할당된 파일을 배열로 변환(FileList -> Array)
	        
	        fileArray.splice(arrayNum, 1);	//해당하는 index의 파일을 배열에서 제거
	        
	        fileArray.forEach(file => { dataTransfer.items.add(file); });
	        //남은 배열을 dataTransfer로 처리(Array -> FileList)
	        
	        fileInput.files = dataTransfer.files;	//제거 처리된 FileList를 돌려줌
	    	//======================================================
	    	// => 배열 순서 리턴
	    	console.log(fileInput.files[arrayNum]);
	      
	      
	      //===========================================
    	  imageContainer.parentNode.removeChild(imageContainer);
	      updateImageCount();
    	 //==========================================
	    }
	  });

	  imageList.addEventListener('dragstart', function(event) {
	    draggedItem = event.target.closest('li');
	  });

	  imageList.addEventListener('dragover', function(event) {
	    event.preventDefault();
	  });

	  imageList.addEventListener('drop', function(event) {
	    event.preventDefault();
	    var droppedItem = event.target.closest('li');

	    if (draggedItem && imageList.contains(draggedItem) && droppedItem && imageList.contains(droppedItem)) {
	      var draggedIndex = Array.from(imageList.children).indexOf(draggedItem);
	      var droppedIndex = Array.from(imageList.children).indexOf(droppedItem);

	      if (draggedIndex !== droppedIndex) {
	        if (draggedIndex < droppedIndex) {
	          imageList.insertBefore(droppedItem, draggedItem);
	        } else {
	          imageList.insertBefore(draggedItem, droppedItem);
	        }

	        updateImageCount();
	      }
	    }

	    draggedItem = null;
	  });
	});



	
	//태그기능 
	document.addEventListener('DOMContentLoaded', function() {
		var tagInput = document.querySelector('.tagTagInput');
		var tagButton = document.querySelector('.tagButton');
		var tagListWrapper = document.querySelector('.ListWrapper');
		var tagForm = document.getElementById('tag');

		var tags = [];

		function updateTagList() {
			tagListWrapper.innerHTML = '';

			tags.slice(0, 5).forEach(function(tag, index) {
				var tagItem = document.createElement('span');
				tagItem.classList.add('tagItem');
				tagItem.textContent = '#' + tag;

				// X 아이콘 추가
				var removeIcon = document.createElement('span');
				removeIcon.classList.add('removeIcon');
				removeIcon.textContent = 'X';
				removeIcon.setAttribute('data-index', index);
				tagItem.appendChild(removeIcon);

				tagListWrapper.appendChild(tagItem);
			});

			// 수정된 부분: hidden input의 값을 업데이트
			var hiddenInput = document.querySelector('input[name="item_tag"]');
			hiddenInput.setAttribute('value', tags.join(','));
		}

		function addTag() {
			var tagValue = tagInput.value.trim();

			if (tagValue === '') {
				return;
			}

			if (tags.length >= 5 || tags.includes(tagValue)) {
				tagInput.value = '';
				tagInput.focus();
				return;
			}

			tags.push(tagValue);
			updateTagList();

			tagInput.value = '';
			tagInput.focus();
		}

		function removeTag(event) {
			if (event.target.classList.contains('removeIcon')) {
				var index = event.target.getAttribute('data-index');
				tags.splice(index, 1);
				updateTagList();

				// 수정된 부분: hidden input의 값을 업데이트
				var hiddenInput = document
						.querySelector('input[name="item_tag"]');
				hiddenInput.setAttribute('value', tags.join(','));
			}
		}

		tagButton.addEventListener('click', function(event) {
			event.preventDefault();
			addTag();
		});

		tagListWrapper.addEventListener('click', removeTag);

	});
</script>


<script>
<!-- 금액 숫자만입력 -->
	document.addEventListener('DOMContentLoaded', function() {
		var priceInput = document.querySelector('.PricePriceInput');

		priceInput.addEventListener('input', function() {
			// 입력된 값에서 숫자가 아닌 문자를 제거합니다
			var numericValue = this.value.replace(/[^\d]/g, '');

			// 천단위 컴마 표시를 추가합니다
			var formattedValue = addCommas(numericValue);

			// 정제된 숫자 값을 다시 입력 상자에 할당합니다
			this.value = formattedValue;
		});

		function addCommas(value) {
			// 세 자리마다 쉼표를 추가하는 함수
			return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		}
	});
</script>

<!-- 카테고리선택 -->
<style>
.selected {
	font-weight: bold;
	color: #bb2649;
}

/* 태그 아이콘 */
.removeIcon {
	display: inline-block;
	margin-left: 5px;
	font-family: "Arial", sans-serif;
	font-size: 12px;
	font-weight: bold;
	color: #999;
	cursor: pointer;
}

/* .removeIcon::before { */
/* 	content: "x"; */
/* } */
.removeIcon:hover {
	color: #ff0000;
}
</style>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		// 카테고리 요소들을 선택합니다.
		const items = document.querySelectorAll('.TextTextWrapper');
		// 컬럼의 입력 필드를 선택합니다.

		const input = document
				.querySelector('#item_category input[name="item_category"]');

		// 각 카테고리 요소에 클릭 이벤트를 추가합니다.
		items.forEach(function(item) {
			item.addEventListener('click', function() {
				// 다른 요소들의 선택 상태를 제거합니다.
				items.forEach(function(otherItem) {
					otherItem.classList.remove('selected');
				});

				// 선택한 요소에 클래스를 추가합니다.
				this.classList.add('selected');

				// 선택한 카테고리를 변수에 저장합니다.
				const category = this.textContent;

				// 선택한 카테고리를 저장합니다.
				saveCategory(category);
			});
		});
		//커밋
		// 선택한 카테고리를 저장하는 함수입니다.
		function saveCategory(category) {
			console.log('Category saved:', category);
			input.value = category;
		}
	});
</script>

<script>
  document.addEventListener("DOMContentLoaded", function() {
    // 양식 요소 가져오기
    var form = document.querySelector(".insertItem");

    // 양식에 제출 이벤트 리스너 추가
    form.addEventListener("submit", function(event) {
      // 입력 필드 가져오기
      var titleInput = form.querySelector('input[name="item_subject"]');
      var categoryInput = form.querySelector('input[name="item_category"]');
      var priceInput = form.querySelector('input[name="item_price"]');
      var contentInput = form.querySelector('textarea[name="item_content"]');

      // 입력 필드 유효성 검사
      if (titleInput.value.trim() === "" || categoryInput.value.trim() === "" || priceInput.value.trim() === "" || contentInput.value.trim() === "") {
        // 양식 제출 방지
        event.preventDefault();

        // 오류 메시지 표시 또는 원하는 작업 수행
        swal("필수 항목을 모두 입력해주세요.");
      }
    });
  });
</script>

</script>
<style>
@charset "UTF-8";


body {
    bgproperties: fixed
}


input[type=number]::-webkit-inner-spin-button,input[type=number]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0
}

a {
    text-decoration: none;
    color: inherit;
    cursor: pointer
}

img {
    vertical-align: top
}

h1,h2 {
    display: none
}

table {
    border-collapse: collapse;
    border-spacing: 0
}

table th {
    font-weight: 400
}

ul {
    list-style: none
}

button {
    border: none;
    background: none;
    cursor: pointer;
    outline: 0;
    padding: 0
}

input[type=date],input[type=email],input[type=number],input[type=password],input[type=tel],input[type=text],textarea {
    -webkit-appearance: none;
    padding: 8px 0 8px 16px;
    font-size: 14px;
    outline: none;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    line-height: 20px;
    border: 1px solid #e8ebed
}

.hide,.multiple {
    display: none
}




.item_submit_box {
        text-align: center;
        margin: 45px 0 21px
    }

.item_submit_box .btn_item_cancel {
    text-align: center;
    background-color: #a1a8af
    
}

.item_submit_box .btn_item_cancel,.item_submit_box .btn_item_submit {
	text-align: center;
    width: 244px;
    height: 64px;
    font-size: 20px;
    font-weight: 700;
    color: #fff;
    margin-right: 12px;
    border-radius: 12px;
    padding: 16px 0;
}

.item_submit_box .btn_item_submit {
    background-color: #343a3f
}

.item_submit_box .btn_item_delete {
    width: 244px;
    height: 64px;
    color: #6b7684;
    font-size: 20px;
    border-radius: 12px;
    padding: 16px 0;
    border: 1.4px solid #d1d6db;
    margin-right: 12px;
    font-weight: 700
}

.item_submit_box .btn_item_delete_mw {
    display: none
}




    .regist_top .regist_box_top {
        margin: 0 auto;
        display: inline-block
    }

    .regist_top .regist_box_sub {
        float: right;
        font-size: 14px;
        padding: 12px 2px 0 0;
        letter-spacing: -.02500000037252903px
    }

    .regist_top .regist_box_sub span {
        color: #ff4f4f;
        font-weight: 700
    }

    .regist_top .regist_box_top:after {
        display: block;
        content: "";
        clear: both
    }

    .regist_top .regist_box_top img {
        width: 21px;
        height: 22px;
        float: left;
        display: block
    }

    .regist_top .regist_box_top div {
        display: block;
        line-height: 140%;
        font-size: 1.5rem;
        font-weight: 600;
        color: #333d4b;
        float: left;
        letter-spacing: -.3px
    }

    .regist_box {
        background-color: #fff;
        border-top: 2px solid #333d4b;
        border-bottom: 1px solid #333d4b;
        margin-bottom: 32px
    }

    .regist_box .description {
        margin: 32px 0 0
    }

    .regist_box .description dl {
        width: 100%;
        margin: 0 0 35px;
        padding: 0 0 43px;
        border-bottom: 1px solid #e5e8eb
    }

    .regist_box .description dl#title {
        height: 55px
    }

    .regist_box .description dl:last-child {
        margin: 0
    }

    .regist_box .description .regist_image_dl {
        margin: 0 0 32px;
        padding: 0 0 32px;
        border-bottom: 1px solid #e5e8eb
    }

    .regist_box .description dl:after {
        clear: both;
        content: "";
        display: block
    }

    .regist_box .description dl dt {
        margin: 4px 0 0;
        width: 15%;
        float: left;
        font-weight: 700
    }

    .regist_box .description dl dt label {
        font-size: 18px;
        color: #333d4b
    }

    .regist_box .description dl dt span {
        font-size: 15px;
        color: #9ea4aa
    }

    .regist_box .description dl dd {
        width: 85%;
        float: left;
        position: relative
    }

    #images_box .count_img {
        position: absolute;
        margin-top: 43px;
    }

    #images_box .count_img,#images_box .count_img span {
        font-size: 14px;
        color: #8b95a1
    }

    #images_box .count_img_active {
        position: absolute;
        font-size: 14px;
        color: #8b95a1;
        margin-top: 32px
    }

    #images_box .count_img_active span {
        font-size: 14px;
        color: #0484f6
    }

    .regist_title {
        display: flex
    }

    .regist_box .description .title_input {
        width: 100%;
        height: 52px;
        font-size: 18px;
        text-align: left;
        color: #333d4b;
        border-radius: 8px
    }

    #content textarea:focus,#tag input:focus,#title input:focus {
        border: 1px solid #333d4b
    }

    .regist_box .description input::placeholder {
        font-size: 18px;
        color: #b0b8c1
    }

    .regist_box .description .title_input::-webkit-input-placeholder {
        color: #9ea4aa;
        z-index: -1;
        background-color: transparent
    }

    .regist_box .description .title_input::-moz-placeholder {
        color: #9ea4aa;
        z-index: -1;
        background-color: transparent
    }

    .regist_box .description .title_input:-ms-input-placeholder {
        color: #9ea4aa;
        z-index: -1;
        background-color: transparent
    }

    .regist_box .description .title_input:-moz-placeholder {
        color: #9ea4aa;
        z-index: -1;
        background-color: transparent
    }

    .regist_box .description .introduce {
        width: 100%;
        height: 168px;
        font-size: 18px;
        border-radius: 8px;
        padding: 14px 16px;
        background: #f9fafb;
        border: 1px solid #e8ebed
    }

    .regist_box .description .introduce::-webkit-input-placeholder {
        color: #a1a8af;
        z-index: -1;
        background-color: transparent;
        font-weight: 400;
        font-size: 18px!important;
        letter-spacing: -.4px;
        line-height: 150%
    }

    .text_area {
        display: flex
    }

    .textAreaErr {
        width: 100%;
        height: 168px;
        font-size: 18px!important;
        border-radius: 8px;
        padding: 14px 16px;
        background: #f9fafb;
        border: 1px solid #ff6000!important
    }

    .regist_box .description .introduce::-moz-placeholder {
        color: #9ea4aa;
        z-index: -1;
        background-color: transparent
    }

    .regist_box .description .introduce:-ms-input-placeholder {
        color: #9ea4aa;
        z-index: -1;
        background-color: transparent
    }

    .regist_box .description .introduce:-moz-placeholder {
        color: #9ea4aa;
        z-index: -1;
        background-color: transparent
    }

    .parcel_box {
        position: relative
    }

    .parcel_box .parcel_info_intro {
        position: relative;
        height: auto;
        cursor: pointer;
        font-size: 20px
    }

    .box_area:after,.regist_box .item_status_list:after {
        display: block;
        content: "";
        clear: both
    }

    .regist_box .item_status_list li {
        float: left;
        text-align: center;
        line-height: 51px;
        font-size: 14px;
        letter-spacing: -.8px;
        margin-right: 8px
    }

    .itemStatus_description {
        font-size: 17px;
        font-weight: 600;
        color: #333d4b;
        margin-bottom: 14px
    }

    .regist_box .item_status_list li .text_wrapper {
        border: 1px solid #e8ebed;
        color: #868c95;
        cursor: pointer;
        height: 54px;
        border-radius: 12px;
        padding: 0 16px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 500;
        font-size: 1rem;
        line-height: 133%;
        letter-spacing: -.4px
    }

    .regist_box .item_status_list li .text_wrapper.click {
        border: 1px solid #dce0e5;
        background-color: #4d5358;
        color: #fff
    }

    .regist_condition,.regist_tag,.sell_method_box {
        display: flex
    }

    .regist_box .item_recommend_box {
        margin-top: 6px
    }

    .regist_box .item_recommend_box:after {
        clear: both;
        content: "";
        display: block
    }

    .regist_box .item_recommend_box li {
        float: left;
        margin-right: 9px;
        margin-top: 6px;
        margin-bottom: 6px
    }

    .regist_box .item_recommend_box .item_recommend_text {
        height: 30px;
        border: 1px solid #e5e8eb;
        border-radius: 6px;
        font-size: 13px;
        color: #545353;
        padding: 8px 14px;
        line-height: 0
    }

    .item_selected_text {
        height: 30px;
        border: 1px solid #0484f6;
        border-radius: 6px;
        font-size: 13px;
        color: #0484f6;
        padding: 8px 14px;
        line-height: 0
    }

    .regist_box .description dl dd i.arrow {
        position: absolute;
        transform: rotate(270deg);
        right: -5px;
        z-index: 4444;
        top: 13px
    }

    .regist_box .description dl dd i.arrow:after,.regist_box .description dl dd i.arrow:before {
        content: "";
        position: absolute;
        background-color: #0484f6;
    }


    .paging ul {
        text-align:center;
        margin: 20px 0 0
    }

    input[type=date],input[type=email],input[type=number],input[type=password],input[type=tel],input[type=text],textarea {
        border-radius: 8px
    }

    .scroll_top_btn {
        margin-bottom: 65px
    }

    .scroll_top_btn img {
        width: 50px;
        height: 50px
    }

    .item_list_area {
        width: 1060px;
        min-height: 480px;
        margin: 0 auto 20px;
        overflow: hidden
    }

    .content {
        width: 100%
    }

    .main_area {
        height: 100%
    }

    .main_area_center {
        width: 990px;
        margin: 0 auto
    }

    .list_area {
        display: grid;
        grid-template-columns: 25% 75%;
        max-width: 1200px;
        margin: 50px auto 20px
    }

    .list_area,.main_area_center .main {
        overflow: hidden
    }

    .main_area_center .main:after {
        clear: both;
        content: "";
        display: block
    }

    .mian_row .main_col_1 {
        width: 100%;
        float: left;
        margin-bottom: 20px
    }

    .mian_row .main_col_3 {
        width: 33.3333333333%;
        float: left;
        min-height: 327px;
        margin-bottom: 24px;
        position: relative
    }

    .mian_row {
        overflow: hidden;
        margin: 30px 0 0;
        min-height: 400px
    }

    .mian_row.main_row_event {
        margin: 0
    }

    .mian_row:after {
        clear: both;
        display: block;
        content: ""
    }

    .wrapper_div .info {
        float: left;
        width: 100%
    }

    .regist_main_area {
        width: 990px;
        margin: 40px auto
    }

    .card {
        background-color: #fff;
        display: block;
        border: 1px solid #e5e5e5;
        cursor: pointer;
        position: relative
    }

    .main_col_1 .card {
        margin: 0 10px
    }

    .card.card_list {
        border: 0
    }

    .image_outside {
        position: relative;
        padding-top: 100%;
        overflow: hidden
    }

    .image_outside .image_centerbox {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        -webkit-transform: translate(50%,50%);
        -ms-transform: translate(50%,50%);
        transform: translate(50%,50%)
    }

    .image_outside .image_centerbox .thumbnail_img {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: auto;
        -webkit-transform: translate(-50%,-50%);
        -ms-transform: translate(-50%,-50%);
        transform: translate(-50%,-50%);
        z-index: 10;
        display: block!important;
        cursor: pointer
    }

    .cont .item_title {
        color: #454c53;
        font-size: 17px;
        line-height: 22px;
        margin-top: 8px
    }

    .cont .item_price,.cont .item_title {
        text-overflow: ellipsis;
        white-space: nowrap;
        overflow: hidden
    }

    .cont .item_price {
        color: #000;
        font-size: 22px;
        padding-bottom: 18px
    }

    .image_wrapper_main_col_1 {
        width: 163px;
        float: left;
        margin-right: 20px
    }

    .remove_div_block {
        display: inline-block
    }

    .main_area_center .left {
        width: 230px;
        float: left;
        margin-right: -230px;
        position: relative
    }

    .comment_title {
        margin: 0 41px;
        padding: 20px 0
    }

    .comment_title .comment_title_comment {
        display: inline-block;
        font-size: 18px;
        font-weight: 500
    }

    .comment_title span {
        font-size: 12px
    }

    .input_custorm {
        margin: 0 41px;
        border-bottom: 1px solid #ededed
    }

    .input_custorm .cm_in_box textarea {
        width: 100%;
        resize: none;
        height: 64px
    }

    .input_custorm .cms_btn_box:after {
        content: "";
        clear: both;
        display: block
    }

    .input_custorm .cms_btn_box .comment_send_btn {
        text-align: center;
        font-size: 12px;
        color: #fff;
        margin: 8px 0;
        background-color: #2c3542;
        width: 72px;
        height: 36px;
        line-height: 38px;
        float: right;
        border: 1px solid #2c3542;
        cursor: pointer
    }

    .comment_al_list .answer_area {
        margin: 10px 0 0;
        padding-bottom: 10px;
        border-bottom: 1px solid #ededed
    }

    .comment_al_list .answer_area:after {
        content: "";
        clear: both;
        display: block
    }

    .comment_al_list .answer_area textarea {
        width: 100%;
        resize: none
    }

    .comment_al_list .comment_btn {
        float: right;
        cursor: pointer
    }

    .comment_more {
        cursor: pointer;
        font-weight: 700;
        color: #8a8a8a;
        text-decoration: underline;
        margin-bottom: 10px;
        padding: 10px;
        font-size: 12px;
        text-align: center;
        border-bottom: 1px solid #ededed
    }

    .comment_more a {
        color: #666;
        text-decoration: underline;
        font-weight: 400
    }

    .auto_result_wrapper_dealer.item_wrapper_share {
        width: 978px;
        border: 1px solid #ddd;
        margin: 0 0 72px
    }

    .auto_result_wrapper_dealer:after {
        clear: both;
        content: "";
        display: block
    }

    .auto_result_wrapper_dealer .auto_result_img_wrapper .item_share_naver {
        width: 289px;
        cursor: pointer
    }

    .auto_result_wrapper_dealer .item_share_table {
        display: table;
        margin: 17px auto 0
    }

    .auto_result_wrapper_dealer .item_share_table .item_share_table_naver {
        display: table-cell;
        text-align: left
    }

    .auto_result_wrapper_dealer .item_share_table .item_share_table_social {
        display: table-cell;
        text-align: center
    }

    .auto_result_wrapper_dealer .item_share_table .item_share_table_kakao {
        display: table-cell;
        text-align: right
    }

    .auto_result_wrapper_dealer .item_share_table .item_share_table_naver img,.auto_result_wrapper_dealer .item_share_table .item_share_table_social img {
        width: 82px;
        cursor: pointer;
        margin-right: 22px
    }

    .auto_result_wrapper_dealer .item_share_table .item_share_table_kakao img {
        width: 82px;
        cursor: pointer
    }

    .auto_result_wrapper_dealer .auto_result_title.item_share_title {
        line-height: 34px;
        margin: 66px 0 0
    }

    .auto_result_wrapper_dealer .auto_result_title.item_share_title span {
        font-weight: 700
    }

    .auto_result_wrapper_dealer .auto_result_ok_btn.auto_item_result_ok_btn {
        margin: 80px auto
    }

    .auto_result_wrapper_dealer .auto_result_ok_btn {
        width: 360px;
        line-height: 41px;
        border: 1px solid #1b99d5;
        border-radius: 3px;
        color: #1b99d5;
        text-align: center;
        margin: 20px auto 40px
    }

    .auto_result_wrapper_dealer .auto_result_title {
        text-align: center;
        margin: 15px 0 0;
        color: #010101;
        font-size: 20px;
        font-weight: 700
    }

    .auto_result_wrapper_dealer .auto_result_img_wrapper {
        margin: 42px auto 16px;
        text-align: center;
        display: block;
        position: relative
    }

    .image_list {
        width: 100%
    }

    .default {
        width: 140px
    }

    .image_list>div:nth-child(4n+1) li {
        margin-right: 0
    }

    .image_list:after {
        clear: both;
        content: "";
        display: block
    }

    .image_list li {
        border-radius: 12px
    }

    .default,.image_list li {
        width: 160px;
        float: left;
        margin-right: 8px;
        margin-bottom: 20px
    }

    .default {
        cursor: pointer
    }

    .img_delete_icon {
        position: absolute;
        top: 7px;
        right: 7px;
        z-index: 1;
        width: 30px;
        height: 30px;
        cursor: pointer
    }

    .image_list li .up_img_box {
        position: relative;
        width: 100%;
        padding-bottom: 100%
    }

    .image_list li .item_img {
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        cursor: pointer;
        position: absolute;
        border: 1px solid #e8ebed;
        border-radius: 12px
    }

    .default_icon {
        position: absolute;
        top: 128px;
        left: 100px;
        width: 57px;
        z-index: 1
    }

    .footer {
        margin-top: 100px
    }

    .item_detail .footer {
        margin-top: 0
    }

    .rule_main_footer {
        background-color: #fff;
        padding-bottom: 30px;
        border: 1px solid #ddd;
        overflow: hidden;
        float: left;
        margin-bottom: 70px
    }

    .rule_main_footer .rule_top {
        border-bottom: 1px solid #e8ebed;
        padding-top: 20px
    }

    .rule_main_footer .rule_top>div {
        text-align: center;
        font-size: 30px;
        color: #0484f6;
        padding-bottom: 20px
    }

    .rule_main_footer .rule_top img {
        margin-bottom: 19px
    }

    .rule_main_footer .rule_top p {
        text-align: center
    }

    .rule_main_footer .rule_list {
        margin: 0 41px;
        text-align: left
    }

    .rule_main_footer .rule_list dt {
        font-size: 12px;
        color: #666;
        font-weight: 700;
        line-height: 24px
    }

    .rule_main_footer .rule_list dd {
        margin-bottom: 20px
    }

    .rule_main_footer .rule_list dd,.rule_main_footer .rule_list ul li {
        font-size: 12px;
        line-height: 20px
    }

    .sweetalert_description {
        line-height: 1.7!important;
        font-size: 14px!important;
        color: #757575!important;
        font-weight: 400!important
    }

    .feature_option:hover {
        font-weight: 700
    }

    .feature_option.disabled:hover {
        font-weight: 400
    }

    .easybank_scroll {
        background-color: #f5f6f7
    }

    .left_nav_type2 {
        border: 1px solid #e8ebed
    }

    



.UploadGuideBox {
    border-radius: 8px;
    background: rgb(249, 250, 251);
    border: 0.4px solid rgb(209, 214, 219);
    height: 72px;
    padding-left: 20px;
    display: grid;
    align-content: center;
}

.MiddleDotText {
    color: rgb(161, 168, 175);
    letter-spacing: -0.6px;
    font-weight: 400;
    font-size: 0.875rem;
    font-family: "Pretendard Variable";
    line-height: 120%;
}

.TitleEssentialMark {
    color: rgb(255, 79, 79);
    font-weight: 600;
    font-size: 18px;
    line-height: 100%;
    letter-spacing: -0.3px;
    margin-left: 2px;
}

.Title__TitleWrapper {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
}

.MiddleDotTextWrapper {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    margin-top: 4px;
}

.categoryCategoryBox {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    height: 256px;
    background: rgb(255, 255, 255);
    border: 1px solid rgb(229, 232, 235);
    border-radius: 8px;
}

.ListListWrapper {
    width: 778px;
    height: 90%;
    overflow-y: scroll;
    box-sizing: border-box;
}

.TextTextWrapper {
    font-size: 15px;
    font-weight: 400;
    letter-spacing: -0.4px;
    line-height: 160%;
    color: rgb(52, 58, 63);
    margin-top: 8px;
    cursor: pointer;
}

.MiddleDotTextText {
    color: #A1A8AF;
    -webkit-letter-spacing: -0.6px;
    -moz-letter-spacing: -0.6px;
    -ms-letter-spacing: -0.6px;
    letter-spacing: -0.6px;
    font-weight: 400;
    font-size: 0.875rem;
    font-family: Pretendard Variable;
    line-height: 120%;
}


.itemStatus_description {
    font-size: 17px;
    font-weight: 600;
    color: #333d4b;
    margin-bottom: 14px;
}

.regist_box .item_status_list li .text_wrapper {
    border: 1px solid #e8ebed;
    color: #868c95;
    cursor: pointer;
    height: 54px;
    border-radius: 12px;
    padding: 0 16px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 500;
    font-size: 1rem;
    line-height: 133%;
    letter-spacing: -.4px;
}

.regist_box input[type=text], .regist_box textarea {
    color: #454c53;
}

.price_icon {
    position: absolute;
    top: 24px;
    left: 19px;
    width: 22px;
}

.PricePriceContainer {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
}

.PricePriceWrapper {
    width: 298px;
    height: 58px;
    border-radius: 8px;
    position: relative;
    padding: 6px 14px;
    border: 1px solid rgb(229, 232, 235);
}

.PricePriceDotText {
    color: rgb(51, 61, 75);
    font-size: 20px;
    font-weight: 700;
    margin: 4px 0px 5px 10px;
}

.regist_box input[type=text], .regist_box textarea {
    color: #454c53;
    font-size: 23px;
    margin-bottom: 2px;
}


.tagTagIcon {
    position: absolute;
    top: 22px;
    left: 8px;
    width: 13px;
    z-index: 1;
}


.tagTagDescContain {
    height: 96px;
    background-color: #f9fafb;
    border: 1px solid #e5e8eb;
    border-radius: 8px;
    font-size: 14px;
    display: grid;
    align-content: center;
    padding-left: 20px;
}

.PricePriceInput {
    color: rgb(51, 61, 75);
    font-size: 1.5rem;
    width: 96%;
    font-weight: 700;
    text-align: right;
    margin-left: 2px;
    z-index: 1;
    border: none !important;
}

.Title {
    color: rgb(51, 61, 75);
    font-weight: 600;
    font-size: 18px;
    line-height: 133%;
    letter-spacing: -0.3px;
}



.priceCheckbox label {
    font-size: 16px;
    font-weight: bold;
}
input[type=checkbox] {
    width: 20px;
    height: 20px;
}
.introduce::placeholder {
    color: gray;
    font-style: italic;
}
.default, .image_list li {
    width: 160px;
    float: left;
    margin-right: 8px;
    margin-bottom: 20px;
    border-radius: 12px;
}
.tagTagWrapper {
    position: relative;
}
.tagTagInput {
    position: absolute;
    top: 20px;
    left: 15px;
    width: 12px;
}
.tagTagInput {
    height: 52px;
    outline: none;
    font-size: 18px;
    margin: 0px 6px 0px 0px;
    border-radius: 8px;
    border: 1px solid rgb(229, 232, 235);
    width: 600px;
    padding-left: 35px;
    background: rgb(249, 250, 251);
    margin-top: -20px;
    margin-left: -22px;
}
.tagButton {
    width: 199px;
    height: 52px;
    border: 1px solid rgb(51, 61, 75);
    border-radius: 8px;
    font-size: 18px;
    font-weight: 600;
    color: rgb(51, 61, 75);
    display: inline-block;
    float: right;
    text-align: center;
}
.ListWrapper {
    /* display: flex; */
    display: inline-block;
    height: 25px;
    margin-top: 56px;
}


.ListTagContain {
    cursor: pointer;
    display: flex;
    padding: 12px 16px;
    border-radius: 12px;
    background: rgb(255, 255, 255);
    margin: 0px 5px 10px 0px;
    border: 1.4px solid rgb(229, 232, 235);
}

.ListTag {
    font-size: 16px;
    font-weight: 600;
}

.ListImage {
    width: 9px;
    height: 10px;
    margin: 4px 0px 0px 10px;
}

.tagTagDescContain {
    height: 96px;
    background-color: rgb(249, 250, 251);
    border: 1px solid rgb(229, 232, 235);
    border-radius: 8px;
    font-size: 14px;
    display: grid;
    align-content: center;
    padding-left: 20px;
    /* display: inline-block; */
}

.MiddleDotTextWrapper {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    margin-top: 4px;
}

.MiddleDotTextDotImg {
    margin-right: 5px;
}
.MiddleDotTextText {
    color: rgb(161, 168, 175);
    letter-spacing: -0.6px;
    font-weight: 400;
    font-size: 0.875rem;
    font-family: "Pretendard Variable";
    line-height: 120%;
}

.bgOTQt {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
}

.tagWrapper{
	display: inline-block;
	height: 20px;
	height: 100%;
}


.tagItem{
    margin-right: 10px;
}

.ImgFormDeleteImg {
    position: absolute;
    top: 7px;
    right: 7px;
    z-index: 1;
    width: 30px;
    height: 30px;
    cursor: pointer;
    background-color: black;
    border-radius: 50%;
}

.ImgFormThumbNailImg {
    border-radius: 12px;
    width: 162px;
    height: 162px;
    position: relative;
    cursor: pointer;
}

.ImgFormRepresentImgBox {
    width: 100%;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    position: absolute;
    bottom: 12px;
}

.ImgFormDefaultImg {
    width: 57px;
    z-index: 1;
}
</style>

<title>Insert title here</title>
</head>

<body>
<header><%@ include file="../inc/header.jsp"%></header>

	<div class="layoutChildren-sc-1fg0dfe-2 jjXXzz">
		<section class="content">
			<h1>중고거래의 시작 머니또마켓</h1>
			<h2>상품 등록 페이지</h2>
			<form class="insertItem" action="itemRegistPro" method="post" enctype="multipart/form-data">
				<div class="regist_main_area">
					<div class="regist_top">
						<div class="regist_box_top">
							<div>상품 등록</div>
						</div>
						<div class="regist_box_sub">
							<span>*필수항목</span>은 꼭 입력해주세요
						</div>
					</div>
					<div class="regist_box">
						<div class="description">
							<dl class="regist_image_dl" id="images_box">
								<dt class="TitleTitleWrapper">
									<label class="Title">상품 이미지</label>
									<div class="TitleEssentialMark">*</div>
								</dt>
								<div class="count_img">
									(<span>0</span>/5)
								</div>
								<dd>

									<input type="file" name="file" multiple class="multiple">
									<div role="presentation" tabindex="0">
										<input multiple type="file" tabindex="-1"
											style="display: none;"> <img
											src="https://ccimage.hellomarket.com/img/web/regist/image_camera_x3.png"
											alt="기본 상품 등록 이미지" class="default">
										<ul class="image_list">
										
											<!-- 이미지 미리보기 영역 -->
										</ul>
										<div class="UploadGuideBox">
											<div class="MiddleDotTextWrapper">
												<img
													src="https://ccimage.hellomarket.com/img/common/middle_dot.svg"
													alt="중간 도트" class="MiddleDotTextDotImg">
												<div class="MiddleDotText">이미지등록을 클릭하여 등록할 수 있어요</div>
											</div>
											<div class="MiddleDotTextWrapper">
												<img
													src="https://ccimage.hellomarket.com/img/common/middle_dot.svg"
													alt="중간 도트" class="MiddleDotTextDotImg">
												<div class="MiddleDotText">드래그하여 상품 이미지 순서를 변경할 수 있어요</div>
											</div>
										</div>
									</div>
								</dd>
							</dl>


							<dl class="regist_title" id="title">
								<dt class="TitleTitleWrapper">
									<label class="Title">상품제목</label>
									<div class="TitleEssentialMark">*</div>
								</dt>
								<dd>
									<input type="text" name="item_subject" class="title_input"
										placeholder="상품 제목을 입력해주세요" value="">
									<ul class="item_recommend_box"></ul>
								</dd>
							</dl>
							<dl id="item_category"
								class="categoryCategoryWrapper-sc-1qdv6sn-0 cGwZbp">
								<dt class="TitleTitleWrapper">
									<label class="Title">카테고리</label>
									<div class="TitleEssentialMark">*</div>
								</dt>
								<dd>
									<div class="categoryCategoryBox">
										<div class="ListListWrapper">
											<div class="TextTextWrapper">패션/의류/잡화/뷰티</div>
											<div class="TextTextWrapper">가전제품/모바일/PC</div>
											<div class="TextTextWrapper">가구/인테리어</div>
											<div class="TextTextWrapper">도서/음반/문구/티켓</div>
											<div class="TextTextWrapper">게임/스포츠/취미</div>
											<div class="TextTextWrapper">유아동/반려동물</div>
											<div class="TextTextWrapper">그외기타</div>
										</div>
										<input type="hidden" name="item_category" value="">
								</dd>
							</dl>
							<dl class="sell_method_box">
								<dt class="TitleTitleWrapper">
									<label class="Title">가격 입력</label>
									<div class="TitleEssentialMark">*</div>
								</dt>
								<dd>
									<div class="box_sell_method box_area">
										<div id="price" class="PricePriceContainer">
											<div class="PricePriceWrapper">
												<img
													src="https://ccimage.hellomarket.com/img/web/regist/price_icon_x3.png"
													class="price_icon" alt="가격 아이콘"> <input type="text"
													name="item_price" placeholder="숫자를 입력해주세요"
													class="PricePriceInput" value=""
													style="width: 100%; height: 58px;">
											</div>
											<span class="PricePriceDotText">원</span>
										</div>
									</div>
								</dd>
							</dl>
							<dl class="sell_method_box">
								<dt class="TitleTitleWrapper">
									<label class="Title">가격 제안</label>
									<div class="TitleEssentialMark">*</div>
								</dt>
								<dd>
									<div class="box_sell_method box_area">
										<div id="price" class="PricePriceContainer">
											<div class="priceCheckbox">
												<input type="checkbox" id="priceCheckbox"
													name="item_price_offer"> <label for="priceCheckbox">가격
													제안하기</label>
											</div>
										</div>
									</div>
								</dd>
							</dl>

							<dl class="regist_tag">
								<dt class="TitleTitleWrapper">
									<label class="Title">태그(선택사항)</label>
								</dt>
								<dd>
									<div class="tagWrapper">
										<img
											src="https://ccimage.hellomarket.com/img/web/regist/tag_icon_x3.png"
											class="tagTagIcon"> <input
											placeholder="태그를 입력해주세요(최대 5개)" class="tagTagInput" value="">
									</div>
									<button class="tagButton">추가</button>
									<div class="ListWrapper"></div>
									<input type="hidden" name="item_tag" value="">
								</dd>
							</dl>
							<dl class="text_area" id="desc">
								<dt class="TitleTitleWrapper">
									<label class="Title">상품설명</label>
									<div class="TitleEssentialMark">*</div>
								</dt>
								<dd>
									<textarea rows="5" class="introduce" name="item_content"
										placeholder="상품의 상태를 정확하게 알 수 있는 정보를 꼭 포함해 주세요!   (최대 2,500자)"></textarea>
								</dd>
							</dl>

						</div>
					</div>
					<div class="item_submit_box">
						<div class="item_area_submit_box">
							<a href="main">
								<button class="btn_item_cancel" type="button">취소</button>
							</a>
							<button class="btn_item_submit" type="submit">상품 등록</button>
						</div>
					</div>
				</div>
			</form>
		</section>
	</div>
</body>
</html>