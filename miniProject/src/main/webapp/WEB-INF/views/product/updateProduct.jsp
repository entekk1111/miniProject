<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>상품등록</title>

<script src="/webjars/jquery/3.6.1/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/common.js"></script>

<!-- Custom styles for this template -->
<link href="/css/dashboard.css" rel="stylesheet">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/dashboard/">

<!-- Bootstrap core CSS -->
<link href="/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- summernote -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="/js/summernote-ko-KR.js"></script>

<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.2/css/fontawesome.min.css"
	integrity="sha384-X8QTME3FCg1DLb58++lPvsjbQoCT9bp3MsUU3grbIny/3ZwUJkRNO8NPW6zqzuW9"
	crossorigin="anonymous">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.note-editable {
	background-color: white;
}
</style>
</head>
<body>
	<header
		class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3"
			href="javascript:void(0)">miniProject</a>
		<button class="navbar-toggler position-absolute d-md-none collapsed"
			type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu"
			aria-controls="sidebarMenu" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="navbar-nav">
			<div class="nav-item text-nowrap">
				<a class="nav-link px-3" href="/logout">Sign out</a>
			</div>
		</div>
	</header>
	<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="position-sticky pt-3">
					<ul class="nav flex-column">
						<li class="nav-item">
							<a class="nav-link active"	aria-current="page" href="/product"> 
							<span data-feather="home">상품등록</span></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/productList">
								<span data-feather="file">상품목록</span>
							</a>
						</li>
					</ul>
				</div>
			</nav>

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 mb-4">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">상품수정</h1>
				</div>

				<!-- 상품 전송 폼 -->
				<form id="submitForm" name="submitForm">
				<input type="hidden" name="productCode" value="${item.PRODUCNUM }">
					<div id="productCard">
						<div class="product mt-4">   																																			 
							<ul class="nav nav-tabs accordion">                                                                                                                                                                        
								<li class="nav-item">                                                                                                                                                    
									<a class="nav-link active aTab_0" href="javascript:void(0)" onclick="changeTab('A', '0')">기본정보</a>                                                                 
								</li>                                                                                                                                                                    
								<li class="nav-item">                                                                                                                                                    
									<a class="nav-link bTab_0" href="javascript:void(0)" onclick="changeTab('B', '0')">상세페이지</a>                                                                      
								</li>                                                                                                                                                                    
							</ul>                                                                                                                                                                        
		                                                                                                                                                                                                
		                                                                                                                                                                                                
							<div class="accordion-item">                                                                                                                                                 
								<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">                                          
									<div class="accordion-body">                                                                                                                                         
										<div class="h-100 p-5 bg-light border rounded-3">                                                                                                                
								                                                                                                                                                                         
											<!-- 상품 정보 -->                                                                                                                                           
											<div id="productInfo" class="col-md-7 col-lg-8 aTabCard_0">                                                                                                  
						
												<div class="row g-3">                                                                                                                                    
													<div class="col-sm-10">                                                                                                                              
														<label for="firstName_0" class="form-label">상품명</label>                                                                                         
														<input type="text" class="form-control productTitle" id="firstName_0" placeholder="" name="productTitle" value="${item.PRODCNAME }" required="" maxlength="100">                                                      
														<div class="invalid-feedback">                                                                                                                   
															상품명을 입력해주세요.                                                                                                              
														</div>                                                                                                                                           
													</div>                                                                                                                                               
												                                                                                                                                                         
						
													<div class="col-sm-10">                                                                                                                              
														<label for="lastName_0" class="form-label">가격</label>                                                                                            
														<input type="text" class="form-control inputNumberFormatComma" id="lastName_0" placeholder="" name="productPrice" value="${item.PRODPRICE }" required="">                                                       
														<div class="invalid-feedback">                                                                                                                   
															가격을 입력해주세요.                                                                                                               
														</div>                                                                                                                                           
													</div>                                                                                                                                               
												                                                                                                                                                         
						
					    							<c:if test="${not empty item.OPTIONAME }">
														<div class="col-sm-10">                                                                                                                              
															<label for="option_0" class="form-label">옵션명</label>                                                                                          
															<input type="text" class="form-control" id="option_0" placeholder="" name="optionKey" value="${item.OPTIONAME }" required="" maxlength="30">                                                       
															<div class="invalid-feedback">                                                                                                                   
																옵션명을 입력해주세요.                                                                                                                 
															</div>                                                                                                                                           
														</div>                                                                                                                                               
						    							<div class="col-sm-10">  
							    							<c:forEach items="${item.OPTIVALUE }" var="a">
																<div class="form-check">
																	<input type="checkbox" class="form-check-input" value="${a }" onclick="changeOption(this)" onclick="changeOption(this)" checked>                                                                           
																	<input type="text" class="form-control" placeholder="" name="optionValue" value="${a }"  maxlength="100">                                                       
																</div>                                                                                                                                          							
							    							</c:forEach>
														</div>                                                                                                                                               
					    							</c:if>                                                                                                                            
												</div>                                                                                                                                                   
												                                                                                                                                                         
												<hr class="my-4">                                                                                                                                        
						
												<h4 class="mb-3">사진(최대 10개)</h4>                                                                                                                               
												<div class="row row-cols-1 row-cols-md-3 g-4">                                                                                                           
													<c:forEach items="${item.PHOTHO }" var="a" varStatus="status">
													<div class="col photo_${status.index }">                                                                                                                          
														<div class="card text-end">                                                                                                                      
															<div class="card-body">                                                                                                                      
																<button type="button" class="btn btn-secondary" onclick="delPhoto(${status.index })"><i class="fa-solid fa-x"></i></button>                           
																<img src="${a }" class="card-img-top">						
																<input type="hidden" name="productPhoto" value="${a }">                                                                                                                                       
															</div>                                                                                                                                       
														</div>                                                                                                                                           
													</div>                                                                                                                                               
													</c:forEach>
												</div>                                                                                                                                                   
											</div>                                                                                                                                                       
											                                                                                                                                                             
						
											<!-- 상품 상세 -->                                                                                                                                           
											<div id="productDetail" class="form-floating bTabCard_0 d-none">                                                                                             
												<textarea id="summernote" contenteditable="true" class="form-control editable summernote" name="productDetail" placeholder="Leave a comment here" style="height: 100px">${item.PRODETAIL }</textarea>      
											</div>                                                                                                                                                       
					       		 		</div>                                                                                                                                                       
									</div>                                                                                                                                                               
								</div>                                                                                                                                                                   
							</div>                                                                                                                                                                       
						</div>  
					</div>     
				</form>
				<div class="mt-3">
					<button type="button" id="submitBtn" class="btn btn-primary"onclick="updateProduct()">
						저장
					</button>
				</div>
			</main>
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
		maxHeight : 500,
		focus : true,
		lang : 'ko-KR'
	});
});

$(document).on('keyup', 'input', function(){
	if($(this).val() != null && $(this).val() != '' && $(this).val() != undefined){
		$(this).removeClass('is-invalid')
	}	
});

//옵션 상태 변경
var changeOption = function(obj){
	if($(obj).is(':checked')){
		$(obj).parent().find('input[name="optionValue"]').attr('disabled', false);
	}else{
		$(obj).parent().find('input[name="optionValue"]').attr('disabled', true);	
	}
};

//사진 삭제
var delPhoto = function(photoIdx){
	$('.photo_' + photoIdx).remove();	//해당 index 사진 삭제
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

//수정
var updateProduct = function(){
	$.ajax({
		type: "post",
		url:"/updateProduct",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		data: $('#submitForm').serialize(),
		success : function(data){
			if(data != 0){
				location.href = '/productList?&page=${page}&pageSize=${pageSize}&searchType=${searchType}&searchWord=${searchWord}';
			}else{
				alert('업로드 불가');
			}
		},
		error : function(fail){
			alert('업로드에 실패했습니다. 관리자에게 문의해주세요.');
		}
	});
};
</script>
</html>