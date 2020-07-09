package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//web.xml에 필터 정의와 필터 맵핑을 어노테이션을 이용해서 할 수 있다. >>param이 필요하면? 있으면 xml에
@WebFilter("/member/*")
public class LoginFilter implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//클라이언트가 로그인 했는지 여부를 확인한다. 부모인 ServletRequest은 getSession이 없으므로
		//세션을 가져오지 못한다 따라서 HttpServletRequest를 통해서 형변환을 시킨 뒤 가져온다.
		HttpServletRequest req = (HttpServletRequest)request;
		//HttpSession 객체의 참조값을 얻어낸다.
		HttpSession session = req.getSession();
		//로그인 된 아이디가 있는지 얻어와본다.
		String id = (String)session.getAttribute("id");
		if(id != null) {
			chain.doFilter(request, response);
		}else {
			//로그인 폼으로 강제 리다이렉트
			HttpServletResponse res = (HttpServletResponse)response;
			String cPath = req.getContextPath();
			res.sendRedirect(cPath+"/test/loginForm.jsp");
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}
}
