<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
</head>
<body>
<div class="d-flex justify-content-center">
		<form action="${pageContext.request.contextPath}/AdminLoginController" method=post name=form id=form>
			<div class="form-group">
				<h1>관리자로그인</h1>
			</div>
			<div class="form-group">
				<label>아이디</label>
				<input type=text class="form-control" placeholder="아이디를 입력하세요" name=id id=id>				
		  	</div>
		  	<div class="form-group">
				<label>비밀번호</label>
				<input type=password class="form-control" placeholder="비밀번호를 입력하세요" maxlength=20 name=pwd id=pwd>
		  	</div>
		  	<div class="form-group">
		  		<input class="btn btn-primary btn-lg btn-block" style=width:300px type=submit value=관리자로그인>
		  	</div>
		  	
	  	</form>
</div>
</body>
</html>