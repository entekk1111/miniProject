<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    
    <script src="/webjars/jquery/3.6.1/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>

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
		<div class="navbar-nav drop-down">
			<div class="nav-item text-nowrap drop-down">
				 <c:if test="${userId ne null }">
					<span class="nav-link px-3 dropdown-toggle" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" >${userId } 님</span>
				</c:if>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1"> 
				<li><a class="dropdown-item"  href="/logout">logout</a></li>
				</div> 
			</div>
		</div>
	</header>

	<div class="container-fluid">
	
		<form name="pageForm" id="paging" method="GET" action="/productList">
			<input type="hidden" name="page" id="page" value="${pageMap.currentPageNum }" />
			<input type="hidden" name="pageSize" value="${pageMap.postsPerPage }" />
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
				
				</div>
			</nav>
		
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">상품목록</h1>
				</div>
				<div class="searchDiv col-md-5">
					<div class="input-group mb-3">
						<input type="text" id="searchWord" class="form-control" value="${inData.searchWord }" placeholder="상품명 검색" />
						<button id="search"  class="searchBtn  btn btn-outline-secondary">검색</button>
					</div>
				</div>
				<div class="pt-3 pb-2 mb-3 ms-2">
					<fmt:formatNumber value="${totalCount}" type="number" var="tCount" />	
					<c:if test="${tCount > 10}">
						<span id="totalCnt">총 ${tCount}개 중 10개의 상품 표시중 /</span>
					</c:if>
					<c:if test="${tCount < 11}">
						<span id="totalCnt">총 ${tCount}개 중 ${tCount}개의 상품 표시중 /</span>
					</c:if>
					<span id="checkCnt">0</span>
					<span>개 선택됨</span>
				
						<div class="btn-group me-2">
							<button type="button" class="btn btn-primary" onclick="delBtn()">
								선택한 상품 삭제
							</button>
						</div>
				</div>
			
				<div class="table-responsive">
					<table class="table table-striped table-sm">
					
						<thead>
							<tr>
								<th scope="col"><input type='checkbox' class="form-check-input" id='checkAll' /></th>
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
										<td><input type='checkbox' class="pList form-check-input" value="${list.PRODUCNUM }" /></td>
										<td>${list.PRODCNAME }</td>
										<td class="center">${list.PRODPRICE }</td>
										<td><input type='button' class="btn btn-secondary btn-sm" onclick='updateSelected(${list.PRODUCNUM })' value='수정' /></td>
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
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${pageMap.blockFirstPageNum != null && pageMap.isPrevExist == true }">
							<li class="page-item">
								<a class="page-link" aria-label="Previous" onclick="pageClick(this)" data-value="${pageMap.blockFirstPageNum - pageMap.pagePerBlock } }">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						</c:if>
						<c:if test="${pageMap.totalPostCount > 0 }">
							<c:forEach var="list" items="${pageMap.pageList }" varStatus="index">
								<li class="page-item"><a class="page-link" onclick="pageClick(this)" data-value="${list }">${list }</a></li>
							</c:forEach>
						</c:if>
						<c:if test="${pageMap.totalLastPageNum != null && pageMap.isNextExist == true }">
							<li class="page-item">
								<a class="page-link" aria-label="Next" onclick="pageClick(this)" data-value="${(pageMap.blockLastPageNum + 1)}">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</main>
		</div>
	</div>
	
	<!-- modal-logout -->
	<div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="urlOpenModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title me-2" id="urlOpenModalLabel">로그아웃</h5>
					<a href="/logout"><button type="button" class="btn btn-primary btn-sm">로그아웃</button></a>
				</div>
			</div>
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
		
		//선택숫자 카운트
		$('.pList').on('change', function(){
			checkCnt();
		});
		
		//로그아웃클릭시 모달
		$('#logout').on('click', function(){
			$('#logoutModal').modal('show');
		});
		
		//페이지네이션 클릭시 목록
// 		$('.page-link').on('click', function(){
// 			$('#page').val($(this).data('value'));
			
// 			var jsonData = {
// 		    		page: $('#page').val(),
// 		    		searchWord: $('#searchWord').val()
// 	    		};
		    
// 			$.ajax({
// 				type: "post",
// 				url: "/productList.do",
// 				contentType: "application/json; charset=UTF-8",
// 				dataType: "json",
// 				data: JSON.stringify(jsonData),
// 				success: function(data) {
// 					makeHtml(data);
// 				},
// 				error : function(e) {
// 			        console.log("ERROR : ", e);
// 			        alert("서버요청실패");
// 		        }
			
