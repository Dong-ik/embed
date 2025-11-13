<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, org.embed.dto.*" %>
<%@ include file="dbconn.jsp" %>
<%
	String id = request.getParameter("id");
	if(id == null || id.trim().equals("")){
		response.sendRedirect("/bookmarket/books.do");
		return;
	}
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Book book = null;
	
	try {
		String sql = "SELECT * FROM book WHERE b_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if (!rs.next()) {
			response.sendRedirect("/bookmarket/exceptionNoBookId.do");
			return;
		}
	} catch(Exception e) {
		e.printStackTrace();
		response.sendRedirect("/bookmarket/exceptionNoBookId.do");
		return;
	} finally {
		if(rs!=null){
			rs.close();
		}
		if(pstmt!=null){
			pstmt.close();
		}
		if(conn!=null){
			conn.close();
		}
	}
	
	ArrayList<Book> cartList = (ArrayList<Book>)session.getAttribute("cartlist");
	Book goodsQnt = new Book();
	for(int i = 0; i < cartList.size(); i++){
		goodsQnt = cartList.get(i);
		if(goodsQnt.getBookId().equals(id)){
			cartList.remove(goodsQnt);
			break;
		}
	}
	
	response.sendRedirect("/bookmarket/cart.do");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>