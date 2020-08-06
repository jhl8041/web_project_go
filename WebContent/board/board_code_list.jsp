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

<style type="text/css">
html,body{
	width:100%; height:100%;
	font-style:italic;
}
th{color:yellow; text-align:center;}

#left_menu{
	width:150pt;
	height:100%;
	background-color:red;
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
#blank{
	width:10pt;
	height:100%;
	background-color:white;
	float:left;
	overflow:auto;
}

.color-white {color:white;}

a:link{ color:white; text-decoration:none;}
a:visited{ color:white; text-decoration:none;}
a:hover{ color:white; text-decoration:none;}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
var importurl = "";
function btnclick(_url){
	importurl = _url;
//     $.ajax({
//         url : _url,
//         type : 'get',
//         success: function(data) {
//             $('#contents').text(data);
//         },
//             error: function() {
//             $('#contents').text('페이지 점검중 입니다.');
//         }
//     });
}

</script>
</head>
<body>
<div id="left_menu" class="container-fluid" >
		<table class="table color-white" >
			<tr>
				<th colspan = "2" style="background-color:#B40404; ">게시판</th>
			</tr>
			<%--게시판 코드별로 분류
				${board_code}
				a:수도권,b:비수도권,c:문과,d:이과,e:자유게시판
			 --%>
			<tr>
				<th style="background-color:#B40404;">지역</th>
				<td >
					<a class="a"href='${pageContext.request.contextPath }/ListController?board_code=a&pageNum=1'>수도권</a><br>
					<a class="a"href='${pageContext.request.contextPath }/ListController?board_code=b&pageNum=1'>비수도권</a>
				</td>
			</tr>
			<tr>
				<th style="background-color:#B40404;">전공</th>
				<td >
					<a class="a"href='${pageContext.request.contextPath }/ListController?board_code=c&pageNum=1'>문과</a><br>
					<a class="a"href='${pageContext.request.contextPath }/ListController?board_code=d&pageNum=1'>이과</a>
				</td>
			</tr>
			<tr>
				<td class="color-white" colspan="2" >
					<a class="a"href='${pageContext.request.contextPath }/ListController?board_code=e&pageNum=1'>자유게시판</a>
				</td>
			</tr>
		</table>
</div>
<div id="blank">&nbsp;</div>
<div id="contents" class="container-fluid">
	<c:import url="/ListController?board_code=a&pageNum=1"></c:import>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
</body>
</html>