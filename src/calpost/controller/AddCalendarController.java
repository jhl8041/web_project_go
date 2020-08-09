package calpost.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import calpost.service.CalpostService;
import calpost.service.CalpostServiceImpl;
import model.Board;
import model.Board_comment;
import model.CalVo;
import model.Member;


@WebServlet("/AddCalendarController")
public class AddCalendarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddCalendarController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청과 응답의 인코딩 설정
				request.setCharacterEncoding("euc-kr");
				response.setContentType("text/html; charset=EUC-KR");
				response.setCharacterEncoding("euc-kr");
				
				try {
					CalpostService service = new CalpostServiceImpl();
					HttpSession session = request.getSession(false);
						
					String calname = request.getParameter("calname");
					String calcontent = request.getParameter("calcontent");
					String calstart = request.getParameter("calstart");
					String calend = request.getParameter("calend");
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
					java.util.Date datestart = sdf.parse(calstart);
					java.util.Date dateend = sdf.parse(calend);
					java.sql.Date sqlcalstart = new Date(datestart.getTime());
					java.sql.Date sqlcalend = new Date(dateend.getTime());
					
					Member m = (Member) session.getAttribute("userinfo");
					
					CalVo c = new CalVo(0,m.getNum(),m.getId(),calname,calcontent,sqlcalstart,sqlcalend,null);
					
					service.addcalpost(c);
					System.out.println("addcontroller complete");
					RequestDispatcher dispatcher = request.getRequestDispatcher("calendar2/calendar2.jsp");
					if (dispatcher != null) {
						dispatcher.forward(request, response);
					}
					
				}catch(Exception e) {
					e.printStackTrace();
				}
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
