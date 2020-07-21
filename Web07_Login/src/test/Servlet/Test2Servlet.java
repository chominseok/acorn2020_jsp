package test.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test2")
public class Test2Servlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset = utf-8");
		PrintWriter pw = resp.getWriter();
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		
		pw.println("<h1>"+name+"</h1>");
		pw.println("<h1>"+age+"</h1>");
	}
}
