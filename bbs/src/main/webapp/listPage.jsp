<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록 보기</title>
	<style>
		#container {
			width: 600px;
			height: 400px;
			margin: 10px auto;
		}
		
		caption {
			font-size: 25px;
			font-weight: bold;
		}
		
		table, td, th {
			border: 2px solid #cdcdcd;
			border-collapse: collapse;
		}
		
		form {
			text-align: left;	
		}
	</style>
</head>
<body>
	<table border="1">
		<caption>게시판 목록 보기</caption>
		<tr>
			<td colspan="5">
				<form action="search.do">
					<select name="searchName" size="1">
						<option value="author">작성자</option>
						<option value="title">글제목</option>
					</select>
					<input type="text" name="searchValue">
					<input type="submit" value="찾기">
				</form>
			</td>
		</tr>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성날짜</td>
			<td>조회수</td>
		</tr>
		
		<c:forEach items="${list}" var="dto">
		<tr>
			<td>${dto.num}</td>
			<%-- <td><a href="retrieve.do?num=${dto.num}">${dto.title}</a></td> --%>
			<td>
				<c:forEach begin="1" end="${dto.repIndent}">
					<%="&nbsp;&nbsp;▶re : " %>
				</c:forEach>
				<a href="retrieve.do?num=${dto.num}">${dto.title}</a>
			</td>
			<td>${dto.author}</td>
			<td>${dto.writeday}</td>
			<td>${dto.readCnt}</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
				<jsp:include page="page.jsp" flush="true"></jsp:include>
			</td>
		</tr>
	</table>
	<a href="writeui.do">글쓰기</a>
</body>
</html>