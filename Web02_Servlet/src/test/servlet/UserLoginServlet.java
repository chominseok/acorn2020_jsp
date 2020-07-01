package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/users/login")
public class UserLoginServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset = utf-8");
		
		PrintWriter pw = resp.getWriter();
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		//id 구라 pwd 비밀번호 >> 둘 중 하나라도 틀리면 로그인 실패  아이디 혹은 비밀번호가 틀렸습니다.
		//로그인에 성공하면 gura님이 로그인 되었습니다. 를 출력
		
		
		
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset = 'utf-8'/>");
		pw.println("<title>회원목록 페이지</title>");
		pw.println("<link rel=\"stylesheet\" href=\"/Web02_Servlet/css/bootstrap.css\"/>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>로그인</h1>");
		pw.println("<div class='container'>");
		if(id.equals("구라") && pwd.equals("1234")) {
			pw.println("<p class='alert alert-success'>"+id+"님이 로그인 되었습니다.<a class='alert-link' "
					+ "href= '../index.html'>확인</a>");
		}else {
			pw.println("<p class='alert alert-danger'>로그인에 실패하였습니다.");
		}
		pw.println("<div>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
