package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

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
import model.JobPost;
import model.Member;

/**
 * Servlet implementation class EditMyInfoController
 */
@WebServlet("/EditMyInfoController")
public class EditMyInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditMyInfoController() {
        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");
		
		PrintWriter out = response.getWriter();
		
		MemberService service = new MemberServiceImpl();
		Member m = new Member();
		
		m.setId(request.getParameter("id"));
		m.setPwd(request.getParameter("pwd"));
		m.setName(request.getParameter("name"));
		m.setNickname(request.getParameter("nickname"));
		
		Date birthdateSql = Date.valueOf(request.getParameter("birthdate"));
		m.setBirthdate(birthdateSql);

		m.setGender(request.getParameter("gender"));
		m.setAddress(request.getParameter("addr"));
		m.setPhone(request.getParameter("phone"));
		m.setEmail(request.getParameter("email"));
		
		String eng,noneng,capital,noncapital;
		
		if (request.getParameter("eng")==null) eng="0";
		else eng="1";
		
		if (request.getParameter("noneng")==null) noneng="0";
		else noneng = "1";
		
		if (request.getParameter("capital")==null) capital="0";
		else capital="1";
		
		if (request.getParameter("noncapital")==null) noncapital="0";
		else noncapital="1";
		
		m.setPrefCode(eng+noneng+capital+noncapital);
		
		if (m.getPwd().isEmpty()) {
			service.editMemberNoPwd(m);
		}
		else {
			service.editMemberWithPwd(m);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("MyInfoController");
		if(dispatcher != null) {
			dispatcher.forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
