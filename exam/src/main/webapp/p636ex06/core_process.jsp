<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점수처리</title>
</head>
<body>
	<%
		String jumsu = request.getParameter("jumsu");	
	%>
	<c:set var="jumsu" value="<%=jumsu%>"/>
	<c:choose>
		<c:when test="${jumsu >= 90}">
			점수 <c:out value="${jumsu}"/>은 A학점입니다.
		</c:when>
		<c:when test="${jumsu >= 80}">
			점수 <c:out value="${jumsu}"/>은 B학점입니다.
		</c:when>
		<c:when test="${jumsu >= 70}">
			점수 <c:out value="${jumsu}"/>은 C학점입니다.
		</c:when>
		<c:when test="${jumsu >= 60}">
			점수 <c:out value="${jumsu}"/>은 D학점입니다.
		</c:when>
		<c:otherwise>
			점수 <c:out value="${jumsu}"/>은 F학점입니다.
		</c:otherwise>
	</c:choose>
</body>
</html>