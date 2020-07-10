package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
	private static UsersDao dao;
	
	private UsersDao() {}
	
	public static UsersDao getInstance() {
		if(dao == null) {
			dao = new UsersDao();
		}
		return dao;
	}
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Connection conn = null;
	
	public UsersDto getPwd(String id) {
		UsersDto dto = null;

		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "SELECT pwd FROM users"
					+ " WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setString(1, id);
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				dto = new UsersDto();
				dto.setPwd(rs.getString("pwd"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return dto;
	}
	
	public boolean updatePwd(UsersDto dto) {
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();

			String sql = "UPDATE users"
					+ " SET pwd = ?"
					+ " WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPwd());
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
	
	public boolean delete(String id) {
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();

			String sql = "DELETE FROM users"
					+ " WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public UsersDto getDate(String id) {
		UsersDto dto = null;
		try {
			
			conn = new DbcpBean().getConn();
			
			String sql = "SELECT pwd, email, profile, regdate"
					+ " FROM users"
					+ " WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); 
			if (rs.next()) {
				dto = new UsersDto();
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				dto.setProfile(rs.getString("profile"));
				dto.setRegdate(rs.getString("regdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return dto;
	}
	
	public boolean isValid(UsersDto dto) {
		boolean isValid = false;
		try {
			conn = new DbcpBean().getConn();
			
			String sql = "SELECT id FROM users"
					+ " WHERE id = ? AND pwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			 
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				//return true;
				isValid = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return isValid;
	}
	
	public boolean insert(UsersDto dto) {
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();

			String sql = "INSERT INTO users"
					+ " (id, pwd, email, regdate)"
					+ " VALUES(?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
}
