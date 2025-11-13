package bbs.dao;

import java.security.PublicKey;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import bbs.dto.BoardDTO;
import bbs.dto.PageTO;

public class BoardDAO {
	
	DataSource dataFactory;
	
	public BoardDAO() {
		try {
			Context ctx = new InitialContext();
			dataFactory = (DataSource)ctx.lookup("java:comp/env/jdbc/MySQL80");			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BoardDTO> list() {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataFactory.getConnection();
			String query = "SELECT num, author, title, content, date_format(writeday, '%Y.%m.%d') as writeday, readCnt, repRoot, repStep, repIndent FROM board ORDER BY repRoot DESC, repStep ASC";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("num");
				String author = rs.getString("author");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writeday = rs.getString("writeday");
				int readCnt = rs.getInt("readCnt");
				int repRoot = rs.getInt("repRoot");
				int repStep = rs.getInt("repStep");
				int repIndent = rs.getInt("repIndent");
				
				BoardDTO data = new BoardDTO();
				data.setNum(num);
				data.setAuthor(author);
				data.setTitle(title);
				data.setContent(content);
				data.setWriteday(writeday);
				data.setReadCnt(readCnt);
				data.setRepRoot(repRoot);
				data.setRepStep(repStep);
				data.setRepIndent(repIndent);
				
				list.add(data);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				
				if(pstmt != null) {
					pstmt.close();
				}
				
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}		
		return list;
	}
	
	public void write(String _title, String _author, String _content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int currval = 0;
		
		try {
			conn = dataFactory.getConnection();
			String sql = "SELECT ifnull(max(num), 0)+1 FROM board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				currval = rs.getInt(1);
			}
			
			String query = "INSERT INTO board(title, author, content, repRoot, repStep, repIndent) VALUES(?, ?, ?, '"+currval+"', 0, 0)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, _title);
			pstmt.setString(2, _author);
			pstmt.setString(3, _content);
			
			int n = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				
				if(pstmt != null) {
					pstmt.close();
				}
				
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void readCount(String _num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataFactory.getConnection();
			String query = "UPDATE board SET readCnt=readCnt+1 WHERE num="+_num;
			pstmt = conn.prepareStatement(query);
			
			int n = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public BoardDTO retrieve(String _num) {
		
		readCount(_num);
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO data = new BoardDTO();
		
		try {
			conn = dataFactory.getConnection();
			String query = "SELECT * FROM board WHERE num = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(_num));
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				int num = rs.getInt("num");
				String author = rs.getString("author");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writeday = rs.getString("writeday");
				int readCnt = rs.getInt("readCnt");
								
				data.setNum(num);
				data.setAuthor(author);
				data.setTitle(title);
				data.setContent(content);
				data.setWriteday(writeday);
				data.setReadCnt(readCnt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				
				if(pstmt != null) {
					pstmt.close();
				}
				
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}		
		return data;
	}
	
	public void update(String _num, String _title, String _author, String _content) {
		Connection conn= null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataFactory.getConnection();
			String query = "UPDATE board SET title = ?, author = ?, content = ? WHERE num = ?";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, _title);
			pstmt.setString(2, _author);
			pstmt.setString(3, _content);
			pstmt.setInt(4, Integer.parseInt(_num));
			
			int n = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void delete(String _num) {
		Connection conn= null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataFactory.getConnection();
			String query = "DELETE FROM board WHERE num = ?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(_num));
			
			int n = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public ArrayList<BoardDTO> search(String _searchName, String _searchValue) {
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataFactory.getConnection();
			String query = "SELECT num, author, title, content, date_format(writeday, '%Y.%m.%d') as writeday, readCnt FROM board";
		
			if(_searchName.equals("title")) {
				query += " WHERE title LIKE ?";
			} else {
				query += " WHERE author LIKE ?";
			}
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + _searchValue + "%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("num");
				String author = rs.getString("author");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writeday = rs.getString("writeday");
				int readCnt = rs.getInt("readCnt");
				
				BoardDTO data = new BoardDTO();
				data.setNum(num);
				data.setAuthor(author);
				data.setTitle(title);
				data.setContent(content);
				data.setWriteday(writeday);
				data.setReadCnt(readCnt);
				
				list.add(data);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				
				if(pstmt != null) {
					pstmt.close();
				}
				
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}
	
	public BoardDTO replyui(String _num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		BoardDTO data = new BoardDTO();
		
		try {
			conn = dataFactory.getConnection();
			String query = "SELECT * FROM board WHERE num = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(_num));
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				data.setNum(rs.getInt("num"));
				data.setAuthor(rs.getString("author"));
				data.setTitle(rs.getString("title"));
				data.setContent(rs.getString("content"));
				data.setWriteday(rs.getString("writeday"));
				data.setReadCnt(rs.getInt("readCnt"));
				data.setRepRoot(rs.getInt("repRoot"));
				data.setRepStep(rs.getInt("repStep"));
				data.setRepIndent(rs.getInt("repIndent"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				
				if(pstmt != null) {
					pstmt.close();
				}
				
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return data;
	}
	
	public void makeReply(String _repRoot, String _repStep) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataFactory.getConnection();
			String query = "UPDATE board SET repStep=repStep+1 WHERE repRoot = ? AND repStep > ? ";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, Integer.parseInt(_repRoot));
			pstmt.setInt(2, Integer.parseInt(_repStep));
			
			int n = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void reply(String _num, String _title, String _author, String _content, String _repRoot, String _repStep, String _repIndent) {
		makeReply(_repRoot, _repStep);
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataFactory.getConnection();
			String query = "INSERT INTO board(title, author, content, repRoot, repStep, repIndent) VALUES (?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, _title);
			pstmt.setString(2, _author);
			pstmt.setString(3, _content);
			pstmt.setInt(4, Integer.parseInt(_repRoot));
			pstmt.setInt(5, Integer.parseInt(_repStep)+1);
			pstmt.setInt(6, Integer.parseInt(_repIndent)+1);
			
			int n = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public int tatalCount() {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataFactory.getConnection();
			String qurey = "SELECT count(*) FROM board";
			pstmt = conn.prepareStatement(qurey);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				
				if(pstmt != null) {
					pstmt.close();
				}
				
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}		
		return count;
	}
	
	public PageTO page(int curPage) {
		PageTO to = new PageTO();
		int totalCount = tatalCount();
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataFactory.getConnection();
			String query = "SELECT num, author, title, content, date_format(writeday, '%Y.%m.%d') as writeday, readCnt, repRoot, repStep, repIndent FROM board ORDER BY repRoot DESC, repStep ASC";
			pstmt = conn.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = pstmt.executeQuery();
			
			int perPage = to.getPrePage();
			int skip = (curPage-1) * perPage;
			
			if (skip > 0) {
				rs.absolute(skip);
			}
			
			for(int i = 0; i < perPage && rs.next(); i++) {
				int num = rs.getInt("num");
				String author = rs.getString("author");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writeday = rs.getString("writeday");
				int readCnt = rs.getInt("readCnt");
				int repRoot = rs.getInt("repRoot");
				int repStep = rs.getInt("repStep");
				int repIndent = rs.getInt("repIndent");
				
				BoardDTO data = new BoardDTO();
				data.setNum(num);
				data.setAuthor(author);
				data.setTitle(title);
				data.setContent(content);
				data.setWriteday(writeday);
				data.setReadCnt(readCnt);
				data.setRepRoot(repRoot);
				data.setRepStep(repStep);
				data.setRepIndent(repIndent);
				
				list.add(data);
			}
			
			to.setList(list);
			to.setTotalCount(totalCount);
			to.setCurPage(curPage);	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				
				if(pstmt != null) {
					pstmt.close();
				}
				
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return to;
	}
}
