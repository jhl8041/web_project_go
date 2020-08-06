<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>회원정보 수정</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/member/MyInfo.js" charset="utf-8"></script>
	
	
</head>
<body>
	<div class="d-flex justify-content-center">
		<form action="${pageContext.request.contextPath}/EditMyInfoController" method=post name=form id=form onsubmit="return formCheck()">
			<div class="form-group" style="text-align:center;margin-top:10%">
				<h1>회원정보 수정</h1>
			</div>
			<div class="form-group">
				<label>아이디</label>
				<input type=text class="form-control" value="${userinfo.id}" name=id id=id readonly>				
		  	</div>
		  	<div class="form-group">
				<label>비밀번호</label>
				<input type=password class="form-control" placeholder="변경할 비밀번호를 입력하세요" maxlength=20 name=pwd id=pwd oninput='pwdCheck()'>
				<div class="alert alert-danger collapse" role="alert" style="width:300px" id=alertpwd>
					<span id="pwdcheck"></span>
				</div>
		  	</div>
			<div class="form-group">
				<label>비밀번호 확인</label>
				<input type=password class="form-control" placeholder="변경할 비밀번호를 재입력하세요" maxlength=20 name=pwd2 id=pwd2 oninput='pwdMatchCheck()'>
				<div class="alert alert-danger collapse" role="alert" style="width:300px" id=alertpwd2>
					<span id="pwdmatchcheck"></span>
				</div>	
			</div>
			<div class="form-group">
				<label>이름</label>
				<input type=text class="form-control" value="${userinfo.name}" name=name id=name>
			</div>
			<div class="form-group">
				<label>닉네임</label>
				<input type=text class="form-control" value="${userinfo.nickname}" name=nickname id=nickname oninput="nicknameCheck()">
				<div class="alert alert-danger collapse" role="alert" style=width:300px id=alertnickname>
					<span id="nicknamecheck"></span>
				</div>
			</div>
			<div class="form-group">
				<label>생년월일</label>
				<input type=text class="form-control" name=birthdate value="${userinfo.birthdate}" readonly>
			</div>
			<div class="form-group">
				<label>성별</label>
				<select class="form-control" name=gender id=gender>
					<option>남</option>
					<option>여</option>
				</select>
			</div>
			<div class="form-group">
				<label>주소</label>
				<input class="form-control" type=text value="${userinfo.address}" name=addr id=addr readonly>
				<input class="btn btn-primary" type=button value=주소검색 onclick="goPopup()">
			</div>
			<div class="form-group">
				<label>휴대폰번호</label>
				<input class="form-control" type=text name=phone id=phone value="${userinfo.phone}" oninput='phoneCheck()'>
			</div>
			<div class="form-group">
				<label>이메일</label>
				<div class="form-inline">
					<input class="form-control" type=text name=email id=email value="${userinfo.email}" readonly>
				</div>
			</div>
			<div class="form-group">
				<label><b>분류</b></label> 
				<div class="form-check" style="padding-left:0px">
					<div class="form-inline">
				  		<input class="form-check-input" type="checkbox" value="8" id="noneng" name="noneng">
				 		<label class="form-check-label" for="noneng">문과</label>
				  
				  		<input class="form-check-input" style="margin-left:20px" type="checkbox" value="4" id="eng" name="eng">
				  		<label class="form-check-label" for="eng">이과</label>
				  	</div>
				  	<div class="form-inline">
				  		<input class="form-check-input" type="checkbox" value="2" id="capital" name="capital">
				 		<label class="form-check-label" for="capital">수도</label>
				  
				  		<input class="form-check-input" style="margin-left:20px" type="checkbox" name="noncapital" value="1" id="noncapital">
				  		<label class="form-check-label" for="noncapital">비수도</label>
				  	</div>
				</div>
			</div>
			<div class="form-group">	
				<input class="btn btn-primary btn-lg btn-block" style=width:300px type=submit value=회원정보수정>
			</div>
			<div class="form-group">	
				<input class="btn btn-primary btn-lg btn-block" style=width:300px type=button value=회원탈퇴 onclick="location.href='/project_J/DelMemberController?id=${userinfo.id}'">
			</div>
			<div class="form-group">	
				<input class="btn btn-primary btn-lg btn-block" style=width:300px type=button value=돌아가기 onclick="location.href='/project_J/ListPostController'">
			</div>
		</form>
	</div>
	
	<script>
		$("#gender").val("${userinfo.gender}").attr("selected","selected");
	
		var code = "${userinfo.prefCode}";
		var typeStr = code.split("");
		if (typeStr[0] == "1") 
			$("#eng").prop('checked', true);
		else 
			$("#eng").prop('checked', false);
		
		if (typeStr[1] == "1"){
			$("#noneng").prop("checked", true);
		}
		else 
			$("#noneng").prop("checked", false);
		
		if (typeStr[2] == "1") 
			$("#capital").prop("checked", true);
		else 
			$("#capital").prop("checked", false);
		
		if (typeStr[3] == "1") 
			$("#noncapital").prop("checked", true);
		else 
			$("#noncapital").prop("checked", false);
	</script>
</body>
</html>