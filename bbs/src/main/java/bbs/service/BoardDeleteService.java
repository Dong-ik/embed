package bbs.service;

import bbs.dao.BoardDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardDeleteService implements BoardService {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String num = req.getParameter("num");
		
		BoardDAO dao = new BoardDAO();
		dao.delete(num);
		
	}
}
