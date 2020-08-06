<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	margin:Auto; 
	font-size:15pt;
	text-align:center;
}
th{
	background-color:red;
	color:White;
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
	<table class="table" style="width:1000px;">
	<tr>
		<td style="text-align: left; font-weight:bolder;">
			
			<c:if test="${board_code eq 'a'}">수도권</c:if>
			<c:if test="${board_code eq 'b'}">바수도권</c:if>
			<c:if test="${board_code eq 'c'}">문과</c:if>
			<c:if test="${board_code eq 'd'}">이과</c:if>
			<c:if test="${board_code eq 'e'}">자유게시판</c:if>
			&ensp;<font size='2pt'>게시판</font>
		</td>
	</tr>
	<tr>
		<td style="text-align: left; font-weight:bolder;">글목록</td>
	</tr>
	</table>
	
		<table class="table"  style="width:1000px;">
			<tr>
				<th>글번호</th><th width='500px' >제목</th><th>작성자</th><th>작성시간</th><th>조회수</th><th>추천수</th>
			</tr>
			<c:forEach var="b" items="${list}" >
				<tr>
					<td>${b.board_seq }</td>
					<td style="text-align:left;">
						<a style="color:black;" href="${pageContext.request.contextPath }/ReadController?board_seq=${b.board_seq}">${b.board_title}</a>
					</td>
					<td>${b.board_writer }</td>
					<td>${b.board_sysdate }</td>
					<td>${b.board_view }</td>
					<td>${b.board_like-b.board_unlike }</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5">
					<nav aria-label="Page navigation">
					  <ul class="pagination">
					    <li class="page-item ${minpage_2}">
					      <a style="color:black;" class="page-link" href="${pageContext.request.contextPath }/ListController?board_code=${board_code}&pageNum=${pageNum-2}" aria-label="Previous"
					      aria-disabled="true">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <li class="page-item ${minpage_1}"><a style="color:black;" class="page-link" href="${pageContext.request.contextPath }/ListController?board_code=${board_code}&pageNum=${pageNum-1}"
					    aria-disabled="true">${pageNum-1}</a></li>
					    <li class="page-item"><a style="color:black;" class="page-link" href="${pageContext.request.contextPath }/ListController?board_code=${board_code}&pageNum=${pageNum}"
					    aria-disabled="true">${pageNum}</a></li>
					    <li class="page-item ${maxpage_1}"><a style="color:black;" class="page-link" href="${pageContext.request.contextPath }/ListController?board_code=${board_code}&pageNum=${pageNum+1}"
					    aria-disabled="true">${pageNum+1}</a></li>
					    <li class="page-item ${maxpage_2}">
					      <a style="color:black;" class="page-link" href="${pageContext.request.contextPath }/ListController?board_code=${board_code}&pageNum=${pageNum+2}" aria-label="Next"
					      aria-disabled="true">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
				</td>
				<td colspan="1" align="right">
					<a class="button" style="color:black;" href="${pageContext.request.contextPath}/ListToWriteBoardController?board_code=${board_code}">글작성</a>
				</td>
			</tr>
		</table>
</div>	
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>