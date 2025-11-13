<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	String depart = request.getParameter("depart");
	%>
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://localhost:3306/bbs"
		user="root"
		password="1111"
		driver="com.mysql.cj.jdbc.Driver"/>
	<sql:update dataSource="${dataSource}" var="resultSet">
		DELETE FROM student WHERE depart = ?
		<sql:param value="<%= depart %>"/>
		
	</sql:update>
	
	<sql:query var="resultSet" dataSource="${dataSource}">
    	SELECT * FROM student
	</sql:query>
	
	<table border="1">
	    <tr>
	        <th>학번</th>
	        <th>학과</th>
	        <th>이름</th>
	        <th>주소</th>
	        <th>연락처</th>
	    </tr>
	<c:forEach var="row" items="${resultSet.rows}">
	        <tr>
	            <td>${row.num}</td>
	            <td>${row.depart}</td>
	            <td>${row.name}</td>
	            <td>${row.address}</td>
	            <td>${row.phone}</td>
	        </tr>
    </c:forEach>
    <p><a href="./sql03.jsp" class="btn btn-secondary" role="button">초기화면 &raquo;</a>
</body>
</html>