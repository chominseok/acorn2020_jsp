package cms;

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

@WebServlet("/cms/select")
public class select extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset = utf-8");
		resp.setCharacterEncoding("utf-8");
		PrintWriter pw = resp.getWriter();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
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
			
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			
			conn = DriverManager.getConnection(url, "scott", "tiger");
		} catch (ClassNotFoundException | SQLException e1) {
			e1.printStackTrace();
		}
		
		String sql = "SELECT * FROM MINSEOK"
				+ " ORDER BY num ASC";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				String name = rs.getString("name");
				String loc = rs.getString("loc");
				pw.println("<tr>");
					pw.println("<td>"+num+"</td>");
					pw.println("<td>"+name+"</td>");
					pw.println("<td>"+loc+"</td>");
				pw.println("</tr>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		pw.println("</table>");
		pw.println("</body>");
		pw.println("</html>");
		
	}//service();
}
