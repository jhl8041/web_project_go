<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
function board_del(seq){
	location.href="${pageContext.request.contextPath}/DelBoardController?seq="+seq;
}	
function board_like(seq,like){
	location.href="${pageContext.request.contextPath }/UpdateLikeBoardController?seq="+seq+"&like="+like;
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
<div id="left_menu">&nbsp;</div>
<div id="blank">&nbsp;</div>
<div id="contents">
	<table class="table"><tr><td>
		<a href="${pageContext.request.contextPath }/ListController?board_code=${b.board_code }&pageNum=1">�� ���</a>
	</td></tr></table>
	<table class="table" >
		<tr height ="100"> 
			<td colspan="2">�з�
				<font size="15pt">
					<c:if test="${b.board_code eq 'a'}">������</c:if>
					<c:if test="${b.board_code eq 'b'}">�ټ�����</c:if>
					<c:if test="${b.board_code eq 'c'}">����</c:if>
					<c:if test="${b.board_code eq 'd'}">�̰�</c:if>
					<c:if test="${b.board_code eq 'e'}">�����Խ���</c:if>
				</font>
			</td> 
			<td colspan="2" align="right">�۹�ȣ:${b.board_seq }</td>
		</tr>
		<tr height ="150">
			<td colspan=4>����<font size = "15pt">${b.board_title }</font></td>
		</tr>
		<tr height = "70">
			<td colspan="4">�ۼ���: ${b.board_writer }</td>
		</tr>
		<tr height = "70" >
			<td colspan="1">��ȸ��: ${b.board_view }</td>
			<td colspan="1">��õ��: ${b.board_like-b.board_unlike }</td>
			<td colspan="2">�ۼ��ð�: ${b.board_sysdate }</td>
		</tr>
		<tr height ="300">
			<td colspan="4" height="300"><textarea class="textarea" name="content" style="width:100%;height:100%;" readonly>${b.board_content}</textarea></td>
		</tr>
		<tr height ="100">
			<td> <input type="button" value="���ƿ�" onclick="board_like(${b.board_seq},true)">${b.board_like}��</td>
			<td> <input type="button" value="�Ⱦ��" onclick="board_like(${b.board_seq},false)">${b.board_unlike}��</td>
			<c:if test="${sessionScope.id == b.board_user_id }">
				<td align="right"><input type="button" value="����" onclick="${pageContext.request.contextPath }/board/Board_Edit.jsp"></td>
				<td align="right"><input type="button" value="����" onclick="board_del(${b.board_seq})"></td>
			</c:if>
			<c:if test="${sessionScope.id != board_user_id }">
				<td colspan=2></td>
			</c:if>
		</tr>
	</table>
	<c:import url="/ListBoardCommentsController?board_seq=${b.board_seq }"></c:import>
</div>	
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
</body>
</html>