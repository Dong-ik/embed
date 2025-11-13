<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.embed.dto.*, org.embed.dao.*, com.oreilly.servlet.*, com.oreilly.servlet.multipart.*" %>    
<%
	/* request.setCharacterEncoding("UTF-8");

	String fileName = "";
	String realFolder = "C:\\eclipse\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\BookMarket\\resources\\images";
	int maxSize = 5 * 1024 *1024 ;
	String encType = "UTF-8" ;
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy()); 
	
	String bookId = multi.getParameter("bookId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String author = multi.getParameter("author");
	String publisher = multi.getParameter("publisher");
	String releaseDate = multi.getParameter("releaseDate");
	String description = multi.getParameter("description");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
    int price = 0;
    if (unitPrice != null && !unitPrice.isBlank()) {
        try { price = Integer.parseInt(unitPrice.trim()); } catch (NumberFormatException ignore) {}
    }

    long stock = 0L;
    if (unitsInStock != null && !unitsInStock.isBlank()) {
        try { stock = Long.parseLong(unitsInStock.trim()); } catch (NumberFormatException ignore) {}
    }
    
    Enumeration files = multi.getFileNames();
    String fname = (String)files.nextElement();
    String filename = multi.getFilesystemName(fname);
    
    
	BookRepasitory dao = BookRepasitory.getInstance();
    Book newBook = new Book();
    newBook.setBookId(bookId);
    newBook.setName(name);
    newBook.setUnitPrice(price);
    newBook.setAuthor(author);
    newBook.setPublisher(publisher);
    newBook.setReleaseDate(releaseDate);
    newBook.setDescription(description);
    newBook.setCategory(category);
    newBook.setUnitsInStock(stock);
    newBook.setCondition(condition);
    newBook.setFilename(filename);
    
    dao.addBook(newBook);
    response.sendRedirect("books.jsp"); */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 처리</title>
</head>
<body>

</body>
</html>