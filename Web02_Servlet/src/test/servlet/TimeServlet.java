package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//  ' / ' 가 항상 webcontent를 가리키는 것은 아니다, 때로는 최상위 경로를 가르키기도 함.
@WebServlet("/time")
public class TimeServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		//응답 컨텐트 type 설정
		resp.setContentType("text/html;charset = utf-8");
									
		PrintWriter pw = resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset = 'utf-8'/>");
		pw.println("<title>현재시간 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		
		//Date 객체를 이용해서 현재 날짜, 시간을 문자열로 얻어내기
		Date d = new Date();
		String now = d.toString();
		
		//클라이언트 웹브라우저에 응답하기
		pw.println("<p>현재 시간 : "+now+"</p>");
		pw.println("<img src = '/Web02_Servlet/images/0.png'>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();   
	}
}
