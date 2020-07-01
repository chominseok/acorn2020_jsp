package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test")
public class TestServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset = utf-8");
	
		//PrintWriter pw = resp.getWriter();
		//DB 연결객체를 담을 지역변수 만들기
		
		PrintWriter pw = resp.getWriter();
		
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset = 'utf-8'/>");
		pw.println("<title>회원목록 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>회원목록</h1>");
		pw.println("<table border=\"1\" cellspacing=\"0\">");
			pw.println("<tr>");
				pw.println("<th>번호</th>");
				pw.println("<th>이름</th>");
				pw.println("<th>주소</th>");
		pw.println("</tr>");
				Connection conn = null;
				try {
					//오라클 드라이버 로딩   >> 1. "  "  ?? 고정? ㅇㅇ 고정
					Class.forName("oracle.jdbc.driver.OracleDriver");
					
					//접속할 DB의 의 정보 @아이피주소 : port번호 : db이름   >>2. 정보와 주소 확인하는 법 >> 아이피 주소는 원격이 아닌이상 주소 확인해서 ㄱㄱ
					String url = "jdbc:oracle:thin:@localhost:1521:xe";
					
					//계정 비밀번호를 이용해서 Connection 객체의 참조값을 얻어오기
					conn = DriverManager.getConnection(url, "scott", "tiger");
					
					//예외가 발생하지 않고 여기까지 실행순서가 내려오면 접속 성공이다.
					System.out.println("Oracle DB 접속 성공");
				}catch(Exception e) {
					e.printStackTrace();
				}
				/*
				 * Statement 클래스
					- SQL 구문을 실행하는 역할
					- 스스로는 SQL 구문 이해 못함(구문해석 X) -> 전달역할
				 **/
				
				
				//select 작업을 위해서 필요한 객체의 참조값을 담을 지역변수 만들기
				PreparedStatement pstmt = null;
				ResultSet rs = null;  //결과가 있는 sql문이 있을 때 사용.
				
				try {
					//실행할 sql문                              
					String sql = "SELECT num, name, addr FROM member" //  <<형식만? ㅇㅇ 형식만 맞춰주면 됨, ! 대신 칼럼명은 같아야함
							+ " ORDER BY num ASC";  // <<<<<<<<<<<<<<<<<<<<<공백 주의!!
					//PreparedStatement 객체의 참조값 얻어오기
					pstmt = conn.prepareStatement(sql);  //conn에 넣은 계정으로 실행 할 sql문을 대입한다.
					
					//PreparedStatement 객체를 이용해서 query문을 수행하고 결과를 ResultSet 객체로 받아오기
					rs = pstmt.executeQuery();
					int count = 0;
					while(rs.next()) {  // 행 갯수만큼 반복문을 돌고 더이상 존재하지 않으면 false를 반환하여 반복문을 종료시킨다.
						int num = rs.getInt("num"); //정수 값을 받아올 때
						String name = rs.getString("name");  //문자열을 받아올 때
						String addr = rs.getString("addr");
						//출력하기
						//pw.println(count+"번 정보 : ");
						pw.println("<tr>");
							pw.println("<td>"+num+"</td>");
							pw.println("<td>"+name+"</td>");
							pw.println("<td>"+addr+"</td>");
						pw.println("</tr>");
						System.out.println(num+" | "+name+" | "+addr);
						//count++;
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				pw.println("</table>");
				pw.println("</body>");
				pw.println("</html>");
		
//		Connection conn = null;
//		
//		try {
//			//오라클 드라이버 로딩 
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			
//			//접속할 DB의 의 정보 @아이피주소 : port번호 : db이름 ㄱ
//			String url = "jdbc:oracle:thin:@localhost:1521:xe";
//			
//			//계정 비밀번호를 이용해서 Connection 객체의 참조값을 얻어오기
//			conn = DriverManager.getConnection(url, "scott", "tiger");
//			
//			//예외가 발생하지 않고 여기까지 실행순서가 내려오면 접속 성공이다.
//			System.out.println("Oracle DB 접속 성공");
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//			
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			
//			String sql = "SELECT num, content, regdate"
//					+ " FROM memo"
//					+ " WHERE num=?";
//			
//			try {
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1, 1);
//				rs = pstmt.executeQuery(); // !!!! 값을 넣기전에 쿼리문을 실행하면 못알아먹고 예외가 뜬다.
//				if(rs.next()) {
//					int num = rs.getInt("num");
//					String content = rs.getString("content");
//					String regdate = rs.getString("regdate");
//					pw.println("회원번호 : "+num+" 내용 : "+content+" 날짜 : "+regdate);
//					
//					//System.out.println("NUM : "+num+" CONTENT : "+content+" REGDATE : "+regdate);
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}finally {
//				try {
//					if(pstmt != null)pstmt.close();
//					if(conn != null)conn.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//			}
	}
}
