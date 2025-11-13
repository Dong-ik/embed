<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookie</title>
</head>
<body>
	<%
		Cookie[] user = request.getCookies();
		
		for (int i = 0; i < user.length; i++) {
			user[i].setMaxAge(0);
			response.addCookie(user[i]);
		}
		
		response.sendRedirect("cookie.jsp");
	%>
</body>
</html>