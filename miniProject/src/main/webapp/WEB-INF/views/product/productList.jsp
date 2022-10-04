<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>상품목록</title>

    <!-- Custom styles for this template -->
    <link href="/css/dashboard.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/dashboard/">

    <!-- Bootstrap core CSS -->
	<link href="/css/bootstrap.min.css" rel="stylesheet" >

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
				<c:if test="${userId ne null }">
					<a class="nav-link px-3" id="logoutBtn" href="/logout">${userId } 님</a>
				</c:if>
			</div>
		</div>
	</header>

	<div class="container-fluid">
	
		<form name="pageForm" id="paging" method="GET" action="/productList">
			<input type="hidden" name="page" id="page" value="${inData.page }" />
			<input type="hidden" name="pageSize" value="${inData.pageSize }" />
			<input type="hidden" name="searchType" value="${inData.searchType }" />
			<input type="hidden" name="searchWord" value="${inData.searchWord }" />
		</form>
		
		<div class="row">
			<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="position-sticky pt-3">
					<ul class="nav flex-column">
						<li class="nav-item">
							<a class="nav-link" aria-current="page" href="/product">
								<span data-feather="home"></span>
								상품등록
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active" href="/productList">
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
					<h1 class="h2">상품목록</h1>
				</div>
				<div class="pt-3 pb-2 mb-3 ms-2">
					<label for="allCheck">
						<span>
							총 ${totalCount}개 중 00개의 상품 표시중 /
						</span>
						<span id="checkCnt">0</span>
						<span>
							개 선택됨
						</span>
					</label>
					<div class="btn-toolbar mb-2 mb-md-0">
						<div class="btn-group me-2">
							<button type="button" class="btn btn-primary" onclick="delBtn()">
								선택한 상품 삭제
							</button>
						</div>
					</div>
				</div>
			
				<div class="table-responsive">
					<table class="table table-striped table-sm">
					
						<thead>
							<tr>
								<th scope="col"><input type='checkbox' id='checkAll' /></th>
								<th scope="col">상품명</th>
								<th scope="col">판매가</th>
								<th scope="col">수정</th>
								<th scope="col">상품등록일</th>
							</tr>
						</thead>
						
						<tbody>
							<c:if test="${outList.size() > 0 }">
								<c:forEach var="list" items="${outList }">
									<tr id="pList${list.PRODUCNUM }"  data-value="${list.PRODUCNUM }" >
										<td><input type='checkbox' class="pList" value="${list.PRODUCNUM }" /></td>
										<td>${list.PRODCNAME }</td>
										<td class="center">${list.PRODPRICE }</td>
										<td><input type='button' onclick='updateSelected(${list.PRODUCNUM })' value='수정' /></td>
										<td> ${list.PRREGDATE} </td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
						
						<c:if test="${outList.size() eq 0 }">
							<tr>
								<td colspan="6">등록된 상품이 없습니다.</td>
							</tr>
						</c:if>
						
					</table>
				</div>
			</main>
		</div>
	</div>
</body>
<script>
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	$(document).ajaxSend(function(e, xhr, options) {
	    xhr.setRequestHeader(header, token);
	});

	$(function() {
		//전체선택, 전체해제
		$('#checkAll').on('click', function(){
			if($('#checkAll').prop('checked') == true){
				$('.pList').prop('checked', true);
			}else{
				$('.pList').prop('checked', false);
			}
			checkCnt();
			
		});
		
		$('.pList').on('change', function(){
			checkCnt();
		});
	});
	
	//체크된 리스트 숫자
	var checkCnt = function(){
		var checkedCnt = $('.pList:checked').length;
		if(checkedCnt == 0){
			$('#checkCnt').text('0');
		}else{
			$('#checkCnt').text(checkedCnt);
		}
	};
	
	//삭제
	var delBtn = function(){
		
	    var data = []; // key 값을 담을 배열
          
	    $('.pList:checked').each(function(){
	    	data.push($(this).val());
	    });
	    
	    var jsonData = {pNum: data};
	    
		$.ajax({
			type: "post",
			url: "/deleteList",
			contentType: "application/json; charset=UTF-8",
			dataType: "json",
			data: JSON.stringify(jsonData),
			success: function(data) {
				window.location.href=window.location.href;
// 				makeHtml();
			},
			error : function(e) {
		        console.log("ERROR : ", e);
		        alert("서버요청실패");
	        }
		
		});
	};
	
	//화면구성
// 	var makeHtml = function(){
		
// 	};
	
	
	function goPage(page) {
		$("#page").val(page);
		
// 		$("#").attr({
// 			"method" : "GET",
// 			"action" : ""
// 		}).mcpSubmit();
	};
	
	
</script>
</html>