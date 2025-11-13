package bbs.service;

import bbs.dao.BoardDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardReplyService implements BoardService {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String num = req.getParameter("num");
		String title = req.getParameter("title");
		String author = req.getParameter("author");
		String content = req.getParameter("content");
		String repRoot = req.getParameter("repRoot");
		String repStep = req.getParameter("repStep");
		String repIndent = req.getParameter("repIndent");
		
		BoardDAO dao = new BoardDAO();
		dao.reply(num, title, author, content, repRoot, repStep, repIndent);	
	}
}
