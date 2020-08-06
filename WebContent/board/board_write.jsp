<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
html,body{
	font-style:italic;
	width:100%;
	height:100%;
}
table{
	width:1000px;
	margin:auto; 
	font-size:15pt;
}
#left_menu{
	width:150pt;
	height:100%;
	background-color:red;
	float:left;
	overflow:auto;
}
#blank{
	width:10pt;
	height:100%;
	background-color:white;
	float:left;
	overflow:auto;
}
#contents{
	width:1050pt;
	height:100%;
	background-color:white;
	float:left;
	overflow:auto;
}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>
<div id="left_menu"></div>
<div id="blank"></div>
<div id="contents">
	<form action="${pageContext.request.contextPath }/WriteController?board_code=${board_code}" method="post">
		<table border="1" >
			<tr>
				<td align="left">게시판 분류:
					<font size="10pt">
						<c:if test="${board_code eq 'a'}">수도권</c:if>
						<c:if test="${board_code eq 'b'}">바수도권</c:if>
						<c:if test="${board_code eq 'c'}">문과</c:if>
						<c:if test="${board_code eq 'd'}">이과</c:if>
						<c:if test="${board_code eq 'e'}">자유게시판</c:if>
					</font>
				</td>
			</tr>
			<tr height = "70">
				<td colspan="4">작성자: ${sessionScope.member_nickname }</td>
			</tr>
			<tr height ="150">
				<td height ="150"><input type="text" name="board_title" value="제목" style="width:100%; height:100%;font-size:20pt;"></td>
			</tr>
			<tr height ="300">
				<td height ="300"><textarea name="board_content" style="width:100%; height:100%;font-size:15pt;" >내용</textarea></td>
			</tr>
				<tr height ="100">
					<td colspan="4" align="right"><input type="submit" style="font-size:15;" value="작성 완료"></td>
				</tr>
		</table>
	</form>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>	
</body>
</html>