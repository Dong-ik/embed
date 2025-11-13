package bbs.service;

import bbs.dao.BoardDAO;
import bbs.dto.BoardDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardReplyUIService implements BoardService{
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String num = req.getParameter("num");
		BoardDAO dao = new BoardDAO();
		BoardDTO data = dao.replyui(num);
		req.setAttribute("replyui", data);
	}
}
