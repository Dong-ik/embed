<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	include file="conn.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테이블 삭제</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String depart = request.getParameter("depart");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM student WHERE depart = ?";	
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, depart);
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				String depart1 = rs.getString("depart");
				
				if(depart.equals(depart1)) {
					sql = "DELETE FROM student WHERE depart = ?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, depart);
					
					int n = pstmt.executeUpdate();
				} else {
					out.println("삭제 실패");					
				}
			} else {
				out.println("학과가 존재하지 않습니다.");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
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
		}
		
	%>
</body>
</html>