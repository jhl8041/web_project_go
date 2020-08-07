
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cal.dao.CalDaoImpl"%>
<%@page import="cal.dao.CalDao"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="model.CalVo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="comm.commodule"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ķ����</title>
	<script type="text/javascript">
		function btn_m_year(){
			alert("click1");
			location.href="InsertController2";
		}
		
		function btn_p_year(){
			alert("click4");
			location.href="InsertController5";
		}
	</script>

	<style type = "text/css">
			#calendar{
				border :1px solid gray;
				border-collapse: colapse;
			}
			#calendar th{
				width : 80px;
				border : 1px solid gray;
			}
				#calendar td{
				width : 80px;
				height : 80px;
				border : 1px solid gray;
				text-align : left;
				vertical-align: top;
				position: relative;
		}
	</style>
</head>
<body>
	<%
		Calendar cal = Calendar.getInstance();
		int month =(int) request.getAttribute("month");
		int year =(int) request.getAttribute("year");
		int lastDay =(int) request.getAttribute("lastDay");
		String paramYear =(String) request.getAttribute("paramYear");
		String paramMonth =(String) request.getAttribute("paramMonth");
		int dayofweek =(int) request.getAttribute("dayofweek");
		
		if(paramYear != null)
			year = Integer.parseInt(paramYear);
		if(paramMonth != null)
			month = Integer.parseInt(paramMonth);
	 	if(month>12)
			month=1; year = year+1;
		if(month<1)
			month=12; year = year-1;
			cal.set(year, month-1,1);
	%>
	<%=year %>
	<%=month %>
	<%=lastDay %>
	<%=dayofweek %>
	
	
	<input type="button" align ="left" onclick="location.href='<c:url value='/MainController' />'" value="��������"/>
	<table id = "calendar">
	
		<caption>
	             
	<input type=button onclick="btn_m_year()">
	<input type=button onclick="location.href='InsertController3'">
	<input type=button onclick="location.href='InsertController'">
		
			<span class = "y">${year}</span>��
			<span class = "m">${month}</span>��
			
		
	<input type=button onclick="location.href='InsertController4'">
	<input type=button onclick="btn_p_year()">
		<a></a>
	
		</caption>
		<tr>
			<th>��</th>
			<th>��</th>
			<th>ȭ</th>
			<th>��</th>
			<th>��</th>
			<th>��</th>
			<th>��</th>
		</tr>
			<tr>
				<%
					//����
					for(int i =0; i<dayofweek-1 ; i++){
						out.print("<td>&nbsp;</td>");
					}
				//�޷��ϼ�S
				for(int i =1; i<=lastDay ; i++){
					%>
					<td>
						<!-- �ش� ����Ͽ� ��ü�� ���� -->
						<a style = "color : <%=commodule.fontColor(i, dayofweek) %>"><%=i %></a>
						
						<img alt="�����߰�" src="./image/1234.png" onclick="">
	
					 <%
					
					 
					 SimpleDateFormat datetemp= new SimpleDateFormat("yyyy-MM-dd");
						String a;
						a = commodule.isTwo(String.valueOf(i));
						String b = commodule.isTwo(String.valueOf(month));
						String calDate = Integer.toString(year) + b+a;
						String pd =  Integer.toString(year)+ "-" + b +"-" +a;
						Date postDate = datetemp.parse(pd);
						pageContext.setAttribute("calDate", calDate);
						pageContext.setAttribute("postDate", postDate);
						
						
							%> 
							
							<hr>
							<c:forEach var="c" items="${list}">
								 	 <c:if test="${c.mdate == calDate}">
					 	<br>${ c.content}
					 </c:if>
							 </c:forEach>
							 <hr>
							 
							<c:forEach var="p" items="${plist}">
										 	 <c:if test="${p.sdate == postDate}">
										 	 <br><a href="${p.posturl}">${p.postname}����</a>
							 	
							 </c:if>
									 </c:forEach>
								<c:forEach var="p" items="${plist}">
										 	 <c:if test="${p.edate == postDate}">
										 	 <br><a href="${p.posturl}">${p.postname}����</a>
	
							 </c:if>
									 </c:forEach>
		
		
					 
					 
					</td>
					<%
					if((dayofweek-1+i)%7==0){
						out.print("<tr></tr>");
					}
				}
				//������ ���� �������
				for(int i =0; i<(7-(dayofweek-1+lastDay)%7)%7 ; i++){
					out.print("<td>&nbsp;</td>");
				}
				%>
			</tr>
	</table>
	
	<h3>���������߰�</h3>
	<form name="f" action="${pageContext.request.contextPath }/AddController" method="post">
	<table border="1">
	<tr>
	<td>����</td><td><input type="text" name="title">
	</td>
	</tr>
	<tr>
	<td>����</td><td><input type="text" name="content"></td>
	</tr>
	<tr>
	<td>��¥</td><td><input type="text" name="mdate"></td>
	</tr>
	<tr>
	<td colspan="2"><input type="submit" value="����">
	<input type="reset" value="���">
	</td>
	</tr>
	</table>
	</form>
	
	<h3>������������</h3>
	<form name="f" action="${pageContext.request.contextPath }/DelController" method="post">
	<table border="1">
	<tr>
	<td>����</td><td><input type="text" name="title2">
	</td>
	</tr>
	<tr>
	<td>��¥</td><td><input type="text" name="mdate2"></td>
	</tr>
	<tr>
	<td colspan="2"><input type="submit" value="����">
	<input type="reset" value="���">
	</td>
	</tr>
	</table>
	</form>

</body>
</html></html>