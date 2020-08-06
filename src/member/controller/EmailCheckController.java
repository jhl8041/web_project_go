package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.MemberService;
import member.service.MemberServiceImpl;

@WebServlet("/EmailCheckController")
public class EmailCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EmailCheckController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		response.setCharacterEncoding("euc-kr");
		
		MemberService service = new MemberServiceImpl();
		
		String email = request.getParameter("email");
        PrintWriter out = response.getWriter();
        
        String emailcheck=null;
        if (email.equals(""))
        	emailcheck = "empty";
        else {
        	if (service.findSameEmail(email))
        		emailcheck = "notunique";
    	
            else 
            	emailcheck = "unique";
        }
        
        out.print(emailcheck);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
