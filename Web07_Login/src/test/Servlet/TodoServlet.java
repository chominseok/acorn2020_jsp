package test.Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/todo")
public class TodoServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1.할 일 목록을 얻어오는 비지니스 로직을 수행한다.
		List<String> todoList = new ArrayList<String>();
		todoList.add("html 공부하기");
		todoList.add("css 공부하기");
		todoList.add("javascript 공부하기");
		todoList.add("java 공부하기");
		
		//2.비지니스 수행결과 데이터를 request 영역에 담기
		req.setAttribute("todoList", todoList);
		
	 	RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF//view/todo/list.jsp");
	 	
		rd.forward(req, resp);
	}
}
