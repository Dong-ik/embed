package bbs.service;

import bbs.dao.BoardDAO;
import bbs.dto.PageTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardPageService implements BoardService {
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		int curPage = 1;
		
		if (req.getParameter("curPage") != null) {
			curPage = Integer.parseInt(req.getParameter("curPage"));
		}
		BoardDAO dao = new BoardDAO();
		PageTO list = dao.page(curPage);
		
		req.setAttribute("list", list.getList());
		req.setAttribute("page", list);
	}
}
