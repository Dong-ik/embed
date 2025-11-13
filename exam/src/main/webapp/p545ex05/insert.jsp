<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 삽입</title>
</head>
<body>
	<form action="insert_process.jsp" method="post">
		학번 : <input type="text" name="num"><br>
		학과 : <input type="text" name="depart"><br>
		이름 : <input type="text" name="name"><br>
		주소 : <input type="text" name="address"><br>
		연락처 : <input type="text" name="phone"><br>
		<input type="submit" value="전송">
	</form>
</body>
</html>