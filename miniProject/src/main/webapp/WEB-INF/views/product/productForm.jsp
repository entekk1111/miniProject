<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정폼</title>
<script src="/webjars/jquery/3.6.1/jquery.min.js"></script>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
</head>
<body>
	<button type="button" onclick="addUrl()">url박스추가</button>
	<div id="urlForm">
		<input type="text" name="url">
	</div>
	<button type="button" onclick="getProductInfo()">상품정보 가져오기</button>
	<hr>
	<div id="productInfo">
		<h4>상품정보</h4>
		<input type="checkbox" id="allCheck" value="all" onclick="allCheck()"/>
		<button type="button" onclick="addCheckedProduct()">선택상품 업로드</button>
		
		<form id="submitForm" name="submitForm">
			<div id="productInfoDetail">
				
			</div>
		</form>
		
	</div>
</body>

<script type="text/javascript">
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

$('#productInfo').hide();

$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

//url추가
var addUrl = function(){
	$('#urlForm').append('<input type="text" name="url">');
};

//사진 삭제
var delPhoto = function(obj){
	$(obj).parent().remove();
};

//전체 선택
var allCheck = function(){
	if($('#allCheck').is(':checked')){		
		$('.prCheck').prop('checked', true);
	}else{
		$('.prCheck').prop('checked', false);		
	}
};

//상품 업로드
var addCheckedProduct = function(){
	$.ajax({
		type: "post",
		url:"/addCheckedProduct",
		data: $('#submitForm').serialize(),
		success : function(data){
		},
		error : function(fail){
		}
	});
};

//상품 정보 가져오기
var getProductInfo = function(){
	var urlArr = [];
	$('input[name="url"]').each(function(){
		urlArr.push($(this).val());
	});
	
	$.ajax({
		type: "post",
		url:"/getProduct",
		data: JSON.stringify(urlArr),
		contentType: 'application/json',
		success : function(data){
			var html = '';                                                           
			if(data != null && data != undefined && data != ''){
				for(var i = 0; i < data.length; i++){					
					var dataItem = data[i];
					html += '<div class="product' + i + '">';
					html += '	<input type="checkbox" class="prCheck" value="' + dataItem.title + '">';
					
					//상품명
					html += '<div>';
					html += '	<label for="productTitle">상품명</label>';
					html += '	<input type="text" class="productTitle" name="productTitle" value="' + dataItem.title + '">';
// 					html += '	<button type="button" onclick="addProduct()">해당상품 업로드</button>';
					html += '</div>';
					
					//옵션
					if(dataItem.optionKey != null && dataItem.optionKey != '' && dataItem.optionKey != undefined){
						//옵션명
						html += '<div>';
						html += '	<label for="productOptionKey" class="productOptionKey">옵션그룹</label>';
						html += '	<input type="text" name="optionKey" value="' + dataItem.optionKey + '"/>';
						html += '</div>';
						
						//옵션값
						html += '<div>';
						for(var item of dataItem.optionValues){						
							html += '		<input type="checkbox" name="optionValueCheck" value="' + item + '_ck" checked>';
							html += '		<input type="text" name="optionValue" value="' + item + '"><br>';
						}
						html += '</div>';
					}
					
					//가격
					html += '<div>';
					html += '	<label for="productPrice">가격</label>';
					html += '	<input type="text" class="productPrice" value="' + dataItem.price + '">';
					html += '</div>';
					
					//사진
					if(dataItem.photos != null && dataItem.photos != '' && dataItem.photos != undefined){						
						html += '<div>';
						html += '	<label for="productPhotos">사진</label>';
						html += '	<div>';					
						for(var item of dataItem.photos){						
							html += '	<div>';					
							html += '		<img alt="photo" src="' + item + '" style="width:250px;">';
							html += '		<input type="hidden" name="productPhoto" value="' + item + '">';
							html += '		<button type="button" onclick="delPhoto(this)">X</button>';
							html += '	</div>';
						}
						html += '	</div>';
						html += '</div>';
					}
					html += '</div>';
					html += '<hr>';
				}
			}
			
			$('#productInfoDetail').html(html);
			$('#productInfo').show();
		},
		error : function(fail){
		}
	});
};
</script>
</html>