<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	<script src="/webjars/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<div class="container">
	    <form class="px-4 py-3" action="/loginProc" method="post">
<%-- 	        <div th:if="${param.error}"> --%>
<!-- 	            <div class="alert alert-danger"> -->
<!-- 	                사용자ID 또는 비밀번호를 확인해 주세요. -->
<!-- 	            </div> -->
<!-- 	        </div> -->
	        <div class="mb-3">
	            <label for="username" class="form-label">사용자ID</label>
	            <input type="text" name="username" id="username" class="form-control">
	        </div>
	        <div class="mb-3">
	            <label for="password" class="form-label">비밀번호</label>
	            <input type="password" name="password" id="password" class="form-control">
	        </div>
	        <button type="submit" class="btn btn-primary">로그인</button>
	    </form>
	    <a href="/signUp">회원가입</a>
	</div>
</body>

<script type="text/javascript">
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	$(document).ajaxSend(function(e, xhr, options) {
	    xhr.setRequestHeader(header, token);
	});
	
	$(function() {
		
		//가입버튼
		$("#register").on("click", function() {
			
			var formData = {
				userId : $('#userId').val(),
				userEmail : $('#userEmail').val(),
				userPw : $('#userPw').val(),
				gender : $("input:radio[name='gender']:checked").val(),
				age: $("input:radio[name='age']:checked").val()
			}
			// var formData = $('#regiForm').serialize();
			$.ajax({
				type: "post",
				url: "/register",
				contentType: "application/json; charset=UTF-8",
				dataType: "json",
				data: JSON.stringify(formData),
				success: function(data) {
					console.log(data);
					location.href="/";
				},
				error : function(e) {
			        console.log("ERROR : ", e);
			        alert("서버요청실패");
		        }
			
			});
		});
	});
</script>
</html>