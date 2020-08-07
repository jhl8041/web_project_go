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
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	
	String paramYear = request.getParameter("year");
	String paramMonth = request.getParameter("month");
	
	if(paramYear != null){
		year = Integer.parseInt(paramYear);
	}
	if(paramMonth != null){
		month = Integer.parseInt(paramYear);
	}
	if(month>12){
		month=1;
		year++;
	}
	if(month<1){
		month=12;
		year--;
	}
	
	
	//��û���� �⵵�� ���� ���ڷ� calendar class setting
	cal.set(year, month-1,1);
	//�ſ� 1���� ����
	int dayofweek = cal.get(Calendar.DAY_OF_WEEK);
	//���� �ִ��� ��
	int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	

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
			<%=i %>
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
</body>
</html>