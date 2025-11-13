<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
	
		if(id.equals("admin")) {
			out.println(id + "님 반갑습니다.<br>");
	%>
			<a href="session_out.jsp">로그아웃</a>		
	<%
		} else if (id.equals("")) {
			response.sendRedirect("session_out.jsp");
		}		
	%>
</body>
</html>