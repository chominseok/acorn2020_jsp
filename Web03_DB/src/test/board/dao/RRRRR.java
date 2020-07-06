package test.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.board.dto.BoardDto;
import test.util.DbcpBean;

public class RRRRR {
	private static RRRRR dao;
	
	private RRRRR() {
		if(dao == null) {
			dao = new RRRRR();
		}
	}
	
	public static RRRRR getInstance() {
		return dao;
	}
	
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;
	BoardDto dto;
	
	public boolean insert(BoardDto dto) {
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO board_guest"
					+ " VALUES (board_guest_seq.NEXTVAL, ?, ?, ? , REGDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			flag = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(flag > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean delete(int num) {
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM board_guest"
					+ " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			flag = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(flag > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean update(BoardDto dto) {
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE board_guest"
					+ " SET writer = ?, title = ?, content = ?"
					+ " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getNum());
			flag = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(flag > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	public BoardDto getDate(int num) {
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT writer,title,content,regdate FROM board_guest"
					+ " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDto();
				
				dto.setNum(rs.getInt(num));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
				if(rs != null)rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
	public List<BoardDto> getList(){
		List<BoardDto> list = new ArrayList<BoardDto>();
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT * FROM board_guest"
					+ " ORDER BY num ASC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new BoardDto();
				
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
				if(rs != null)rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
