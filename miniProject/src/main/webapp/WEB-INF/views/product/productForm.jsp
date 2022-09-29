<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정폼</title>
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
					html += '<div>                                                               ';
					html += '	<label for="productTitle">상품명</label>             ';
					html += '	<input type="text" class="productTitle" value="' + dataItem.title + '">                ';
					html += '</div>                                                              ';
					html += '<div>                                                               ';
					html += '	<label for="productOptionKey" class="productOptionKey">' + dataItem.optionKey + '</label>';
					html += '	<select class="productOptionValue">                              ';
					for(var item of dataItem.optionValues){						
						html += '		<option value="' + item + '">' + item + '</option>                     ';
					}
					html += '	</select>                                                        ';
					html += '</div>                                                              ';
					html += '<div>                                                               ';
					html += '	<label for="productPrice">가격</label>                           ';
					html += '	<input type="text" class="productPrice" value="' + dataItem.price + '">                ';
					html += '</div>                                                              ';
					html += '<div>                                                               ';
					html += '	<label for="productPhotos">사진</label>                          ';
					for(var item of dataItem.photos){						
						html += '	<img alt="photo" src="' + item + '" style="width: 250px;">                                         ';
					}
					html += '</div>                                                              ';
					html += '</hr>                                                              ';
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