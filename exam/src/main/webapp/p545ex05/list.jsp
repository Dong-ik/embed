<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*, org.embed.model.*, org.embed.controller.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
	List list = (List)request.getAttribute("list");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<title>Board</title>
<script type="text/javascript">
	function checkForm() {	
		location.href = "./WriteForm.do
	}
</script>
</head>
<body> 	
		<table class="table table-hover text-center">
			<tr>
				<th>학번</th>
				<th>학과</th>
				<th>이름</th>
				<th>주소</th>
				<th>연락처</th>
			</tr>
			<tr>
				<%
                     for(int i = 0; i < list.size(); i++){
                     	DTO notice = (DTO)list.get(i);
                 %>
		        <td><a href="./ViewAction.do?num=<%=notice.getNum() %>"><%=notice.getNum() %></a></td>
		        <td><%=notice.getDepart() %></td>
		        <td><%=notice.getName() %></td>
		        <td><%=notice.getAddress() %></td>
		        <td><%=notice.getPhone() %></td>
		    </tr>
		    	<%
                     }
		    	%>
		</table>							
		<a href="#" onclick="checkForm(); return false;" class="btn btn-primary">&laquo;정보입력</a>		
</body>
</html>