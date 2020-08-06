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

@WebServlet("/MyInfoController")
public class MyInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyInfoController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");

		MemberService service = new MemberServiceImpl();
		HttpSession session = request.getSession(false);
		
		Member m = (Member)session.getAttribute("userinfo");
		
		String id = m.getId();
		
		m = (Member) service.getMember(id);
		
		request.setAttribute("userinfo", m);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/MyInfo.jsp");
		if(dispatcher != null) {
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}



