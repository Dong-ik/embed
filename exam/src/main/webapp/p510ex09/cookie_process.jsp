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
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		if(id.equals("admin")&&password.equals("1111")) {
			Cookie user_id = new Cookie("id", id);
			Cookie user_password = new Cookie("password", password);
			
			response.addCookie(user_id);
			response.addCookie(user_password);
			
			response.sendRedirect("welcome.jsp");
		} else {
			out.println("잘못입력되었습니다.<br>");
			
	%>
			<a href="cookie_out.jsp">초기화면</a>
	<%
		}
	%>
</body>
</html>