// 			});
// 		});
		
	});
	
	//상품수정
	var updateSelected = function(number){
		location.href = '/updateProduct?number=' + number + '&' + $('#paging').serialize();
	};
	
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
	    
	    var jsonData = {
	    		pNum: data,
	    		page: $('#page').val(),
	    		searchWord: $('#searchWord').val()
    		};
	    
		$.ajax({
			type: "post",
			url: "/deleteList",
			contentType: "application/json; charset=UTF-8",
			dataType: "json",
			data: JSON.stringify(jsonData),
			success: function(data) {
				makeHtml(data);
			},
			error : function(e) {
		        console.log("ERROR : ", e);
		        alert("서버요청실패");
	        }
		
		});
	};
	
	//페이지네이션
	var pageClick = function(object){
		$('#page').val($(object).data('value'));
		
		var jsonData = {
	    		page: $('#page').val(),
	    		searchWord: $('#searchWord').val()
    		};
	    
		$.ajax({
			type: "post",
			url: "/productList.do",
			contentType: "application/json; charset=UTF-8",
			dataType: "json",
			data: JSON.stringify(jsonData),
			success: function(data) {
				makeHtml(data);
			},
			error : function(e) {
		        console.log("ERROR : ", e);
		        alert("서버요청실패");
	        }
		
		});
	}
	
	if("${inData.searchType }" != "") {
		$("#bbs_select01").val("${inData.searchType }").prop("selected", true);		<%--searchType 값 세팅--%>
		
		var select_name = $("#bbs_select01").children("option:selected").text();	<%-- select된 텍스트 --%>
		$("#bbs_select01").siblings("label").text(select_name);						<%-- label에 텍스트 삽입 --%>
	}
	if("${inData.pageSize }" != "") {
		$("#bbs_select02").val("${inData.pageSize }").prop("selected", true);		<%--pageSize 값 세팅--%>
		
		var select_name = $("#bbs_select02").children("option:selected").text();	<%-- select된 텍스트 --%>
		$("#bbs_select02").siblings("label").text(select_name);						<%-- label에 텍스트 삽입 --%>
	}
	
	<%--검색 버튼 클릭 시--%>
	$("#search").on("click", function() {
		$("#searchWord").val($("#searchWord").val().trim());	<%--검색어 양옆 공백제거--%>
		$("input[name='searchWord']").val($("#searchWord").val());
// 		$("input[name='searchType']").val($("#bbs_select01").val());
// 		$("input[name='pageSize']").val($("#bbs_select02").val());
		$("#page").val(1);
		
		var jsonData = {
				searchWord: $('#searchWord').val()
		};
	    
		$.ajax({
			type: "post",
			url: "/productList.do",
			contentType: "application/json; charset=UTF-8",
			dataType: "json",
// 			data: jsonData,
			data: JSON.stringify(jsonData),
			success: function(data) {
				makeHtml(data);
			},
			error : function(e) {
		        console.log("ERROR : ", e);
		        alert("서버요청실패");
	        }
		
		});
	});
	
	<%--검색창에서 엔터 누를 시--%>
	$("#searchWord").on("keydown", function() {
		if('Enter' == event.key) {
			$("#search").click();	<%--검색 버튼 클릭--%>
		}
	});
	
	var makeHtml = function(data){
		var html = '';
		var pageHtml = '';
		
		if(data.totalCount != null && data.totalCount != undefined && data.totalCount != '0'){
			for(var i = 0; i < data.outList.length; i++){					
				html += '<tr id="pList' + data.outList[i].PRODUCNUM + '" data-value="' + data.outList[i].PRODUCNUM +'">   															';
				html += '	<td><input type="checkbox" class="pList form-check-input" value="' + data.outList[i].PRODUCNUM + '" /></td>                                      ';
				html += '	<td>' + data.outList[i].PRODCNAME + '</td>                                                                         ';
				html += '	<td class="center">' + data.outList[i].PRODPRICE + '</td>                                                         ';
				html += '	<td><input type="button" class="btn btn-secondary btn-sm" onclick="updateSelected(' + data.outList[i].PRODUCNUM + ')" value="수정" /></td>           ';
				html += '	<td>' + data.outList[i].PRREGDATE + '</td>                                                                         ';
				html += '</tr>                                                                                                      ';
			}
		}else if(data.totalCount == '0' || data.totalCount == null){
			
			html += '<tr><td colspan="6">등록된 상품이 없습니다.</td></tr>';
		}
		
		if(data.totalCount != null && data.totalCount != undefined && data.totalCount != '0'){
			if(data.pageMap.blockFirstPageNum != null && data.pageMap.blockFirstPageNum != 1 ){   
				pageHtml += '   <li class="page-item">                                                                                                         ';
				pageHtml += '		<a class="page-link" aria-label="Previous" onclick="pageClick(this)" data-value="'+ (data.pageMap.blockFirstPageNum - data.pageMap.pagesPerBlock) +'">  ';
				pageHtml += '			<span aria-hidden="true">&laquo;</span>                                                                                    ';
				pageHtml += '		</a>                                                                                                                           ';
		 	    pageHtml += '   </li>                                                                                                                          ';
			}                                                                                                                                                  
			if(data.pageMap.totalPostCount > 0 ){  
				for(var i = 0; i < data.pageMap.pageList.length; i++){	
					pageHtml += '   <li class="page-item">                                                                                                         ';
					pageHtml += '		<a class="page-link" onclick="pageClick(this)" data-value="'+ data.pageMap.pageList[i] +'">'+ data.pageMap.pageList[i] +'</a>                       ';
			 	    pageHtml += '   </li>                                                                                                                          ';
				}
			}                                                                                                                                                  
			if(data.pageMap.totalLastPageNum != null && data.pageMap.totalLastPageNum > data.pageMap.blockLastPageNum ){  
				pageHtml += '   <li class="page-item">                                                                                                         ';
				pageHtml += '		<a class="page-link" aria-label="Next" onclick="pageClick(this)" data-value="'+ (data.pageMap.blockLastPageNum + 1) +'">                               ';
				pageHtml += '			<span aria-hidden="true">&raquo;</span>                                                                                    ';
				pageHtml += '		</a>                                                                                                                           ';
		 	    pageHtml += '   </li>                                                                                                                          ';
			}                                                                                                                                                  
		}
		
		$('tbody').html(html);			        //검색 정보 넣기
		$('.pagination').html(pageHtml);        //페이지네이션 
		if(data.totalCount > 10){
			$('#totalCnt').text('총 '+ data.totalCount+'개 중 10개의 상품 표시중 /')
		}else{
			$('#totalCnt').text('총 '+ data.totalCount +'개 중 '+ data.totalCount +'개의 상품 표시중 /')
		}
	}
	
</script>
</html>