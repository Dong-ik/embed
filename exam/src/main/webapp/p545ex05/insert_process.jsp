<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	include file="conn.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 입력 처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		int num = Integer.parseInt(request.getParameter("num"));
		String depart = request.getParameter("depart");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		
		PreparedStatement pstmt=null;
		
		try {
			String sql = "INSERT INTO student(num, depart, name, address, phone) VALUES(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, depart);
			pstmt.setString(3, name);
			pstmt.setString(4, address);
			pstmt.setString(5, phone);
			
			int n = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}	
			} catch(Exception e2) {
				e2.printStackTrace();
			} finally {
				
			}
			response.sendRedirect("select.jsp");
		}
	%>
</body>
</html>