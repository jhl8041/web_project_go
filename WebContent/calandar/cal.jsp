
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
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>cal</title>
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

//�̰� �����ߴ�.
int month = (int) request.getAttribute("month");
int year =(int) request.getAttribute("month");
int dayofweek =(int) request.getAttribute("dayofweek");
int lastDay = (int) request.getAttribute("lastDay");


	//���÷��õ� ���� ���۹޴� ���� �ʿ�!!
	String paramYear = request.getParameter("year");
	String paramMonth = request.getParameter("month"); 
	
  	if(paramYear != null)
		year = Integer.parseInt(paramYear);
	if(paramMonth != null)
		month = Integer.parseInt(paramMonth);
 	if(month>12)
		month=1; year = year+1;
	if(month<1)
		month=12; year = year-1;

	
	//��û���� �⵵�� ���� ���ڷ� calendar setting
	cal.set(year, month-1,1);
	//�ſ� 1���� ����
	dayofweek = cal.get(Calendar.DAY_OF_WEEK);
	//���� �ִ��� ��
	lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
%>

<table id = "calendar">

	<caption>
	<a href = "./cal.jsp?year=<%=year-1%>&month=<%=month%>">��</a>
	<a href = "./cal.jsp?year=<%=year%>&month=<%=month-1%>">��</a>
	
		<span class = "y"><%=year %></span>��
		<span class = "m"><%=month %></span>��
	
	<a href = "./cal.jsp?year=<%=year%>&month=<%=month+1%>">��</a>
	<a href = "./cal.jsp?year=<%=year+1%>&month=<%=month%>">��</a>
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
						${month }
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

<h3>��������</h3>
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
<td>���峯¥</td><td><input type="text" name="mdate"></td>
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