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

import javax.mail.Transport;
import javax.mail.Message;
import javax.mail.Address;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Session;
import mail.SMTPAuthenticatior;
import javax.mail.Authenticator;
import java.util.Properties;
import java.util.Random;

@WebServlet("/SendNewPwdController")
public class SendNewPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SendNewPwdController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		MemberService service = new MemberServiceImpl();
		
		String id = request.getParameter("id");
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
		
		
		if (service.matchInfo(id, email, name, birthdateSql)) {
			Random rand = new Random();
			StringBuffer pwdsb = new StringBuffer();
			for(int i=0;i<10;i++) {
				int index = rand.nextInt(3);
				switch(index) {
					case 0:
						pwdsb.append((char)(rand.nextInt(26) + 97));
						break;
					case 1:
						pwdsb.append((char)(rand.nextInt(26) + 65));
						break;
					case 2:
						pwdsb.append(rand.nextInt(10));
						break;
				}
			}
			
			String newPwd = pwdsb.toString();
			service.updatePwd(id, newPwd);
			
			String to = email;
			String content = "회원님의 새로운 비밀번호는: [" + newPwd + "] 입니다";
			try {
				Properties p = new Properties(); // 정보를 담을 객체
				 
				p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP

				p.put("mail.smtp.port", "465");
				p.put("mail.smtp.starttls.enable", "true");
				p.put("mail.smtp.auth", "true");
				p.put("mail.smtp.debug", "true");
				p.put("mail.smtp.socketFactory.port", "465");
				p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				p.put("mail.smtp.socketFactory.fallback", "false");
				// SMTP 서버에 접속하기 위한 정보들
				 
				Authenticator auth = new SMTPAuthenticatior();
				Session ses = Session.getInstance(p, auth);
				 
				ses.setDebug(true);
				 
				MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
				msg.setSubject("[GO!] 비밀번호 재설정 이메일입니다"); // 제목
				 
				Address fromAddr = new InternetAddress("jhl8041@naver.com");
				msg.setFrom(fromAddr); // 보내는 사람
				 
				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
				 
				msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
				 
				Transport.send(msg);
				
				out.print("success");
			}catch(Exception e) {
				out.print("fail");
			}
		}
		else {
			System.out.println("fail");
			out.print("fail");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
