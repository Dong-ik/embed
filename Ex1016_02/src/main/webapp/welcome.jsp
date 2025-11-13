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
		String UserID = (String)session.getAttribute("UserID");
		
		if (UserID == null) {
	        response.sendRedirect("session_out.jsp");
	        return;
	    }
	
		out.println("세션 설정이 성공했습니다.<br>");
		out.println(UserID + "님 환영합니다.");
		
	%>
	<p><a href="session_out.jsp">로그아웃</a>
</body>
</html>