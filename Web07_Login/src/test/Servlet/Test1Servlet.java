package test.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test1")
public class Test1Servlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset = utf-8");
		resp.setCharacterEncoding("utf-8");
		
		PrintWriter pw = resp.getWriter();
		
		pw.println("<h1>hihihihihiiihihihihihihihiihi</h1>");
		pw.close();
	}
}
