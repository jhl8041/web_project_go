package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.MemberService;
import member.service.MemberServiceImpl;

/**
 * Servlet implementation class idCheckController
 */
@WebServlet("/IdCheckController")
public class IdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IdCheckController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		response.setCharacterEncoding("euc-kr");
		
		MemberService service = new MemberServiceImpl();
		
		String id = request.getParameter("id");
		
        PrintWriter out = response.getWriter();
        
        String idPattern = "^[a-z0-9]{6,}$";
        Matcher matcher = Pattern.compile(idPattern).matcher(id);       
        
        String idcheck=null;
        if (id.equals(""))
        	idcheck = "empty";
        else {
        	if (id.length()<6)
        		idcheck = "short";
        	
        	else if (!matcher.matches())
        		idcheck = "wrongChar";
        	
        	else if (service.findSameId(id))
            	idcheck = "notunique";
    	
            else 
            	idcheck = "unique";
        }
        
        out.print(idcheck);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
