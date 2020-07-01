package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sub/fortune")
public class FortuneServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset = utf-8");
		
		PrintWriter pw = resp.getWriter();
		
		String[] ranStr = {"똥 밝았습니다.", "미끄러졌습니다.", "스피또 사세요.", "밤 길 조심하세요.", "집에 가세요"};
		
		Random ran = new Random();
		int ranNum = ran.nextInt(5);
		
		pw.println(ranStr[ranNum]);
		
		pw.println("<img src='/Web02_Servlet/images/blood"+ranNum+".png'>");
		//pw.println("<img src='/Web02_Servlet/images/blood'"+ranNum+"'.png'>");
		// <img src='/Web02_Servlet/images/blood'
	}
}
