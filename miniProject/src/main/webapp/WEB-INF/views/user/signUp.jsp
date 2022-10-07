<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
  	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
	<script src="/webjars/jquery/3.6.1/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js" ></script>
	<script src="/js/common.js"></script>

	<!-- Bootstrap core CSS -->
	<link href="/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ttbblHVjiiDPojqapKRQ488sZO1I/ceo1w2AXALA/iYVz389m+F2EXu2Go8VClG4" crossorigin="anonymous">
    <title>회원가입</title>

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

    <!-- Custom styles for this template -->
    <link href="/css/bootstrapLogin/form-validation.css" rel="stylesheet">

	<script src="/js/bootstrapLogin/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<!-- 	<script src="/css/bootstrapLogin/form-validation.js"></script> -->
	
</head>
<body class="bg-light">
	<div class="container" style="width:500px">
	  <main>
	    <div class="py-5 text-center">
	    </div>
	
	    <div class="row g-5">
	      <div>
	        <h2 class="mb-3 text-3xl" style="font-weight:bold;">회원가입</h4>
	        <form class="needs-validation" novalidate>
	          <div class="row g-3"  style="margin-top:40px;">
	
	            <div class="col-12">
					<label for="userId" class="form-label" style="font-weight:bold;">아이디</label>
					<div class="input-group has-validation">
						<input type="text" name="userId" class="form-control check" id="userId" maxlength="20" placeholder="아이디를 입력하세요" required>
						<div id="userId_feed" class="invalid-feedback">
						    아이디를 입력해 주세요.
					  	</div>
					</div>
	            </div>
	            <div class="col-sm-6">
					<label for=userPw class="form-label" style="font-weight:bold;">비밀번호</label>
					<input type="password" name="userPw" class="form-control check" id="userPw" maxlength="20" placeholder="영어,숫자,특수문자,8~20자" value="" required>
					<div id="userPw_feed" class="invalid-feedback">
	               		비밀번호를 입력해주세요.
					</div>
	            </div>
	
	            <div class="col-sm-6">
					<label for="pwChk" class="form-label" style="font-weight:bold;">비밀번호 확인</label>
					<input type="password" class="form-control check" id="pwChk" placeholder="" value="" maxlength="20" required>
					<div id="pwChk_feed" class="invalid-feedback">
						비밀번호 확인을 입력해주세요.
					</div>
	            </div>
	
	            <div class="col-12">
					<label for="userEmail" class="form-label" style="font-weight:bold;">Email <span class="text-muted"></span></label>
					<input type="email" class="form-control check" id="userEmail" name="userEmail" maxlength="40" placeholder="you@example.com">
					<div id="userEmail_feed" class="invalid-feedback">
						이메일을 입력해 주세요.
					</div>
	            </div>
	            
	            <div class="col-12">
					<label for="age" class="form-label" style="font-weight:bold;" >생년월일 <span class="text-muted"></span></label>
					<input type="text" class="form-control check" name="age" id="age" onkeypress="checkRealTimeNumber()" maxlength="6" placeholder="YYYYMMDD 공백없이 숫자만 입력해주세요.">
					<div id="age_feed" class="invalid-feedback">
						생년월일을 입력해 주세요.
					</div>
	            </div>
	            
	            <div class="col-12">
					<label for="gender" class="form-label" style="font-weight:bold;">성별 <span class="text-muted"></span></label>
	            </div>
	            
	            <div class="col-12" style="margin-top:0;">
			        <div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender" value="M" checked>
						<label class="form-check-label" for="age1">
							남자
						</label>
					</div>
			        <div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender" value="F">
						<label class="form-check-label" for="age2">
							여자
						</label>
					</div>
	            </div>
	          </div>
	
	          <hr class="my-4">
	          <button class="w-100 btn btn-primary btn-lg" id="register" type="button">회원가입</button>
	        </form>
	      </div>
	    </div>
	  </main>
	</div>
