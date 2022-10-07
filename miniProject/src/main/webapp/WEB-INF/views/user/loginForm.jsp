<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
<!-- 	<meta http-equiv="X-UA-Compatible" content="IE=Edge"> -->
  	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	<script src="/webjars/jquery/3.6.1/jquery.min.js"></script>
	<script src="/js/bootstrapLogin/bootstrap.min.js" ></script>
	<!-- Custom styles for this template -->
    <link href="/css/signin.css" rel="stylesheet">
	<!-- Bootstrap core CSS -->
	<link href="/css/bootstrapLogin/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sign-in/">
	<meta name="theme-color" content="#712cf9">
	
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

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
    </style>
    
    
	
  	
</head>

 <body class="text-center">
   
	<main class="form-signin w-100 m-auto">
		<form id="loginForm" action="/loginProc" method="post">
<!-- 			<img class="mb-4" src="/docs/5.2/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
			<h1 class="h2 mb-3 fw-normal">Login</h1>
			<br>
			<div class="form-floating">
				<input type="text" class="form-control" id="username" name="username" maxlength="20" placeholder="name@example.com">
				<label for="floatingInput">사용자ID</label>
				<div id="username_feed" class="invalid-tooltip">
					아이디를 입력해 주세요.
				</div>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="password" name="password" maxlength="20" placeholder="Password">
				<label for="floatingPassword">비밀번호</label>
				<div id="password_feed" class="invalid-tooltip">
					비밀번호를 입력해 주세요.
				</div>
			</div>
			<div class="checkbox mb-3">
				<label>
					 <p><a class="float-right"  href="/signUp">회원가입</a></p>
				</label>
			</div>
			<button class="w-100 btn btn-lg btn-primary" id="loginBtn" type="button">로그인</button>
	<!-- 			<p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p> -->
		</form>
	</main>
</body>
<script>
$(function() {
	$('#loginBtn').on('click', function(){
		valueChk();
	});
	
	$('#username').on('blur', function(){
		if($('#username').val() == ''){
			$('#username').addClass('is-invalid');
		}else if($('#username').val() != ''){
			$('#username').removeClass('is-invalid');
		}
	});
	
	$('#password').on('blur', function(){
		if($('#password').val() == ''){
			$('#password').addClass('is-invalid');
		}else if($('#password').val() != ''){
			$('#password').removeClass('is-invalid');
		}
	});
});


//빈값 체크
var valueChk = function(){  
	var id = $('#username').val();
	var pw = $('#password').val();
	
	if($.trim(id) == ''){
	    $('#username').val('');
	    $('#username').addClass('is-invalid');
	}
	if($.trim(pw) == ''){
	    $('#password').val('');
	    $('#password').addClass('is-invalid');
	}
	if($.trim(id) != '' && $.trim(pw) != ''){
		$('#loginForm').submit();
	}
}
</script>

</html>
