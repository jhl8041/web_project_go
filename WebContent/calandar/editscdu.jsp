<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form name="f" action="${pageContext.request.contextPath }/JoinController" method="post">
<table border="1">
<tr>
<td>��¥</td><td><input type="text" name="day">
</td>
</tr>
<tr>
<td>������</td><td><input type="password" name="pwd"></td>
</tr>
<tr>
<td>������ ����</td><td><input type="text" name="name"></td>
</tr>
<tr>
<td>������ ����</td><td><input type="text" name="email"></td>
</tr>

<tr>
<td colspan="2"><input type="submit" value="����">
<input type="reset" value="���">
</td>
</tr>
</table>
</form>
</body>
</html>