<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>ȸ������</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/member/JoinForm.js" charset="utf-8"></script>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	
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
				<form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="${pageContext.request.contextPath}/JoinController" method=post name=form id=form  onsubmit="return formCheck()">
					<span class="login100-form-title">
						ȸ������
					</span>
					
					<div class="form-group">
						<label>���̵�</label>
						<input type=text class="form-control" placeholder="���̵� �Է��ϼ���" name=id id=id oninput='idCheck()'>				
						<div class="alert alert-danger collapse" role="alert" style=width:300px id=alertid>
							<span id="idcheck"></span>
						</div>
				  	</div>
				  	
				  	<div class="form-group">
						<label>��й�ȣ</label>
						<input type=password class="form-control" placeholder="��й�ȣ�� �Է��ϼ���" maxlength=20 name=pwd id=pwd oninput='pwdCheck()'>
						<div class="alert alert-danger collapse" role="alert" style="width:300px" id=alertpwd>
							<span id="pwdcheck"></span>
						</div>
				  	</div>
					<div class="form-group">
						<label>��й�ȣ Ȯ��</label>
						<input type=password class="form-control" placeholder="��й�ȣ�� ���Է��ϼ���" maxlength=20 name=pwd2 id=pwd2 oninput='pwdMatchCheck()'>
						<div class="alert alert-danger collapse" role="alert" style="width:300px" id=alertpwd2>
							<span id="pwdmatchcheck"></span>
						</div>	
					</div>
					<div class="form-group">
						<label>�̸�</label>
						<input type=text class="form-control" placeholder="�̸��� �Է��ϼ���" name=name id=name>
					</div>
					<div class="form-group">
						<label>�г���</label>
						<input type=text class="form-control" placeholder="�г����� �Է��ϼ���" name=nickname id=nickname oninput="nicknameCheck()">
						<div class="alert alert-danger collapse" role="alert" style=width:300px id=alertnickname>
							<span id="nicknamecheck"></span>
						</div>
					</div>
					<div class="form-group">
						<label>�������</label>
						<div class="form-inline">
							<select class="form-control" style=width:90px name=birthyear>
								<c:forEach var="i" begin="0" end="120"><option>${2020-i}</option></c:forEach>	
							</select>
							<label>��</label>
							<select class="form-control" style=width:80px name=birthmonth>
								<c:forEach var="i" begin="1" end="12"><option>${i}</option></c:forEach>
							</select> 
							<label>��</label>
							<select class="form-control" style=width:80px name=birthday>
								<c:forEach var="i" begin="1" end="31"><option>${i}</option></c:forEach>
							</select>
							<label>��</label>
						</div>
					</div>
					<div class="form-group">
						<label>����</label>
						<select class="form-control" name=gender>
							<option>��</option>
							<option>��</option>
						</select>
					</div>
					<div class="form-group">
						<label>�ּ�</label>
						<div class="form-inline">
							<input class="form-control" type=text name=roadAddrPart1 id=roadAddrPart1 readonly>
							<input class="btn btn-primary" type=button value=�ּҰ˻� onclick="goPopup()">
						</div>
					</div>
					<div class="form-group">
						<label>���ּ�</label>
						<input class="form-control" type=text name="addrDetail" id="addrDetail" readonly>
					</div>
					<div class="form-group">
						<label>�޴�����ȣ</label>
						<input class="form-control" type=text name=phone id=phone placeholder="���ڷθ� �Է����ּ���" oninput='phoneCheck()'>
					</div>
					<div class="form-group">
						<label>�̸���</label>
						<div class="form-inline">
							<input class="form-control" type=text name=email id=email placeholder="�̸��� �Է�" oninput="emailCh()">
							<input class="btn btn-primary" type="button" id="emailbutton" value="�����ڵ�����" onclick='sendCode();' disabled>
						</div>
						<div class="alert alert-danger collapse" role="alert" style=width:230px id=alertemail>
							<span id="emailcheck"></span>
						</div>
					</div>
					<div class="form-group">
						<label>������ȣ</label>
						<div class="form-inline">
							<input class="form-control" type=text placeholder="������ȣ�Է�" id=code>
							<input class="btn btn-primary" type="button" value="Ȯ��" onclick='codeCheck()'>
						</div>
						<div class="alert alert-danger collapse" role="alert" style="width:300px" id=alertcode>
							<span id="codetimer"></span>
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
						 		<label class="form-check-label" for="noneng">����</label>
						  
						  		<input class="form-check-input" style="margin-left:20px" type="checkbox" name="noncapital" value="1" id="noncapital">
						  		<label class="form-check-label" for="eng">�����</label>
						  	</div>
						</div>
					</div>
					<div class="container-login100-form-btn">	
						<input class="login100-form-btn" type=submit value=ȸ������>
					</div>
					<div class="container-login100-form-btn">	
						<input class="login100-form-btn" style="margin-top:10px" type=button value=�α���ȭ������ onclick="location.href='${pageContext.request.contextPath}/member/LoginForm.jsp'">
					</div>
			
					
				</form>
			</div>
		</div>
	</div>
	
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/member/loginstyle/vendor/jquery/jquery-3.2.1.min.js"></script>
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