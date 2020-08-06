<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

<script charset="utf-8">
function idResult(){
    var emailStr = $("#email").val();
    var nameStr = $("#name").val();
    var birthyearStr = $("#birthyear").val();
    var birthmonthStr = $("#birthmonth").val();
    var birthdayStr = $("#birthday").val();
    
    $.ajax({
        url : "FindLostIdController",
        type : "POST",
        data : {email:emailStr, name:nameStr, birthyear:birthyearStr,
        		birthmonth:birthmonthStr, birthday:birthdayStr},
        success : function(data){ 
        	if(data == "fail"){
        		document.getElementById("alertlostid").className="alert alert-danger";
        		$("#alertlostid").show();
        		$("#lostid").text("정보와 일치하는 계정이 존재하지 않습니다");
        	}
        	else{
        		document.getElementById("alertlostid").className="alert alert-success";
        		$("#alertlostid").show();  		
        		$("#lostid").text("회원님의 아이디는 "+data+" 입니다");
        	}
        	
        }
    });
}
</script>
</head>
<body>
<div class="d-flex justify-content-center">
	<form action="${pageContext.request.contextPath}/LoginController" method=post name=form id=form>
		<div class="form-group" style="text-align:center;margin-top:40%">
			<h1>아이디 찾기</h1>
		</div>
		<div class="form-group">
			<label>이메일</label>
			<input type=text class="form-control" placeholder="이메일을 입력하세요" name=email id=email>				
	  	</div>
	  	<div class="form-group">
			<label>이름</label>
			<input type=text class="form-control" placeholder="이름을 입력하세요" maxlength=20 name=name id=name>
	  	</div>
	  	<div class="form-group">
			<label>생년월일</label>
			<div class="form-inline">
				<select class="form-control" style=width:90px name=birthyear id=birthyear>
					<c:forEach var="i" begin="0" end="120"><option>${2020-i}</option></c:forEach>	
				</select>
				<label>년</label>
				<select class="form-control" style=width:80px name=birthmonth id=birthmonth>
					<c:forEach var="i" begin="1" end="12"><option>${i}</option></c:forEach>
				</select> 
				<label>월</label>
				<select class="form-control" style=width:80px name=birthday id=birthday>
					<c:forEach var="i" begin="1" end="31"><option>${i}</option></c:forEach>
				</select>
				<label>일</label>
			</div>
	  	</div>
	  	<div class="alert alert-danger collapse" role="alert" style=width:300px id=alertlostid>
			<span id="lostid"></span>
		</div>
	  	<div class="form-group">
	  		<input class="btn btn-success btn-lg btn-block" style=width:300px type=button value=아이디검색 onclick="idResult()">
	  	</div>
	  	<div class="form-group">
	  		<input class="btn btn-primary btn-lg btn-block" style=width:300px type=button value="비밀번호 재설정" onclick="location.href='${pageContext.request.contextPath}/ResetPwd.jsp'">
	  	</div>
	  	<div class="form-group">
	  		<input class="btn btn-primary btn-lg btn-block" style=width:300px type=button value="로그인화면으로" onclick="location.href='${pageContext.request.contextPath}/LoginForm.jsp'">
	  	</div>
	  	
  	</form>
</div>
</body>
</html>