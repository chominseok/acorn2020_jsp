package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
/*
 * 	[요청을 가로채서 중간에 원하는 작업을 할 수 있는 필터 만들기 ]
 * 
 * 1.javax.servlet.Filter 인터페이스를 구현한다.
 * 2.web.xml 문서에 필터를 정의하고 맵핑한다.
 * 3.doFilter() 메소드 안에서 원하는 작업을 한다.
 * */
public class EncodingFilter implements Filter{
	//인코딩 정보를 저장 할 필드 선언
	private String encoding;
	@Override
	public void destroy() {
		
	}

	@Override
	//HttpServlet의 부모type
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if(request.getCharacterEncoding() == null) {
			request.setCharacterEncoding(encoding);
		}
		//요청의 흐름 계속 이어가기   >>> 여기서 redirect 시키면 다른곳으로 이동   
		chain.doFilter(request, response);
	}
	//필터가 최초 사용될 때 1번 호출되는 메소드
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//web.xml 문서에 있는 내용을 읽어서 필드에 저장한다.
		encoding = filterConfig.getInitParameter("encoding");
	}

}
