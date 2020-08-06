<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function comment_del(b_c_seq,b_c_parent_seq){
	location.href="${pageContext.request.contextPath }/DelBoardCommentController?b_c_seq="+b_c_seq+"&b_c_parent_seq="+b_c_parent_seq;
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
th{
	align-content:flex-start;
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
<div id="contents">
<table>
	<tr><td colspan="4">댓글</td></tr>
	<tr>
		<th width="100px">작성자</th><th width="1200px">내용</th><th width="200px">작성시간</th><th></th>
	</tr>
	<c:forEach var="b_c" items="${list}">	
		<tr>
			<td>${b_c.board_comment_writer}</td>
			<td>
				<input type="text" style="width:90%;" name="board_comments_content" value="${b_c.board_comment_content }" >
			</td>
			<td>${b_c.board_comment_sysdate }</td>
			<c:if test="${sessionScope.member_id == b_c.board_comment_user_id }">
				<td>
					<input type="button" value="수정" onclick="${pageContext.request.contextPath }/EditBoardCommentsController?b_c_seq=${b_c.board_comment_seq}&b_c_parent_seq=${b_c.board_comment_parent_seq}">
					<input type="button" value="삭제" onclick="comment_del(${b_c.board_comment_seq},${b_c.board_comment_parent_seq})">
				</td>
			</c:if>
			<c:if test="${sessionScope.member_id != b_c.board_comment_user_id }">
				<td></td>
			</c:if>
		</tr>
	</c:forEach>	
</table>
<form action="${pageContext.request.contextPath }/WriteBoardCommentsController?board_seq=${board_seq}" method="post">
	<table>
		<tr>
			<td width="100px">${sessionScope.member_nickname}</td>
			<td width="1200px"><input type="text" style="width:90%;" name="board_comments_content"></td>
			<td width="200px"></td>
			<td><input type="submit"  value="작성"></td></tr>
	</table>
</form>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
</body>
</html>