package test.test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.test.dto.TestDto;
import test.util.DbcpBean;

public class TestDao {
	private static TestDao dao;
	
	private TestDao() {}
	
	public static TestDao getInstance() {
		if(dao == null) {
			dao = new TestDao();
		}
		
		return dao;
	}
	//new DbcpBean().getConn();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	//delete 구문
	public void deleteDao(int num) {
		
		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM test"
					+ " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
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
	}
	
	//select 구문
	public List<TestDto> selectDao(){
		List<TestDto> list = new ArrayList<>();
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT * FROM test"
					+ " ORDER BY num ASC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("num");
				String content = rs.getString("content");
				String regdate = rs.getString("regdate");
				
				TestDto dto = new TestDto();
				
				dto.setNum(num);
				dto.setContent(content);
				dto.setRegdate(regdate);
				list.add(dto);
			}
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
		
		return list;
	}
	
	//insert 구문
	public void insertDao(TestDto dto) {
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO test"
					+ " VALUES (test_seq.NEXTVAL, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			pstmt.executeUpdate();
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
	}
}
