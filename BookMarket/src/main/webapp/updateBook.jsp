<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>도서 수정</title>
</head>
<body>
	<div class="container py-4">
		<%@ include file="menu.jsp" %>
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">도서 수정</h1>
				<p class="col-md-8 fs-4">Book Updating</p>
			</div>
		</div>
		<%@ include file="dbconn.jsp" %>
		<% 
			String bookId = request.getParameter("id");
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM book WHERE b_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bookId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
		%>
		<div class="row align-items-md-stretch">
			<div class="col-md-5">
				<img alt="책 이미지" src="./resources/images/<%=rs.getString("b_fileName")%>" style="width:100%" />
			</div>
			<div class="col-md-7">
				<form action="./processUpdateBook.jsp" method="post" name="newBook" enctype="multipart/form-data">
					<div class="mb-3 row">
						<label class="col-sm-2">도서코드</label>
						<div class="col-sm-5">
							<input type="text" name="bookId" id="bookId" class="form-control" value='<%=rs.getString("b_id")%>'>
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">도서명</label>
						<div class="col-sm-5">
							<input type="text" name="name" id="name" class="form-control" value='<%=rs.getString("b_name")%>'>												
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">가격</label>
						<div class="col-sm-5">
							<input type="text" name="unitPrice" id="unitPrice" class="form-control" value='<%=rs.getString("b_unitPrice")%>'>
						</div>						
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">저자</label>
						<div class="col-sm-5">
							<input type="text" name="author" id="author" class="form-control" value='<%=rs.getString("b_author")%>'>
						</div>						
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">출판사</label>
						<div class="col-sm-5">
							<input type="text" name="publisher" id="publisher" class="form-control" value='<%=rs.getString("b_publisher")%>'>
						</div>						
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">출판일</label>
						<div class="col-sm-5">
							<input type="text" name="releaseDate" id="releaseDate" class="form-control" value='<%=rs.getString("b_releaseDate")%>'>
						</div>						
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">상세정보</label>
						<div class="col-sm-5">
							<textarea id="description" name="description" class="form-control" cols="50" rows="2" placeholder="5자 이상 적어주세요."><%=rs.getString("b_description")%></textarea>
						</div>						
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">분류</label>
						<div class="col-sm-5">
							<input type="text" name="category" id="category" class="form-control" value='<%=rs.getString("b_category")%>'>
						</div>						
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">재고수</label>
						<div class="col-sm-5">
							<input type="text" name="unitsInStock" id="unitsInStock" class="form-control" value='<%=rs.getString("b_unitsInStock")%>'>
						</div>						
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">상태</label>
						<div class="col-sm-8">
							<input type="radio" name="condition" value="New">신규도서
							<input type="radio" name="condition" value="Old">중고도서
							<input type="radio" name="condition" value="EBook">E-Book
						</div>						
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-5">
							<input type="file" id="bookImage" name="bookImage" class="form-control"> 
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-primary" value='등록'>
						</div>
					</div>
				</form>
			</div>
				<%
					}
					if(rs!=null){
						rs.close();
					}
					if(pstmt!=null){
						pstmt.close();
					}
					if(conn!=null){
						conn.close();
					}
				%>
			<%@ include file="footer.jsp" %>
		</div>
	</div>
</body>
</html>