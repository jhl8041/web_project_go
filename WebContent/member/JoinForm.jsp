<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Insert title here</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/member/JoinForm.js" charset="utf-8"></script>
</head>
<body>
	<div class="d-flex justify-content-center">
		<form action="${pageContext.request.contextPath}/JoinController" method=post name=form id=form onsubmit="return formCheck()">
			<div class="form-group" style="text-align:center;margin-top:10%">
				<h1>ȸ������</h1>
			</div>
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
			<div class="form-group">	
				<input class="btn btn-primary btn-lg btn-block" style=width:300px type=submit value=ȸ������>
			</div>
			<div class="form-group">	
				<input class="btn btn-primary btn-lg btn-block" style=width:300px type=button value=�α���ȭ������ onclick="location.href='${pageContext.request.contextPath}/member/LoginForm.jsp'">
			</div>
		</form>
	</div>
</body>
</html>