</body>
<script type="text/javascript">
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	$(document).ajaxSend(function(e, xhr, options) {
	    xhr.setRequestHeader(header, token);
	});
	
	$(function() {
		
		//생년월일 숫자만 입력
		$('#age').on("keyup", function() {
			$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
		});
		
		//각항목 valid 체크
		$('.check').on('blur', function(){
			validationCheck(this);
	    }); 
		
		//회원가입버튼클릭시
		$('#register').on("click", function(){
			var ajax1, ajax2;  										// ajax 순차실행용 변수; 
			
	        var validFlag = true;									// 통과 플래그

	        if(!validCheck()){										// 빈값 확인
	            validFlag = false;
	        }
	        
	        if(!$('#userPw').hasClass('is-invalid')){		 
		        if(!checkPassword($('#userPw').val())){				// 비밀번호 유효성
		            validFlag = false;
		        }else if($('#userPw').val() != $('#pwChk').val()){
		        	$('#pwChk_feed').text('비밀번호가 일치하지 않습니다.');
	            	$('#pwChk').removeClass('is-valid');	
		            $('#pwChk').addClass('is-invalid');
		        }
	        }else{
	        	validFlag = false;
	        }	
	        if(!$('#userId').hasClass('is-invalid')){
		        if(!checkUserId($('#userId').val())){	 			// 아이디 유효성
		            validFlag = false;
		            $('#userId_feed').text('유효한 아이디를 입력해 주세요.');
                	$('#userId').removeClass('is-valid');	
    	            $('#userId').addClass('is-invalid');
		        }else{
		        	ajax1 = $.ajax({                       			// 아이디 db 조회
				                type: "POST",          
				                url: "/check.id",
				                data : JSON.stringify({userId : $('#userId').val()}),
				                contentType: "application/json; charset=UTF-8",
				                dataType : "json",
				                async: false,
				                success : function(data) {
				                   if(data){
				    					$('#userId_feed').text('이미 사용중인 아이디 입니다.');
				    					$('#userId').removeClass('is-valid');	
				    					$('#userId').addClass('is-invalid');
				    					return true;
				                   }else{
				    					$('#userId_feed').text('');
				    					$('#userId').removeClass('is-invalid');	
				    					$('#userId').addClass('is-valid');
				    					return false;
				                   }
				                },
				                error : function(e) {
				                   console.log("ERROR : ", e);
				                   alert("서버요청실패");
				                }
				           });
		        }
	        }else{
	        	validFlag = false;
	        }
	        if(!$('#userEmail').hasClass('is-invalid')){
		        if(!emailChk($('#userEmail').val())){          		   // 이메일 유효성
		            validFlag = false;
		        }else{
		        	ajax2 = $.ajax({                            	   // 이메일 db 조회
				    	        type: "POST",          
				    	        url: "/check.email",
				    	        data : JSON.stringify({email : $('#userEmail').val()}),
				    	        contentType: "application/json; charset=UTF-8",
				    	        dataType : "json",
				    	        async: false,
				    	        success : function(data) {
				    				if(data){
				    					$('#userEmail_feed').text('이미 사용중인 이메일입니다..');
				    					$('#userEmail').addClass('is-invalid');
				    					$('#userEmail').removeClass('is-valid');
				    					return true;
				    				}else{
				    				  	$('#userEmail_feed').text('');
				    				  	$('#userEmail').addClass('is-valid');
				    				  	$('#userEmail').removeClass('is-invalid');
				    				  	return false;
				    				}
				    	        },
				    	        error : function(e) {
				    	           console.log("ERROR : ", e);
				    	           alert("서버요청실패");
				    	        }
				    	    }); 
		        }
	        }else{
	        	validFlag = false;
	        }
	        
	        if($('.check').hasClass('is-invalid')){        
	            validFlag = false;
	        }
	        
	        $.when(ajax1, ajax2).done(function(){                 	    // db조회 2건 모두 완료시 회원가입 ajax 실행
	        	if(validFlag){
	        		var formData = {
           				userId : $('#userId').val(),
           				userEmail : $('#userEmail').val(),
           				userPw : $('#userPw').val(),
           				gender : $("input:radio[name='gender']:checked").val(),
           				age: $("input[name='age']").val()
           			}
          			
           			$.ajax({
           				type: "post",
           				url: "/register.do",
           				contentType: "application/json; charset=UTF-8",
           				async: false,
           				data: JSON.stringify(formData),
           				success: function(data) {
           					alert("회원가입 완료");
           					location.href="/login";
           				},
           				error : function(e) {
           			        console.log("ERROR : ", e);
           			        alert("서버요청실패");
           		        }
           			});
	        	}
	        });
	    });
		
	});
	
	// 이메일 아이디 가입여부 확인
	var emailIdChk = function(){
		var formData = {
			userId : $('#userId').val(),
			userEmail : $('#userEmail').val(),
		}
		$.ajax({
			type: "post",
			url: "/check.emailId",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify(formData),
			success: function(data) {
				if(data.result1 == 1){
					$('#userId_feed').text('이미 사용중인 아이디 입니다.');
                	$('#userId').removeClass('is-valid');	
    	            $('#userId').addClass('is-invalid');
				}else{
                	$('#userId_feed').text('');
                	$('#userId').removeClass('is-invalid');	
    	            $('#userId').addClass('is-valid');
                }
				if(data.result2 == 1){
					$('#userEmail_feed').text('이미 사용중인 이메일입니다..');
					$('#userEmail').addClass('is-invalid');
					$('#userEmail').removeClass('is-valid');
				}else{
				  	$('#userEmail_feed').text('');
				  	$('#userEmail').addClass('is-valid');
				  	$('#userEmail').removeClass('is-invalid');
				}
				if(data.result1 == 0 && data.result2 == 0){
					var formData = {
	      				userId : $('#userId').val(),
	      				userEmail : $('#userEmail').val(),
	      				userPw : $('#userPw').val(),
	      				gender : $("input:radio[name='gender']:checked").val(),
	      				age: $("input[name='age']").val()
	      			}
	    			
	      			$.ajax({
	      				type: "post",
	      				url: "/register.do",
	      				contentType: "application/json; charset=UTF-8",
	      				data: JSON.stringify(formData),
	      				success: function(data) {
	      					alert("회원가입 완료");
	      					location.href="/login";
	      				},
	      				error : function(e) {
	      			        console.log("ERROR : ", e);
	      			        alert("서버요청실패");
	      		        }
	      			});
				}
				
			},
			error : function(e) {
		        console.log("ERROR : ", e);
		        alert("서버요청실패");
	        }
		});
	}
	
	/* blur 유효성체크 */
	var validationCheck = function(target){
	    if(!validCheck2(target)){
	        return;
	    }else if($(target).is('#userId')){
	        if(!checkUserId($(target).val())){
	            $('#userId_feed').text('유효한 아이디를 입력해 주세요.');
	            $('#userId').removeClass('is-valid');	
	            $('#userId').addClass('is-invalid');
	        }else{
	        	$('#userId_feed').text('');
	        	$('#userId').removeClass('is-invalid');	     
	        	
	            $.ajax({             
	                 type: "POST",          
	                 url: "/check.id",
	                 data : JSON.stringify({userId : $('#userId').val()}),
	                 contentType: "application/json; charset=UTF-8",
	                 dataType : "json",
	                 success : function(data) {
	                    if(data){
	                    	$('#userId_feed').text('이미 사용중인 아이디 입니다.');
	                    	$('#userId').removeClass('is-valid');	
	        	            $('#userId').addClass('is-invalid');
	                    }else{
	                    	$('#userId_feed').text('');
	                    	$('#userId').removeClass('is-invalid');	
	        	            $('#userId').addClass('is-valid');
	                    }
	                 },
	                 error : function(e) {
	                    console.log("ERROR : ", e);
	                    alert("서버요청실패");
	                 }
	            });
	        }
	    }else if($(target).is('#userPw')){
	        checkPassword($(target).val());
	        if($('#pwChk').val() != '' && $('#pwChk').val() != $(target).val()){
	        	$('#pwChk_feed').text('비밀번호가 일치하지 않습니다.');
            	$('#pwChk').removeClass('is-valid');	
	            $('#pwChk').addClass('is-invalid');
	            return;
	        }else if($('#pwChk').val() == $(target).val()){
	        	$('#pwChk_feed').text('');
            	$('#pwChk').addClass('is-valid');	
	            $('#pwChk').removeClass('is-invalid');
	        	$('#userPw_feed').text('');
            	$('#userPw').addClass('is-valid');	
	            $('#userPw').removeClass('is-invalid');
	        }
	    }else if($(target).is('#pwChk')){
	        if($('#userPw').val() != $(target).val()){
	        	$('#pwChk_feed').text('비밀번호가 일치하지 않습니다.');
            	$('#pwChk').removeClass('is-valid');	
	            $('#pwChk').addClass('is-invalid');
	            return;
	        }else{
	        	$('#pwChk_feed').text('');
            	$('#pwChk').addClass('is-valid');	
	            $('#pwChk').removeClass('is-invalid');
	        }
	    }else if($(target).is(('#userEmail'))){
	        if(!emailChk($('#userEmail').val())){
	            return;
	        }else{
	        	emailValid();
	        }
	    }
	};
	
	//아이디 유효성 검사 함수
	var checkUserId = function(userId){
	 if(!/^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}$/.test(userId)){   
	        return false;
	    }else if(/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/ ]/.test(userId)){
	        return false;
	    }else{
	        return true;
	    }
	}
	
	//비밀번호 유효성검사 함수
    var checkPassword = function(password){
        if(!/^(?=.*[a-zA-Z])(?=.*[@$!%*^#&])(?=.*[0-9]).{8,20}$/.test(password)){
        	$('#userPw_feed').text('영문,숫자,특수문자,6~20자');
        	$('#userPw').removeClass('is-valid');	
            $('#userPw').addClass('is-invalid');
            
            return false;
            
        }else if((/[\s]/g).test(password)){
        	$('#userPw_feed').text('영문,숫자,특수문자,6~20자');
        	$('#userPw').removeClass('is-valid');	
            $('#userPw').addClass('is-invalid');
            
            return false;
            
        }else{
        	$('#userPw_feed').text('');
        	$('#userPw').addClass('is-valid');	
            $('#userPw').removeClass('is-invalid');
            return true;
        } 
    }
	
	// 이메일 유효성
	var emailChk = function(email){
	    var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	    if(!exptext.test(email)){
		  	$('#userEmail_feed').text('올바른 이메일 형식을 입력하세요.');
		  	$('#userEmail').addClass('is-invalid');
		  	$('#userEmail').removeClass('is-valid');
	        return false;
	    }else{
		  	$('#userEmail_feed').text('');
		  	$('#userEmail').addClass('is-valid');
		  	$('#userEmail').removeClass('is-invalid');
	    	return true;
	    }
	}
	
	// 이메일 사용여부 체크
	var emailValid = function(){
	    $.ajax({          
	        type: "POST",          
	        url: "/check.email",
	        data : JSON.stringify({email : $('#userEmail').val()}),
	        contentType: "application/json; charset=UTF-8",
	        dataType : "json",
	        success : function(data) {
				if(data){
					$('#userEmail_feed').text('이미 사용중인 이메일입니다..');
					$('#userEmail').addClass('is-invalid');
					$('#userEmail').removeClass('is-valid');
					return true;
				}else{
				  	$('#userEmail_feed').text('');
				  	$('#userEmail').addClass('is-valid');
				  	$('#userEmail').removeClass('is-invalid');
				  	return false;
				}
	        },
	        error : function(e) {
	           console.log("ERROR : ", e);
	           alert("서버요청실패");
	        }
	    }); 
	}
	
	
	var idValid = function(){
		$.ajax({             
            type: "POST",          
            url: "/check.id",
            data : JSON.stringify({userId : $('#userId').val()}),
            contentType: "application/json; charset=UTF-8",
            dataType : "json",
            success : function(data) {
               if(data){
					$('#userId_feed').text('이미 사용중인 아이디 입니다.');
					$('#userId').removeClass('is-valid');	
					$('#userId').addClass('is-invalid');
					return true;
               }else{
					$('#userId_feed').text('');
					$('#userId').removeClass('is-invalid');	
					$('#userId').addClass('is-valid');
					return false;
               }
            },
            error : function(e) {
               console.log("ERROR : ", e);
               alert("서버요청실패");
            }
       });
	}
	
	
	//키를 누룰때 숫자만 입력가능(onkeypress)
	var checkRealTimeNumber = function() {     
	    var str = String.fromCharCode(event.keyCode);
	/*
	    var f = obj.form;   
	    var strValue = obj.value;       
	    if(Number(strValue)+"" =="NaN"){                
	        obj.value = strValue.substring(0, strValue.length-1);
	    }           
	*/
	    if(str==""){
	        return true;
	    }
	    if(str>"9"||str<"0"){
	        event.returnValue=false;
	    }
	}
	
	//input 전체 빈값 체크
	var validCheck = function(){
		var flag = '';
		var flag2 = true;
		
		$('.check').each(function(){
			flag = true;
			var value = '';
			var errorCode = "";
			errorCode = $(this).attr("id");
			
			if($(this).attr('type') == 'radio'){
			   value = $('input[name=\"' + $(this).attr('name') + '\"]:checked').val();
			}else{
			   value = $(this).val().trim();
			}
			
			if(value == ''){   
			    flag = false;
			    flag2 = false;
			}
			
			if(!flag){
				$(this).removeClass('is-valid');
				$(this).addClass('is-invalid');
				$('#'+ errorCode + '_feed').text('값을 입력해 주세요.');
				
				if(errorCode == 'userPw'){
					$('#pwChk_feed').text('비밀번호가 일치하지 않습니다.');
					$('#pwChk').removeClass('is-valid');
					$('#pwChk').addClass('is-invalid');
				}
				
			}else{
				$('#'+ errorCode + '_feed').text('');
		    	$(this).addClass('is-valid');
		        $(this).removeClass('is-invalid');
			}
	   });
	   
	   if(!flag2){
	       return false;
	   }else{
	       return true;
	   }
	}
	
	//유효성검사2
	var validCheck2 = function(obj){
	    flag = true;
	    var value = '';
	    var errorCode = '';
	    errorCode = $(obj).attr("id");
	    
	    if($(this).attr('type') == 'radio'){
	       value = $('input[name=\"' + $(obj).attr('name') + '\"]:checked').val();
	    }else if(typeof $(obj).val() === 'string'){
	       value = $(obj).val().trim();
	    }
	    if(value == ''){   
	        flag = false;
	    }
	    
	    if(!flag){
	    	$(obj).removeClass('is-valid');
	        $(obj).addClass('is-invalid');
	        $('#'+ errorCode + '_feed').text('값을 입력해 주세요.');
	        if(errorCode == 'userPw'){
	        	$('#pwChk_feed').text('비밀번호가 일치하지 않습니다.');
	        	$('#pwChk').removeClass('is-valid');
	        	$('#pwChk').addClass('is-invalid');
	        }
	        return false;
	    }else{
	    	$('#'+ errorCode + '_feed').text('');
	    	$(obj).addClass('is-valid');
	        $(obj).removeClass('is-invalid');
	        return true;
	    }
	}
	
	
	
	
</script>
</html>
