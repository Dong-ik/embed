<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="conn.jsp" %>
	<table width="100%" border="1">
			<tr>
				<th>학번</th>
				<th>학과</th>
				<th>이름</th>
				<th>주소</th>
				<th>연락처</th>
			</tr>
			<tr>
				<%
				    PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					try {
						String sql = "SELECT * FROM student";
						pstmt = conn.prepareStatement(sql);
						rs=pstmt.executeQuery();
						
						while(rs.next()) {
							int num = rs.getInt("num");
							String depart = rs.getString("depart");
							String name = rs.getString("name");
							String address = rs.getString("address");
							String phone = rs.getString("phone");
                 %>
		        <td><%= num %></td>
		        <td><%= depart %></td>
		        <td><%= name %></td>
		        <td><%= address %></td>
		        <td><%= phone %></td>
		    </tr>
		    	<%
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
		</table>
		<p><a href="./insert.jsp">추가</a> <a href="./update.jsp">수정</a> <a href="./delete.jsp">수정</a>					
</body>
</html>