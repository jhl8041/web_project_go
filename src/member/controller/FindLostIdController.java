package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.MemberService;
import member.service.MemberServiceImpl;

@WebServlet("/FindLostIdController")
public class FindLostIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FindLostIdController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		MemberService service = new MemberServiceImpl();
		
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		
		//생년월일 처리
		String birthyear = request.getParameter("birthyear");
		String birthmonth = request.getParameter("birthmonth");
		String birthday = request.getParameter("birthday");
		if (Integer.parseInt(birthmonth)<10) birthmonth = "0"+birthmonth;
		if (Integer.parseInt(birthday)<10) birthday = "0"+birthday;
		String birthdate = birthyear+"-"+birthmonth+"-"+birthday;
		Date birthdateSql = Date.valueOf(birthdate);
		
		String id = service.findLostId(email, name, birthdateSql);
		
		if (id!=null) {
			out.print(id);
		}
		else {
			out.print("fail");
		}
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
