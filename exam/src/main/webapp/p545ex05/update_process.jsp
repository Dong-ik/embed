<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	include file="conn.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학과명 수정</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String b_depart = request.getParameter("b_depart");
		String a_depart = request.getParameter("a_depart");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM student WHERE depart = ?";	
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, b_depart);
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				String depart = rs.getString("depart");
				
				if(b_depart.equals(depart)) {
					sql = "UPDATE student SET depart=? WHERE depart=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, a_depart);
					pstmt.setString(2, depart);
					
					int n = pstmt.executeUpdate();
				} else {
					out.println("수정 실패");					
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