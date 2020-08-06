<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script>
function del(seq){
	location.href="${pageContext.request.contextPath}/DelBoardController?seq="+seq;
}
function edit(seq){
	location.href="${pageContext.request.contextPath }/EditBoardController?seq="+seq;
}	

</script>

<style type="text/css">
html,body{
	font-style:italic;
	width:100%;
	height:100%;
}
table{
	width:1000px;
	margin:Auto; 
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
<!-- el로 세션 아이디에 따른 readonly 부여하고싶을때
	<c:set var="str">
		<c:if test="${sessionScope.id != b.board_user_id }">
			readonly
		</c:if>
	</c:set>
 -->
	<table border="1" >
		<tr height ="100"> 
			<td colspan="2">분류<font size="15pt">${b.board_code }</font></td>
			<td colspan="2" align="bottom" align="right">글번호:${b.board_seq }</td>
		</tr>
		<tr height ="150">
			<td colspan=4 height ="150"><input type="text" value="${b.board_title }" name="title" style="width:100%; height:100%;"></td>
		</tr>
		<tr height = "70">
			<td colspan="4">작성자: ${b.board_writer }</td>
		</tr>
		<tr height = "70">
			<td colspan="1">조회수: ${b.board_view }</td>
			<td colspan="1">추천수: ${b.board_like-b.board_unlike }</td>
			<td colspan="2">작성시간: ${b.board_sysdate }</td>
		</tr>
		<tr height ="300">
			<td colspan="4" height="300"><textarea name="board_content" style="width:100%; height:100%;" value="${b.board_content }"> </textarea></td>
		</tr>
		<tr height ="100">
			<td colspan="4" align="right"><input type="button" value="수정" onclick="edit(${b.board_seq})">&nbsp;&nbsp;&nbsp;
			<input type="button" value="삭제" onclick="del(${b.board_seq})"></td>
		</tr>
	</table>
</div>	
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
</body>
</html>