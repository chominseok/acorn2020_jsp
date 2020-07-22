package test.minseok.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.minseok.dto.MinseokDto;
import test.util.DbcpBean;

public class MinseokDao {
  private static MinseokDao dao;
  
  private MinseokDao() {}
  
  public static MinseokDao getInstance() {
	  if(dao == null) {
		  dao = new MinseokDao();
	  }
	  return dao;
  }
  
  	
  	//삭제하기
  	public boolean delete(int num) {
  		int flag = 0;
  		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = new DbcpBean().getConn();

			String sql = "DELETE FROM board_test"
					+ " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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
  
  	//인자로 전달되는 파일 번호에 해당하는 파일 정보를 리턴하는 메소드
	public MinseokDto getData(int num) {
		MinseokDto dto = null;
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "SELECT writer,title, orgFileName, saveFileName,"
					+ " fileSize, regdate"
					+ " FROM board_test"
					+ " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setInt(1, num);
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				dto = new MinseokDto();
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
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
  
  
  	//파일을 추가하는 메소드
  	public boolean insert(MinseokDto dto) {
  		int flag = 0;
  		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = new DbcpBean().getConn();

			String sql = "INSERT INTO board_test"
					+ " (num,writer,title,orgFileName,saveFileName,fileSize,regdate)"
					+ " VALUES(board_test_seq.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getOrgFileName());
			pstmt.setString(4, dto.getSaveFileName());
			pstmt.setLong(5, dto.getFileSize());
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
  
  	//전체 row의 갯수를 리턴해주는 메소드
	public int getCount() {
		//전체 row의 갯수를 담을 지역 변수
		int count = 0;
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			
			//ROW 중 가장 큰 숫자를 얻어오면 전체 ROW의 갯수가 된다.
			//ROW 가 NULL 일 때 0으로 바꿔준다.
			String sql = "SELECT NVL(MAX(ROWNUM),0) num"
					+ " FROM board_test";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 

			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				count = rs.getInt("num");  //num은 NVL(MAX(ROWNUM),0)의 별칭
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
		return count;
	}
  
	//파일 목록을 리턴해주는 메소드
	public List<MinseokDto> getList(MinseokDto dto){
		//파일 목록을 담을 ArrayList  객체 생성 
		List<MinseokDto> list=new ArrayList<>();
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "SELECT *"
					+ " FROM (SELECT result1.*, ROWNUM rnum"
					+ " FROM (SELECT num, writer, title, orgFileName, fileSize, regdate"
					+ " FROM board_test"
					+ " ORDER BY num DESC) result1)"
					+ " WHERE rnum BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			while (rs.next()) {

				MinseokDto tmp = new MinseokDto();
				
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setOrgFileName(rs.getString("orgFileName"));
				tmp.setFileSize(rs.getLong("fileSize"));
				tmp.setRegdate(rs.getString("regdate"));
				//ArrayList 객체에 누적 시킨다. 
				list.add(tmp);
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
		return list;
	}
}
