<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="/webjars/jquery/3.6.1/jquery.min.js"></script>
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>상품등록</title>

    <!-- Custom styles for this template -->
    <link href="/css/dashboard.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/dashboard/">

    <!-- Bootstrap core CSS -->
	<link href="/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
  </head>
<body>
<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
	<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="javascript:void(0)">miniProject</a>
	<button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="navbar-nav">
		<div class="nav-item text-nowrap">
			<a class="nav-link px-3" href="javascript:void(0)">Sign out</a>
		</div>
	</div>
</header>

<div class="container-fluid">
	<div class="row">
		<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
			<div class="position-sticky pt-3">
				<ul class="nav flex-column">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="/product">
							<span data-feather="home"></span>
							상품등록
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/productList">
							<span data-feather="file"></span>
							상품목록
						</a>
					</li>
				</ul>
			
<!-- 				<h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"> -->
<!-- 					<span>Saved reports</span> -->
<!-- 					<a class="link-secondary" href="#" aria-label="Add a new report"> -->
<!-- 						<span data-feather="plus-circle"></span> -->
<!-- 					</a> -->
<!-- 				</h6> -->
<!-- 				<ul class="nav flex-column mb-2"> -->
<!-- 					<li class="nav-item"> -->
<!-- 						<a class="nav-link" href="#"> -->
<!-- 							<span data-feather="file-text"></span> -->
<!-- 							Current month -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 					<li class="nav-item"> -->
<!-- 						<a class="nav-link" href="#"> -->
<!-- 							<span data-feather="file-text"></span> -->
<!-- 							Last quarter -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 					<li class="nav-item"> -->
<!-- 						<a class="nav-link" href="#"> -->
<!-- 							<span data-feather="file-text"></span> -->
<!-- 							Social engagement -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 					<li class="nav-item"> -->
<!-- 						<a class="nav-link" href="#"> -->
<!-- 							<span data-feather="file-text"></span> -->
<!-- 							Year-end sale -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 				</ul> -->
			</div>
		</nav>
	
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h1 class="h2">상품등록</h1>
				<div class="btn-toolbar mb-2 mb-md-0">
					<div class="btn-group me-2">
						<button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
						<button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
					</div>
					<button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
						<span data-feather="calendar"></span>
						This week
					</button>
				</div>
			</div>
		
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
		</main>
	</div>
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
					html += '	<input type="text" class="productPrice" name="productPrice" value="' + dataItem.price + '">';
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