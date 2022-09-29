<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<head>
    <meta charset="UTF-8">
</head>
<body>
<form method="post" action="/signUp">
    <div class="container">
        <h1>회원가입</h1>
        <div class="form-group">
            <label for="userId">아이디</label>
            <input type="text" class="form-control" id="userId" name="userId" placeholder="사용자 아이디">
        </div>
        <div class="form-group">
            <label for="userEmail">이메일</label>
            <input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="사용자 이메일">
        </div>
        <div class="form-group">
            <label for="userPassword">비밀번호</label>
            <input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="사용자 비밀번호">
        </div>
        
        <div class="form-group">
            <label for="userPassword">비밀번호 확인</label>
            <input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="비밀번호 확인">
        </div>
        
        <div class="form-group">
            <label for="userPassword">성별</label>
            <input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="비밀번호 확인">
        </div>
        
        <div class="form-group">
            <label for="userPassword">나이</label>
            <input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="비밀번호 확인">
        </div>
        
        <button type="submit" class="btn btn-primary">가입 완료</button>
    </div>
</form>
</body>
</html>