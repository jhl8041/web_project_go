package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.mail.Transport;
import javax.mail.Message;
import javax.mail.Address;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Session;
import mail.SMTPAuthenticatior;
import javax.mail.Authenticator;
import java.util.Properties;

@WebServlet("/SendEmailCodeController")
public class SendEmailCodeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SendEmailCodeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("utf-8");
		 
		String to = request.getParameter("to");
		String content = "회원님의 인증코드는: [" + request.getParameter("content") + "] 입니다";
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
			msg.setSubject("[GO!] 회원가입 인증메일 입니다"); // 제목
			 
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
