package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/todo/list")
public class TodoListServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset = utf-8");
		
		//DB에서 읽어온 할 일 목록이라고 가정하자
		List<String> list = new ArrayList<>();
		list.add("html 공부하기");
		list.add("css 공부하기");
		list.add("javascript 공부하기");
		
		PrintWriter pw = resp.getWriter();
		
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset = 'utf-8'/>");
		pw.println("<title>ready 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>오늘 할 일</h1>");
		pw.println("<ul>");
		for(String todo : list) {
			pw.println("<li>"+todo+"</li>");
		}
		
		pw.println("<br/>");
		pw.println("-------------------------------");
		pw.println("<br/>");
		pw.println("<br/>");
		
		for(int i = 0; i < list.size(); i++) {
			pw.println("<li>"+list.get(i)+"</li>");
		}
		
		pw.println("</ul>");
		pw.println("</body>");
		pw.println("</html>");
		//pw.close();
	}
}
