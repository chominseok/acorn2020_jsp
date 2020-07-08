package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test")
public class TestServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset = utf-8");
		resp.setCharacterEncoding("utf-8");
		
		String test = "테스트합니다!";
		
		//scope > test.jsp
		
		req.setAttribute("test", test);
		
		RequestDispatcher rd = req.getRequestDispatcher("test/test.jsp");
		rd.forward(req, resp);
	}
}
