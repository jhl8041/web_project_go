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

@WebServlet("/NicknameCheckController")
public class NicknameCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NicknameCheckController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		MemberService service = new MemberServiceImpl();
		
		String nickname = request.getParameter("nickname");
        PrintWriter out = response.getWriter();       
        
        String nicknamecheck=null;
        if (nickname.equals(""))
        	nicknamecheck = "empty";
        else {
        	if (service.findSameNickname(nickname))
        		nicknamecheck = "notunique";
    	
            else 
            	nicknamecheck = "unique";
        }
        
        out.print(nicknamecheck);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
