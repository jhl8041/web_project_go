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


@WebServlet("/PwdCheckController")
public class PwdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PwdCheckController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
        PrintWriter out = response.getWriter();
        
        String pwPattern = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[$@$!%*#?&]).{8,}$";
        Matcher matcher = Pattern.compile(pwPattern).matcher(pwd);
        
        pwPattern = "(.)\\1\\1\\1";
        Matcher matcher2 = Pattern.compile(pwPattern).matcher(pwd);
        
        pwPattern = "^(?=.*[a-z]).{8,}$";
        Matcher strength1_1 = Pattern.compile(pwPattern).matcher(pwd);
        
        pwPattern = "^(?=.*[0-9]).{8,}$";
        Matcher strength1_2 = Pattern.compile(pwPattern).matcher(pwd);
        
        pwPattern = "^(?=.*[a-z])(?=.*[0-9]).{8,}$";
        Matcher strength2 = Pattern.compile(pwPattern).matcher(pwd);
        
        pwPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,}$";
        Matcher strength3_1 = Pattern.compile(pwPattern).matcher(pwd);
        
        pwPattern = "^(?=.*[a-z])(?=.*[$@$!%*#?&])(?=.*[0-9]).{8,}$";
        Matcher strength3_2 = Pattern.compile(pwPattern).matcher(pwd);
       
        String result = null;
        if (pwd.length()>7) {
        	if(matcher2.find())
            	result="fourChar";
            
            // 비밀번호에 아이디가 포함되어있을때 
            else if(pwd.contains(id) && !id.equals(""))
            	result="includeId";
            
            // 비밀번호에 공백이 포함되어있을때 
            else if(pwd.contains(" "))
            	result="includeSpace";
        	
            else if(matcher.matches()) 
        		result="strength4"; 
        	
            else if(strength3_1.matches() || strength3_2.matches()) 
        		result="strength3";
        	
            else if(strength2.matches())
        		result="strength2";
        	
            else if(strength1_1.matches() || strength1_2.matches())
        		result="strength1";
               	
        }
        else {
        	if(pwd.equals(""))
        		result = "empty";
        	else
        		result = "digit";
        }
     		
    	out.print(result);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
