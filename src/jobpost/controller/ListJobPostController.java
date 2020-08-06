package jobpost.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jobpost.service.JobPostService;
import jobpost.service.JobPostServiceImpl;
import model.JobPost;

/**
 * Servlet implementation class ListJobPostController
 */
@WebServlet("/ListJobPostController")
public class ListJobPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListJobPostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");
		
		JobPostService service = new JobPostServiceImpl();
		
		ArrayList<JobPost> list = (ArrayList<JobPost>) service.getPostAll();
		
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/AdminPage/JobPostEditForm.jsp");
		if (dispatcher !=null)
			dispatcher.forward(request,response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
