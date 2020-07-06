package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.Dto.MemberDto;

@WebServlet("/test1")
public class Test1Servlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset = utf-8");
		
		PrintWriter pw = resp.getWriter();
		
		List<MemberDto> list = new ArrayList<MemberDto>();
		
		list.add(new MemberDto(10,"민석","마포"));
		list.add(new MemberDto(11,"감영","동두천"));
	
		
		
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset = 'utf-8'/>");
		pw.println("<title>test</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<table border='1'>");
			pw.println("<tr>");
				pw.println("<th>번호</th>");
				pw.println("<th>이름</th>");
				pw.println("<th>주소</th>");
			pw.println("</tr>");
			
			for(MemberDto tmp : list) {
				pw.println("<tr>");
				pw.println(tmp.getNum()+" : "+tmp.getName()+" : "+tmp.getAddr());
				pw.println("<td>"+tmp.getNum()+"</td>");
				pw.println("<td>"+tmp.getName()+"</td>");
				pw.println("<td>"+tmp.getAddr()+"</td>");
				pw.println("</tr>");
			}
		pw.println("/table");
		pw.println("</body>");
		pw.println("</html>");
	}
}
