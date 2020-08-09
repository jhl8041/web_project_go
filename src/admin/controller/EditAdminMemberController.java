package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;

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

@WebServlet("/EditAdminMemberController")
public class EditAdminMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditAdminMemberController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(false);
		Member mtmp = (Member) session.getAttribute("userinfo");
		
		PrintWriter out = response.getWriter();
		
		MemberService service = new MemberServiceImpl();
		Member m = new Member();
		
		try {
			m.setId(request.getParameter("id"));
			m.setPwd(request.getParameter("pwd"));
			m.setName(request.getParameter("name"));
			m.setNickname(request.getParameter("nickname"));
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			java.util.Date birthdate = sdf.parse(request.getParameter("birthdate"));
			java.sql.Date sqlbirthdate = new Date(birthdate.getTime());
			m.setBirthdate(sqlbirthdate);
		

			m.setGender(request.getParameter("gender"));
			m.setAddress(request.getParameter("addr"));
			m.setPhone(request.getParameter("phone"));
			m.setEmail(request.getParameter("email"));
			
			String eng,noneng,capital,noncapital;
			
			if (request.getParameter("eng").equals("0")) eng="0";
			else eng="1";
			
			if (request.getParameter("noneng").equals("0")) noneng="0";
			else noneng = "1";
			
			if (request.getParameter("capital").equals("0")) capital="0";
			else capital="1";
			
			if (request.getParameter("noncapital").equals("0")) noncapital="0";
			else noncapital="1";
			
			m.setPrefCode(eng+noneng+capital+noncapital);
			
			if (request.getParameter("pwd").isEmpty()){
				System.out.println("err");
				out.print("err");
			}
			
			service.editMemberwithid(m);
				
			out.print("success");
		}catch(Exception e) {
			e.printStackTrace();
			out.print("fail");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
