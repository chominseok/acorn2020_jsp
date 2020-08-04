package test.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.file.dao.FileDao;
import test.file.dto.FileDto;

@WebServlet("/file_list")
public class FileListServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1.파일 목록을 얻어오는 비지니스 로직 수행
		FileDto dto = new FileDto();
		dto.setStartRowNum(1);
		dto.setEndRowNum(5);
		
		List<FileDto> list = FileDao.getInstance().getList(dto);
		
		//2.비지니스 수행결과 데이터를 request 영역에 담기
		req.setAttribute("list", list);
		
		//3.foward
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF//view/file/list.jsp");
		rd.forward(req, resp);
	}
}
