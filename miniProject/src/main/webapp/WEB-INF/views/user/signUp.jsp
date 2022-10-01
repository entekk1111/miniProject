<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
	<form id="regiForm">
	    <div class="container">
	        <h1>회원가입</h1>
	        <div class="form-group">
	            <label for="userId">아이디</label>
	            <input type="text" class="form-control" id="userId" name="userId" placeholder="사용자 아이디" >
	        </div>
	        <div class="form-group">
	            <label for="userEmail">이메일</label>
	            <input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="사용자 이메일">
	        </div>
	        <div class="form-group">
	            <label for="userPassword">비밀번호</label>
	            <input type="password" class="form-control" id="userPw" name="userPw" placeholder="사용자 비밀번호">
	        </div>
	        
	        <div class="form-group">
	            <label for="userPassword">비밀번호 확인</label>
	            <input type="password" class="form-control" id="pwChk" name="pwChk" placeholder="비밀번호 확인">
	        </div>
	        <div class="form-group">
		        <div class="form-check">
					<input class="form-check-input" type="radio" name="gender" value="M" checked>
					<label class="form-check-label" for="flexRadioDefault1">
						남자
					</label>
				</div>
		        <div class="form-check">
					<input class="form-check-input" type="radio" name="gender" value="F">
					<label class="form-check-label" for="age2">
						여자
					</label>
				</div>
	        </div>
	        
	        <div class="form-group">
		        <div class="form-check">
					<input class="form-check-input" type="radio" name="age" id="age" value="10">
					<label class="form-check-label" for="flexRadioDefault1">
						10대
					</label>
				</div>
		        <div class="form-check">
					<input class="form-check-input" type="radio" name="age" id="age2" value="20" checked>
					<label class="form-check-label" for="age2">
						20대
					</label>
				</div>
		        <div class="form-check">
					<input class="form-check-input" type="radio" name="age" id="age3" value="30">
					<label class="form-check-label" for="age3">
						30대
					</label>
				</div>
				
				<div class="form-check">
					<input class="form-check-input" type="radio" name="age" id="age4" value="O">
					<label class="form-check-label" for="age4">
						40대 이상
					</label>
				</div>
			</div>
	        
	        <button type="button" id="register" class="btn btn-primary">가입 완료</button>
	    </div>
	</form>
<!-- </body> -->

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
