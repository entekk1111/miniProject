<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정폼</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
<!-- Nucleo Icons -->
<link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
<link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- CSS Files -->
<link id="pagestyle" href="../assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
<script src="/webjars/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<button type="button" onclick="addUrl()">url박스추가</button>
	<form id="urlForm">
		<input type="text" name="url">
	</form>
	<button type="button" onclick="getProductInfo()">상품정보 가져오기</button>
	<hr>
	<div id="productInfo">
		<h4>상품정보</h4>
		<div id="productInfoDetail">
			
		</div>
		
	</div>
</body>

<script type="text/javascript">
// $('#productInfo').hide();

//url추가
var addUrl = function(){
	$('#urlForm').append('<input type="text" name="url">');
	
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
					
					//상품명
					html += '<div>';
					html += '	<label for="productTitle">상품명</label>';
					html += '	<input type="text" class="productTitle" value="' + dataItem.title + '">';
					html += '</div>';
					
					//옵션
					if(dataItem.optionKey != null && dataItem.optionKey != '' && dataItem.optionKey != undefined){
						html += '<div>';
						html += '	<label for="productOptionKey" class="productOptionKey">' + dataItem.optionKey + '</label>';
						html += '	<select class="productOptionValue">';
						//옵션값
						for(var item of dataItem.optionValues){						
							html += '		<option value="' + item + '">' + item + '</option>';
						}
						html += '	</select>';
						html += '</div>';
					}
					
					//가격
					html += '<div>';
					html += '	<label for="productPrice">가격</label>';
					html += '	<input type="text" class="productPrice" value="' + dataItem.price + '">';
					html += '</div>';
					
					//사진
					html += '<div>';
					html += '	<label for="productPhotos">사진</label>';
					html += '	<div>';					
					for(var item of dataItem.photos){						
						html += '	<img alt="photo" src="' + item + '">';
					}
					html += '	</div>';
					html += '</div>';
					html += '<hr>';
				}
			}
			
			$('#productInfoDetail').html(html);
		},
		error : function(fail){
		}
	});
};
</script>
</html>