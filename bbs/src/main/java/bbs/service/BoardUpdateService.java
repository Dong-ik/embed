package bbs.service;

import bbs.dao.BoardDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardUpdateService implements BoardService {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String num = req.getParameter("num");
		String title = req.getParameter("title");
		String author = req.getParameter("author");
		String content = req.getParameter("content");
				
		BoardDAO dao = new BoardDAO();
		dao.update(num, title, author, content);	
	}
}
