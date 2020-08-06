package member.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.MemberService;
import member.service.MemberServiceImpl;
import model.Member;

@WebServlet("/JoinController")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		response.setCharacterEncoding("euc-kr");
		
		MemberService service = new MemberServiceImpl();
		Member m = new Member();
		
		m.setId(request.getParameter("id"));
		m.setPwd(request.getParameter("pwd"));
		m.setName(request.getParameter("name"));
		m.setNickname(request.getParameter("nickname"));
		m.setPhone(request.getParameter("phone"));
		
		// 생년월일 처리 //
		String birthyear = request.getParameter("birthyear");
		String birthmonth = request.getParameter("birthmonth");
		String birthday = request.getParameter("birthday");
		if (Integer.parseInt(birthmonth)<10) birthmonth = "0"+birthmonth;
		if (Integer.parseInt(birthday)<10) birthday = "0"+birthday;
		
		String birthdate = birthyear+"-"+birthmonth+"-"+birthday;
		Date birthdateSql = Date.valueOf(birthdate);
		m.setBirthdate(birthdateSql);
		// 생년월일 처리 끝 //
		
		m.setEmail(request.getParameter("email"));
		m.setGender(request.getParameter("gender"));
		m.setAddress(request.getParameter("roadAddrPart1")+" "+request.getParameter("addrDetail"));
		
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
			
		service.join(m);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/LoginForm.jsp");
		if (dispatcher != null)
			dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
