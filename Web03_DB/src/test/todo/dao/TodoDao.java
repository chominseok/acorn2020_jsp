package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.todo.dto.TodoDto;
import test.util.DbcpBean;

public class TodoDao {
	private static TodoDao dao;
	
	private TodoDao() {}
	
	public static TodoDao getInstance() {
		if(dao == null) {
			dao = new TodoDao();
		}
		
		return dao;
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	TodoDto dto;
	//할 일 삭제하는 메소드
	public boolean deleteTodo(int num) {
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();

			String sql = "DELETE FROM todo"
					+ " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			flag = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
	//할 일 추가하는 메소드
		public boolean InsertTodo(TodoDto dto) {	
			int flag = 0;
			try {
				conn = new DbcpBean().getConn();
				
				String sql = "INSERT INTO todo"
						+ " VALUES (?, ?, sysdate)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, dto.getNum());
				pstmt.setString(2, dto.getWork());
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
			if(flag >0) {
				return true;
			}else {
				return false;
			}
		}
		
		//할 일 목록을 리턴해주는 메소드
		public List<TodoDto> todoList() {
			List<TodoDto> list = new ArrayList<>();
			try {
				conn = new DbcpBean().getConn();
				String sql = "SELECT num, work, regdate"
						+ " FROM todo"
						+ " ORDER BY num ASC";
				
				pstmt = conn.prepareStatement(sql); 
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					dto = new TodoDto();
					dto.setNum(rs.getInt("num"));
					dto.setWork(rs.getString("work"));
					dto.setRegdate(rs.getString("regdate"));
					
					list.add(dto);
				}
			}catch(Exception e) {
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
