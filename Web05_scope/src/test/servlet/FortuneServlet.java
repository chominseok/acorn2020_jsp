package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 *  위임하는 형식은  분업으로 작업을 한다.
 *  
 *  요청을 servlet으로 주면 응답은 jsp가 한다.  >>servlet은 html을 작성하기 힘든 반면 for, if , sql 작성에 용이하다
 *  								반면, jsp는 html 작성이 편한반면 복잡한 코딩을 하기에 부적합하다
 *  !!!! 요놈들을 짬뽕 시켜서 sevlet에는 복작한 코딩을, jsp에는 html을 작성한다.  >>(항상 그런건 x, 대게적으로,)
 * */
@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset = utf-8");
		
		String fortuneToday = "동쪽으로 가면 귀인을 만나요";
		
		//코딩의 수행결과 data를 HttpServletRequest 객체에 담는다.
		//request 영역(scope)에 담는다.> 라고한다.
		
		//fortuneToday라는 key값으로 String type의 참조값 담기
		req.setAttribute("fortuneToday", fortuneToday);
		
		//jsp 페이지로 응답을 위임한다.(forward 이동)
		RequestDispatcher rd = req.getRequestDispatcher("/test/fortune.jsp");
		rd.forward(req, resp);
	}
}
