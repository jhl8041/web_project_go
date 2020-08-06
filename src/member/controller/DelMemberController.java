package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jobpost.service.JobPostService;
import jobpost.service.JobPostServiceImpl;
import member.service.MemberService;
import member.service.MemberServiceImpl;


@WebServlet("/DelMemberController")
public class DelMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DelMemberController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");
		
		MemberService service = new MemberServiceImpl();
		String id = request.getParameter("id");
		service.delMember(id);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/LogoutController");
		if(dispatcher != null) {
			dispatcher.forward(request, response);
		}		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
