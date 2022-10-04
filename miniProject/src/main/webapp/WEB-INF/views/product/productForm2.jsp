<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="/webjars/jquery/3.6.1/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
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
			</div>
		</nav>
	
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h1 class="h2">상품등록</h1>
				<div class="btn-toolbar mb-2 mb-md-0">
					<div class="btn-group me-2">
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#urlOpenModal">
							URL수집하기
						</button>
					</div>
				</div>
			</div>
			<div class="pt-3 pb-2 mb-3 ms-2">
				<label for="allCheck">
					<input type="checkbox" id="allCheck" class="form-check-input" value="all" onclick="allCheck()">
					<span>
						총 26개 중 20개의 상품 표시중 / 0개 선택됨
					</span>
				</label>
			</div>
			<form id="submitForm" name="submitForm">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<input type="checkbox" class="mx-3 mt-2 form-check-input prCheck">
					</li>
					<li class="nav-item">
						<a id="aTab" class="nav-link active" href="javascript:void(0)" onclick="changeTab('A')">기본정보</a>
					</li>
					<li class="nav-item">
						<a id="bTab" class="nav-link" href="javascript:void(0)" onclick="changeTab('B')">상세페이지</a>
					</li>
				</ul>
				<div class="h-100 p-5 bg-light border rounded-3">
					<div class="col-md-7 col-lg-8">
        <h4 class="mb-3">Billing address</h4>
          <div class="row g-3">
            <div class="col-sm-6">
              <label for="firstName" class="form-label">First name</label>
              <input type="text" class="form-control" id="firstName" placeholder="" value="" required="">
              <div class="invalid-feedback">
                Valid first name is required.
              </div>
            </div>

            <div class="col-sm-6">
              <label for="lastName" class="form-label">Last name</label>
              <input type="text" class="form-control" id="lastName" placeholder="" value="" required="">
              <div class="invalid-feedback">
                Valid last name is required.
              </div>
            </div>

            <div class="col-12">
              <label for="username" class="form-label">Username</label>
              <div class="input-group has-validation">
                <span class="input-group-text">@</span>
                <input type="text" class="form-control" id="username" placeholder="Username" required="">
              <div class="invalid-feedback">
                  Your username is required.
                </div>
              </div>
            </div>

            <div class="col-12">
              <label for="email" class="form-label">Email <span class="text-muted">(Optional)</span></label>
              <input type="email" class="form-control" id="email" placeholder="you@example.com">
              <div class="invalid-feedback">
                Please enter a valid email address for shipping updates.
              </div>
            </div>

            <div class="col-12">
              <label for="address" class="form-label">Address</label>
              <input type="text" class="form-control" id="address" placeholder="1234 Main St" required="">
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

            <div class="col-12">
              <label for="address2" class="form-label">Address 2 <span class="text-muted">(Optional)</span></label>
              <input type="text" class="form-control" id="address2" placeholder="Apartment or suite">
            </div>

            <div class="col-md-5">
              <label for="country" class="form-label">Country</label>
              <select class="form-select" id="country" required="">
                <option value="">Choose...</option>
                <option>United States</option>
              </select>
              <div class="invalid-feedback">
                Please select a valid country.
              </div>
            </div>

            <div class="col-md-4">
              <label for="state" class="form-label">State</label>
              <select class="form-select" id="state" required="">
                <option value="">Choose...</option>
                <option>California</option>
              </select>
              <div class="invalid-feedback">
                Please provide a valid state.
              </div>
            </div>

            <div class="col-md-3">
              <label for="zip" class="form-label">Zip</label>
              <input type="text" class="form-control" id="zip" placeholder="" required="">
              <div class="invalid-feedback">
                Zip code required.
              </div>
            </div>
          </div>

          <hr class="my-4">

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="same-address">
            <label class="form-check-label" for="same-address">Shipping address is the same as my billing address</label>
          </div>

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="save-info">
            <label class="form-check-label" for="save-info">Save this information for next time</label>
          </div>

          <hr class="my-4">

          <h4 class="mb-3">Payment</h4>

          <div class="my-3">
            <div class="form-check">
              <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked="" required="">
              <label class="form-check-label" for="credit">Credit card</label>
            </div>
            <div class="form-check">
              <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required="">
              <label class="form-check-label" for="debit">Debit card</label>
            </div>
            <div class="form-check">
              <input id="paypal" name="paymentMethod" type="radio" class="form-check-input" required="">
              <label class="form-check-label" for="paypal">PayPal</label>
            </div>
          </div>

          <div class="row gy-3">
            <div class="col-md-6">
              <label for="cc-name" class="form-label">Name on card</label>
              <input type="text" class="form-control" id="cc-name" placeholder="" required="">
              <small class="text-muted">Full name as displayed on card</small>
              <div class="invalid-feedback">
                Name on card is required
              </div>
            </div>

            <div class="col-md-6">
              <label for="cc-number" class="form-label">Credit card number</label>
              <input type="text" class="form-control" id="cc-number" placeholder="" required="">
              <div class="invalid-feedback">
                Credit card number is required
              </div>
            </div>

            <div class="col-md-3">
              <label for="cc-expiration" class="form-label">Expiration</label>
              <input type="text" class="form-control" id="cc-expiration" placeholder="" required="">
              <div class="invalid-feedback">
                Expiration date required
              </div>
            </div>

            <div class="col-md-3">
              <label for="cc-cvv" class="form-label">CVV</label>
              <input type="text" class="form-control" id="cc-cvv" placeholder="" required="">
              <div class="invalid-feedback">
                Security code required
              </div>
            </div>
          </div>

          <hr class="my-4">

          <button class="w-100 btn btn-primary btn-lg" type="submit">Continue to checkout</button>
      </div>
		        </div>
			</form>
		</main>
	</div>
</div>
<!-- url 수집 모달 -->
<div class="modal fade" id="urlOpenModal" tabindex="-1" aria-labelledby="urlOpenModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title me-2" id="urlOpenModalLabel">URL로 상품수집</h5>
				<button type="button" class="btn btn-primary btn-sm" onclick="addUrl()">URL입력창 추가</button>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div id="urlForm">
					<div class="input-group">
						<input type="text" name="url" class="form-control" placeholder="URL을 입력해주세요.">
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" onclick="getProductInfo()">상품 가져오기</button>
			</div>
		</div>
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

//url추가 폼 삭제
var delInputUrl = function(obj){
	$(obj).parent().remove();
};

//url추가
var addUrl = function(){
	$('#urlForm').append('<div class="input-group mt-2">'
							+'<input type="text" name="url" class="form-control" placeholder="URL을 입력해주세요.">'
							+'<button type="button" class="btn btn-secondary" onclick="delInputUrl(this)">X</button>'
						+'</div>');
};

//tab active 변경
var changeTab = function(type){
	if(type == 'A'){
		$('#aTab').addClass('active');
		$('#bTab').removeClass('active');
	}else if(type == 'B'){
		$('#bTab').addClass('active');		
		$('#aTab').removeClass('active');
	}
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