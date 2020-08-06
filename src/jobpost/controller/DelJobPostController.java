package jobpost.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jobpost.service.JobPostService;
import jobpost.service.JobPostServiceImpl;

@WebServlet("/DelJobPostController")
public class DelJobPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DelJobPostController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");
		PrintWriter out = response.getWriter();
		
		try {
			JobPostService service = new JobPostServiceImpl();
			int num = Integer.parseInt(request.getParameter("num"));
			service.delPost(num);
			out.print("success");
		}catch(Exception e) {
			out.print("fail");
		}
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
