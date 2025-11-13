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
			
			if(user[i].getValue().equals("admin")) {
				out.println(user[i].getValue() + "님 반갑습니다.<br>");
	%>
				<a href="cookie_out.jsp">로그아웃</a>		
	<%
			} else if (user[i].getValue().equals("")) {
				response.sendRedirect("cookie_out.jsp");
			}
		}
	%>
</body>
</html>