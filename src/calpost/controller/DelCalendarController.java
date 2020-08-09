package calpost.controller;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import calpost.service.CalpostService;
import calpost.service.CalpostServiceImpl;
import jobpost.service.JobPostService;
import jobpost.service.JobPostServiceImpl;
import model.Member;

@WebServlet("/DelCalendarController")
public class DelCalendarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DelCalendarController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession(false);
		Member m = (Member) session.getAttribute("userinfo");
		
		CalpostService service = new CalpostServiceImpl();
		int num = m.getNum();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		service.delcalpost(num, title, content);
		
		
		System.out.println("cal del controller complete");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("calendar2/calendar2.jsp");
		if (dispatcher != null) {
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
