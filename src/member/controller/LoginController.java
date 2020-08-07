package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.MemberService;
import member.service.MemberServiceImpl;
import model.Member;


@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		response.setCharacterEncoding("euc-kr");
		
		MemberService service = new MemberServiceImpl();
		HttpSession session = request.getSession();
		
		boolean flag = false;
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		Member m = service.getMember(id);
						
		if (m!=null && pwd.equals((String)m.getPwd())) {
			session.setAttribute("userinfo", m);
			flag = true;
		}
		
		String path = "/member/LoginForm.jsp";

		if(flag) {
			path = "ListPostController?id=" + id;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);		
		if(dispatcher != null) {
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
