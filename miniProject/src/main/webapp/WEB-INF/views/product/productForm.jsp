<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>상품등록</title>

	<script src="/webjars/jquery/3.6.1/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/common.js"></script>

    <!-- Custom styles for this template -->
    <link href="/css/dashboard.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/dashboard/">

    <!-- Bootstrap core CSS -->
	<link href="/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
    <!-- summernote -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src="/js/summernote-ko-KR.js"></script>
	
	<!-- fontawesome -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.2/css/fontawesome.min.css" integrity="sha384-X8QTME3FCg1DLb58++lPvsjbQoCT9bp3MsUU3grbIny/3ZwUJkRNO8NPW6zqzuW9" crossorigin="anonymous">

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
      
      .note-editable{
      	background-color: white;
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
	
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 mb-4">
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
						총 <span id="prCount">0</span>개 / <span id="prCheckedCount">0</span>개 선택됨
					</span>
				</label>
				
				<button type="button" id="submitBtn" class="btn btn-primary" onclick="addCheckedProduct()" disabled>
					선택한 상품 업로드
				</button>
			</div>
			
			<!-- 상품이 하나도 없을때 -->
			<div id="guidanceMsg" class="p-5 bg-light border rounded-3">
				<h2>URL로 상품을 수집해주세요.</h2>
				<p><span class="text-primary">상세페이지 URL</span>을 복사해서 붙여넣기한 다음 <span class="text-primary">상품 가져오기</span>를 눌러주세요!</p>
				<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#urlOpenModal">
					URL수집하기
				</button>
	        </div>
			
			<!-- 상품이 전부 업로드 되었을때 -->
			<div id="uploadSucceseMsg" class="p-5 bg-light border rounded-3 d-none">
				<h2>상품이 모두 업로드 되었습니다.</h2>
				<p><span class="text-primary">상품목록</span>에서 확인 할 수 있습니다.</p>
				<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#urlOpenModal">
					URL수집하기
				</button>
				<button type="button" class="btn btn-outline-primary" onclick="goProductList()">
					상품목록가기
				</button>
	        </div>
	        
	        <!-- 상품 전송 폼 -->
			<form id="submitForm" name="submitForm">
				<div id="productCard">
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
				<button type="button" class="btn btn-primary btn-sm me-2" onclick="addUrl()">URL입력창 추가</button>
				<button type="button" class="btn btn-secondary btn-sm" onclick="resetUrlForm()">URL입력창 초기화</button>
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

$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

$(document).ready(function() {
	
	$('#summernote').summernote({
// 		placeholder : 'content',
		minHeight : 370,
		maxHeight : null,
		focus : true,
		lang : 'ko-KR'
	});
	
	//모달 실행되고 나서 url박스에 focus
	$('#urlOpenModal').on('shown.bs.modal', function(){
		$('input[name="url"]').focus();
	});
	

});

$(document).on('keyup', 'input', function(){
	if($(this).val() != null && $(this).val() != '' && $(this).val() != undefined){
		$(this).removeClass('is-invalid')
	}	
});

//상품목록가기
var goProductList = function(){
	location.href = "/productList";
};

//url상품수집 모달 초기화
var resetUrlForm = function(){
	var inputBox = $('#urlForm').find('.input-group');
	for(var i = 1; i < $(inputBox).length; i++){
		$(inputBox)[i].remove();
	}
	$('input[name="url"]').val('');
};

//url추가 폼 삭제
var delInputUrl = function(obj){
	$(obj).parent().remove();
};

//선택된 갯수 체크
var checkedCount = function(){
	$('#prCount').text($('.product').length);
	$('#prCheckedCount').text($('.prCheck:checked').length);
};

//써머노트 실행
var summernote = function(){
	$('.summernote').summernote({
// 		placeholder : 'content',
		minHeight : 370,
		maxHeight : 500,
		focus : true,
		lang : 'ko-KR'
	});
};

//url추가
var addUrl = function(){
	$('#urlForm').append('<div class="input-group mt-2">'
							+'<input type="text" name="url" class="form-control" placeholder="URL을 입력해주세요.">'
							+'<button type="button" class="btn btn-secondary" onclick="delInputUrl(this)">X</button>'
						+'</div>');
};

//tab active 변경
var changeTab = function(type, index){
	if(type == 'A'){
		$('.aTab_' + index).addClass('active');			//상품정보 tab 활성화
		$('.bTab_' + index).removeClass('active');		//상품상세 tab 비활성화
		$('.bTabCard_' + index).addClass('d-none');		//상품정보 card 노출
		$('.aTabCard_' + index).removeClass('d-none');	//상품상세 card 숨김
	}else if(type == 'B'){
		$('.aTab_' + index).removeClass('active');      //상품정보 tab 비활성화  
		$('.bTab_' + index).addClass('active');         //상품상세 tab 활성화 
		$('.aTabCard_' + index).addClass('d-none');     //상품정보 card 숨김  
		$('.bTabCard_' + index).removeClass('d-none');  //상품상세 card 노출  
	}
};

//사진 삭제
var delPhoto = function(productIdx, photoIdx){
	$('.photo_' + productIdx + '_' + photoIdx).remove();	//해당 index 사진 삭제
};

//전체 선택
var allCheck = function(){
	if($('#allCheck').is(':checked')){		
		$('.prCheck').prop('checked', true);
	}else{
		$('.prCheck').prop('checked', false);		
	}
	checkedCount();
};

//상품 업로드
var addCheckedProduct = function(){
	var data = '';
	var flag = 0;

	if($('.prCheck:checked').length == 0){
		alert('최소 한가지는 선택해야 합니다.');
		return false;
	}
	
	//1. 체크되어있는거 data-index 가져옴
	//2. product_ + index div 하위에 있는 disabled 아닌 것들만 input 값을 가져옴
	var dataArr = [];
	var indexArr = [];
	for(var item of $('.prCheck:checked')){
		var dataObj = {};
		var index = $(item).data('index');
		indexArr.push($('.product_' + index));
	
		var inputItem = $('.product_' + index).find('input:not([disabled]), textarea');
		for(var itemInfo of inputItem){
			if($(itemInfo).attr('name') != 'optionValue' || $(itemInfo).attr('name') != 'productPhoto'){				
				if(($(itemInfo).val() == null || $(itemInfo).val() == '' || $(itemInfo).val() == undefined) && $(itemInfo).attr('name') != 'productDetail' && !$(itemInfo).hasClass('note-codable') && !$(itemInfo).hasClass('note-input')){
					$(itemInfo).addClass('is-invalid');
					$(itemInfo).focus();
					flag++;
					return;
				}else{					
					dataObj[$(itemInfo).attr('name')] = $(itemInfo).val();
				}
			}
		}
		
		//상품옵션
		var optionArr = [];
		$('.product_' + index).find('input[name="optionValue"]:not([disabled])').each(function(){
			optionArr.push($(this).val());
		});
		dataObj['optionValue'] = optionArr;
		
		//상품사진
		var photoArr = [];
		$('.product_' + index).find('input[name="productPhoto"]').each(function(){
			photoArr.push($(this).val());
		});
		dataObj['productPhoto'] = photoArr;
		dataArr.push(dataObj);
	}
	
	if(flag == 0){
		$.ajax({
			type: "post",
			url:"/addCheckedProduct",
			contentType: 'application/json',
			data: JSON.stringify(dataArr),
			success : function(data){
				if(data != 0){
					alert('업로드 완료');
					for(var item of indexArr){
						item.remove();			//업로드한 상품 화면에서 삭제
					}
					if($('.product').length == 0){						//다 올렸을때
						$('#uploadSucceseMsg').removeClass('d-none');	//안내문구 노출
					}
					checkedCount();	//상품 갯수 다시 셈
					resetUrlForm(); //url 상품수집 모달 초기화
				}else{
					alert('업로드 불가');
				}
			},
			error : function(fail){
				alert('업로드에 실패했습니다. 관리자에게 문의해주세요.');
			}
		});
	}
	
	$('.prCheck').each(function(){
		//체크 안되어있는것 disabled 처리
		if(!$(this).is(':checked')){
			var index = $(this).data('index');
			$('.product_' + index).find('input').attr('disabled', false);
		}
	});
};

//옵션 상태 변경
var changeOption = function(obj){
	if($(obj).is(':checked')){
		$(obj).parent().find('input[name="optionValue"]').attr('disabled', false);
	}else{
		$(obj).parent().find('input[name="optionValue"]').attr('disabled', true);	
	}
};

//상품 정보 가져오기
var getProductInfo = function(){
	var urlArr = [];
	var flag = 0;
	
	$('input[name="url"]').each(function(){
		if($(this).val() == null || $(this).val() == '' || $(this).val() == undefined || !$(this).val().includes('https') || !$(this).val().includes('http')){
			$(this).focus();
			$(this).addClass('is-invalid');
			flag++;
			return;
		}else{
			urlArr.push($(this).val());			
		}
	});
	
	if(flag == 0){	
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
						
						html += '<div class="product_' + i + ' mt-4 product">   																																			 ';
						html += '	<ul class="nav nav-tabs accordion">                                                                                                                                          ';
						html += '		<li class="nav-item">                                                                                                                                                    ';
						html += '			<input type="checkbox" class="mx-3 mt-2 form-check-input prCheck" data-index="' + i + '" onclick="checkedCount()" checked>                                                                                                   ';
						html += '		</li>                                                                                                                                                                    ';
						html += '		<li class="nav-item">                                                                                                                                                    ';
						html += '			<a class="nav-link active aTab_' + i + '" href="javascript:void(0)" onclick="changeTab(\'A\', ' + i + ')">기본정보</a>                                                                 ';
						html += '		</li>                                                                                                                                                                    ';
						html += '		<li class="nav-item">                                                                                                                                                    ';
						html += '			<a class="nav-link bTab_' + i + '" href="javascript:void(0)" onclick="changeTab(\'B\', ' + i + ')">상세페이지</a>                                                                      ';
						html += '		</li>                                                                                                                                                                    ';
	// 					html += '		<li class="content-end">                                                                                                                                                 ';
	// 					html += '			<button type="button" class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">';
	// 					html += '				접기                                                                                                                                                             ';
	// 					html += '			</button>                                                                                                                                                            ';
	// 					html += '		</li>                                                                                                                                                                    ';
						html += '	</ul>                                                                                                                                                                        ';
		                html += '                                                                                                                                                                                ';
		                html += '                                                                                                                                                                                ';
						html += '	<div class="accordion-item">                                                                                                                                                 ';
						html += '		<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">                                          ';
						html += '			<div class="accordion-body">                                                                                                                                         ';
						html += '				<div class="h-100 p-5 bg-light border rounded-3">                                                                                                                ';
						html += '		                                                                                                                                                                         ';
						html += '					<!-- 상품 정보 -->                                                                                                                                           ';
						html += '					<div id="productInfo" class="col-md-7 col-lg-8 aTabCard_' + i + '">                                                                                                  ';
						
						//상품명
						html += '						<div class="row g-3">                                                                                                                                    ';
						html += '							<div class="col-sm-10">                                                                                                                              ';
						html += '								<label for="firstName_' + i + '" class="form-label">상품명</label>                                                                                         ';
						html += '								<input type="text" class="form-control productTitle" id="firstName_' + i + '" placeholder="" name="productTitle" value="' + dataItem.title + '" required="" maxlength="100">                                                      ';
						html += '								<div class="invalid-feedback">                                                                                                                   ';
						html += '									상품명을 입력해주세요.                                                                                                              ';
						html += '								</div>                                                                                                                                           ';
						html += '							</div>                                                                                                                                               ';
						html += '						                                                                                                                                                         ';
						
						//가격
						html += '							<div class="col-sm-10">                                                                                                                              ';
						html += '								<label for="lastName_' + i + '" class="form-label">가격</label>                                                                                            ';
						html += '								<input type="text" class="form-control inputNumberFormatComma" id="lastName_' + i + '" placeholder="" name="productPrice" value="' + dataItem.price + '" required="">                                                       ';
						html += '								<div class="invalid-feedback">                                                                                                                   ';
						html += '									가격을 입력해주세요.                                                                                                               ';
						html += '								</div>                                                                                                                                           ';
						html += '							</div>                                                                                                                                               ';
						html += '						                                                                                                                                                         ';
						
						//옵션
						if(dataItem.optionKey != null && dataItem.optionKey != '' && dataItem.optionKey != undefined){						
							html += '							<div class="col-sm-10">                                                                                                                              ';
							html += '								<label for="option_' + i + '" class="form-label">옵션명</label>                                                                                          ';
							html += '								<input type="text" class="form-control" id="option_' + i + '" placeholder="" name="optionKey" value="' + dataItem.optionKey + '" required="" maxlength="30">                                                       ';
							html += '								<div class="invalid-feedback">                                                                                                                   ';
							html += '									옵션명을 입력해주세요.                                                                                                                 ';
							html += '								</div>                                                                                                                                           ';
							html += '							</div>                                                                                                                                               ';
						    html += '							<div class="col-sm-10">                                                                                                                              ';
							//옵션값
						    for(var j = 0; j < dataItem.optionValues.length; j++){	
								html += '								<div class="form-check">                                                                                                                         ';
								if(dataItem.optionValues[j].includes('품절')){	//품절이면 disabled							
									html += '									<input type="checkbox" class="form-check-input" id="same-address_' + j + '" value="' + dataItem.optionValues[j] + '_ck' + '" onclick="changeOption(this)" disabled>                                                                           ';
									html += '									<input type="text" class="form-control" placeholder="" name="optionValue" value="' + dataItem.optionValues[j] + '" disabled>                                                       ';
								}else{											
									html += '									<input type="checkbox" class="form-check-input" id="same-address_' + j + '" value="' + dataItem.optionValues[j] + '_ck' + '" onclick="changeOption(this)" checked>                                                                           ';
									html += '									<input type="text" class="form-control" placeholder="" name="optionValue" value="' + dataItem.optionValues[j] + '" required="" maxlength="100">                                                       ';
								}
								html += '								</div>                                                                                                                                          ';							
							}
							html += '							</div>                                                                                                                                               ';
						}else{
	// 						html += '<div class="col-sm-12">'
	// 						html += '<button type="button">옵션 추가</button>'
	// 						html += '</div>                                                                                                                                                   ';
						}
						html += '						</div>                                                                                                                                                   ';
						html += '						                                                                                                                                                         ';
						html += '						<hr class="my-4">                                                                                                                                        ';
						html += '						                                                                                                                                                         ';
						
						//사진
						if(dataItem.photos != null && dataItem.photos != '' && dataItem.photos != undefined){						
							html += '						<h4 class="mb-3">사진(최대 10개)</h4>                                                                                                                               ';
							html += '						<div class="row row-cols-1 row-cols-md-3 g-4">                                                                                                           ';
							for(var z = 0; z < dataItem.photos.length; z++){							
							html += '							<div class="col photo_' + i + '_' + z + '">                                                                                                                          ';
							html += '								<div class="card text-end"	>                                                                                                                      ';
							html += '									<div class="card-body">                                                                                                                      ';
							html += '										<button type="button" class="btn btn-secondary" onclick="delPhoto(' + i + ',' + z + ')"><i class="fa-solid fa-x"></i></button>                           ';
							html += '										<img src="' + dataItem.photos[z] + '" class="card-img-top">                                    ';						
							html += '										<input type="hidden" name="productPhoto" value="' + dataItem.photos[z] + '">                                                                                                                                       ';
							html += '									</div>                                                                                                                                       ';
							html += '								</div>                                                                                                                                           ';
							html += '							</div>                                                                                                                                               ';
							}
							html += '						</div>                                                                                                                                                   ';
						}
						html += '					</div>                                                                                                                                                       ';
						html += '					                                                                                                                                                             ';
						
						//상세페이지
						html += '					<!-- 상품 상세 -->                                                                                                                                           ';
						html += '					<div id="productDetail" class="form-floating bTabCard_' + i + ' d-none">                                                                                             ';
						html += '						<textarea contenteditable="true" class="form-control editable summernote" name="productDetail" placeholder="Leave a comment here" style="height: 100px">' + data[0].details.replaceAll('css','') + '</textarea>      ';
						html += '					</div>                                                                                                                                                       ';
					    html += '   		 		</div>                                                                                                                                                       ';
						html += '			</div>                                                                                                                                                               ';
						html += '		</div>                                                                                                                                                                   ';
						html += '	</div>                                                                                                                                                                       ';
						html += '</div>                                                                                                                                                                          ';
					}
					
				html += '	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom"> ';
				html += '	<div class="">                                                                                                        ';
				html += '		<div class="btn-grou">                                                                                            ';
				html += '			<button type="button" id="submitBtn" class="btn btn-primary" onclick="addCheckedProduct()">                   ';
				html += '				선택한 상품 업로드                                                                                        ';
				html += '			</button>                                                                                                     ';
				html += '		</div>                                                                                                            ';
				html += '	</div>                                                                                                                ';
				html += '</div>                                                                                                                   ';
					
					$('#productCard').html(html);			//상품 정보 넣기
					$('#allCheck').attr('checked', true);					//전체체크로 
					$('#prCount, #prCheckedCount').text(data.length);		//불러온 상품 갯수
					$('#urlOpenModal').modal('hide');		//url 오픈 모달 숨김
					$('#guidanceMsg, #uploadSucceseMsg').addClass('d-none');	//가이드문구 숨김
					$('#submitForm').removeClass('d-none');	//상품정보 노출
					$('#submitBtn').removeAttr('disabled');	//선택한 상품 업로드 버튼 풀기
					summernote(); 							//써머노트 적용
				}
				
			},
			error : function(fail){
			}
		});
	}
};
</script>
</html>