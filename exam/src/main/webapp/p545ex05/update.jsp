<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학과명 수정</title>
</head>
<body>
	<form action="update_process.jsp" method="post">
		변경 전 학과명 : <input type="text" name="b_depart"><br>
	 	변경 후 학과명 : <input type="text" name="a_depart"><br>
	 	<input type="submit" value="전송">
	</form>
</body>
</html>