package bbs.dto;

import java.util.ArrayList;

public class PageTO {
	
	ArrayList<BoardDTO> list;
	int curPage;
	int prePage = 10;
	int totalCount;
	
	public ArrayList<BoardDTO> getList() {
		return list;
	}
	public void setList(ArrayList<BoardDTO> list) {
		this.list = list;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPrePage() {
		return prePage;
	}
	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	
}
