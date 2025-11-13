package bbs.service;

import java.util.ArrayList;

import bbs.dao.BoardDAO;
import bbs.dto.BoardDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardSearchService implements BoardService {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String searchName = req.getParameter("searchName");
		String searchValue = req.getParameter("searchValue");
		
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardDTO> list = dao.search(searchName, searchValue);
		req.setAttribute("list", list);
		
	}
}
