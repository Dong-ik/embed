package bbs.controller;

import java.io.IOException;

import bbs.service.BoardDeleteService;
import bbs.service.BoardListService;
import bbs.service.BoardPageService;
import bbs.service.BoardReplyService;
import bbs.service.BoardReplyUIService;
import bbs.service.BoardRetrieveService;
import bbs.service.BoardSearchService;
import bbs.service.BoardService;
import bbs.service.BoardUpdateService;
import bbs.service.BoardWriteService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class BoardController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String reqURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String serv = reqURI.substring(contextPath.length());
		
		BoardService service = null;
		String nextPage = null;
		
		/*
		 * if (serv.equals("/list.do")) { service = new BoardListService();
		 * service.execute(req, resp); nextPage = "list.jsp"; }
		 */
		
		if (serv.equals("/writeui.do")) {
			nextPage = "write.jsp";
		}
		
		if (serv.equals("/write.do")) {
			service = new BoardWriteService();
			service.execute(req, resp);
			nextPage = "list.do";
		}
		
		if (serv.equals("/retrieve.do")) {
			service = new BoardRetrieveService();
			service.execute(req, resp);
			nextPage = "retrieve.jsp";
		}
		
		if (serv.equals("/update.do")) {
			service = new BoardUpdateService();
			service.execute(req, resp);
			nextPage = "list.do";
		}
		
		if (serv.equals("/delete.do")) {
			service = new BoardDeleteService();
			service.execute(req, resp);
			nextPage = "list.do";
		}
		
		if (serv.equals("/search.do")) {
			service = new BoardSearchService();
			service.execute(req, resp);
			nextPage = "list.jsp";
		}
		
		if (serv.equals("/replyui.do")) {
			service = new BoardReplyUIService();
			service.execute(req, resp);
			nextPage = "reply.jsp";
		}
		
		if (serv.equals("/reply.do")) {
			service = new BoardReplyService();
			service.execute(req, resp);
			nextPage = "list.do";
		}
		
		if (serv.equals("/list.do")) {
			service = new BoardPageService();
			service.execute(req, resp);
			nextPage = "listPage.jsp";
		}
		
		RequestDispatcher dis = req.getRequestDispatcher(nextPage);
		dis.forward(req, resp);
	}
}
