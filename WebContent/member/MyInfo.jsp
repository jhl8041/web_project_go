<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>�� ���� ����</title>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/member/MyInfo.js" charset="utf-8"></script>

<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/member/loginstyle/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/member/loginstyle/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/member/loginstyle/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/member/loginstyle/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/member/loginstyle/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/member/loginstyle/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/member/loginstyle/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/member/loginstyle/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/member/loginstyle/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/member/loginstyle/css/main.css">
<!--===============================================================================================-->

</head>

<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="${pageContext.request.contextPath}/EditMyInfoController" method=post name=form id=form onsubmit="return formCheck()">
					<span class="login100-form-title">
						ȸ������ ����
					</span>

					<div class="form-group">
						<label>���̵�</label>
						<input type=text class="form-control" value="${userinfo.id}" name=id id=id readonly>				
				  	</div>
				  	<div class="form-group">
						<label>��й�ȣ</label>
						<input type=password class="form-control" placeholder="������ ��й�ȣ�� �Է��ϼ���" maxlength=20 name=pwd id=pwd oninput='pwdCheck()'>
						<div class="alert alert-danger collapse" role="alert" style="width:300px" id=alertpwd>
							<span id="pwdcheck"></span>
						</div>
				  	</div>
					<div class="form-group">
						<label>��й�ȣ Ȯ��</label>
						<input type=password class="form-control" placeholder="������ ��й�ȣ�� ���Է��ϼ���" maxlength=20 name=pwd2 id=pwd2 oninput='pwdMatchCheck()'>
						<div class="alert alert-danger collapse" role="alert" style="width:300px" id=alertpwd2>
							<span id="pwdmatchcheck"></span>
						</div>	
					</div>
					<div class="form-group">
						<label>�̸�</label>
						<input type=text class="form-control" value="${userinfo.name}" name=name id=name>
					</div>
					<div class="form-group">
						<label>�г���</label>
						<input type=text class="form-control" value="${userinfo.nickname}" name=nickname id=nickname oninput="nicknameCheck()">
						<div class="alert alert-danger collapse" role="alert" style=width:300px id=alertnickname>
							<span id="nicknamecheck"></span>
						</div>
					</div>
					<div class="form-group">
						<label>�������</label>
						<input type=text class="form-control" name=birthdate value="${userinfo.birthdate}" readonly>
					</div>
					<div class="form-group">
						<label>����</label>
						<select class="form-control" name=gender id=gender>
							<option>��</option>
							<option>��</option>
						</select>
					</div>
					<div class="form-group">
						<label>�ּ�</label>
						<input class="form-control" type=text value="${userinfo.address}" name=addr id=addr readonly>
						<input class="btn btn-primary" type=button value=�ּҰ˻� onclick="goPopup()">
					</div>
					<div class="form-group">
						<label>�޴�����ȣ</label>
						<input class="form-control" type=text name=phone id=phone value="${userinfo.phone}" oninput='phoneCheck()'>
					</div>
					<div class="form-group">
						<label>�̸���</label>
						<div class="form-inline">
							<input class="form-control" type=text name=email id=email value="${userinfo.email}" readonly>
						</div>
					</div>
					<div class="form-group">
						<label><b>�з�</b></label> 
						<div class="form-check" style="padding-left:0px">
							<div class="form-inline">
						  		<input class="form-check-input" type="checkbox" value="8" id="noneng" name="noneng">
						 		<label class="form-check-label" for="noneng">����</label>
						  
						  		<input class="form-check-input" style="margin-left:20px" type="checkbox" value="4" id="eng" name="eng">
						  		<label class="form-check-label" for="eng">�̰�</label>
						  	</div>
						  	<div class="form-inline">
						  		<input class="form-check-input" type="checkbox" value="2" id="capital" name="capital">
						 		<label class="form-check-label" for="capital">����</label>
						  
						  		<input class="form-check-input" style="margin-left:20px" type="checkbox" name="noncapital" value="1" id="noncapital">
						  		<label class="form-check-label" for="noncapital">�����</label>
						  	</div>
						</div>
					</div>
					<div class="container-login100-form-btn">	
						<input class="login100-form-btn" style="margin-top:10px" type=submit value=ȸ����������>
					</div>
					<div class="container-login100-form-btn">	
						<input class="login100-form-btn" style="margin-top:10px" type=button value=ȸ��Ż�� onclick="location.href='/project_J/DelMemberController?id=${userinfo.id}'">
					</div>
					<div class="container-login100-form-btn">	
						<input class="login100-form-btn" style="margin-top:10px;margin-bottom:30px" type=button value=���ư��� onclick="location.href='/project_J/ListPostController?id=0'">
					</div>

				</form>
			</div>
		</div>
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

<!--===============================================================================================-->
<%-- 	<script src="${pageContext.request.contextPath}/member/loginstyle/vendor/jquery/jquery-3.2.1.min.js"></script> --%>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/member/loginstyle/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/member/loginstyle/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/member/loginstyle/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/member/loginstyle/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/member/loginstyle/vendor/daterangepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/member/loginstyle/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/member/loginstyle/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/member/loginstyle/js/main.js"></script>

</body>
</html>