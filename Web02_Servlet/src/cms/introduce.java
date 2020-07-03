package cms;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/cms/introduce")
public class introduce extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset = utf-8 "); 
		
		PrintWriter pw = resp.getWriter();
		
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset = 'utf-8'/>");
		pw.println("<title>자기소개 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>PrintWriter로 작성하는 개고생 자기소개 페이지</h1>");
		pw.println("<p>이름 : 조민석</p>");
		pw.println("<p>나이 : 27</p>");
		pw.println("<p>사는 곳 : 마포</p>");
		pw.println("<p>장래희망 : 정년퇴직</p>");
		pw.println("<p> <a href=\"/Web02_Servlet/MainPage.html\">돌아가기</a></p>");
		pw.println("</body>");
		pw.println("</html>");
		
		pw.println("");
		pw.close();   
	}
}
