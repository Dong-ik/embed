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
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		if(id.equals("admin") && passwd.equals("1234")) {
			session.setAttribute("UserID", id);
			response.sendRedirect("welcome.jsp");
		} else {
			response.sendRedirect("welcome.jsp");
		}
	%>
</body>
</html>