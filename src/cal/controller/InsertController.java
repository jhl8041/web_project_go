package cal.controller;

import java.awt.print.Printable;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import comm.commodule;
import model.CalPostVo;
import model.CalVo;
import calpost.service.CalpostService;
import calpost.service.CalpostServiceImpl;
import cal.service.CalService;
import cal.service.CalServiceImpl;



/**
 * Servlet implementation class InsertController
 */
@WebServlet("/InsertController")
public class InsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		CalService service = new CalServiceImpl();
		CalpostService servicep = new CalpostServiceImpl();
		
		
//String c_mdate = request.getParameter("c_mdate");
//		HttpSession session = request.getSession(false);
	//	String c_id = (String) session.getAttribute("id");
		
		ArrayList<CalVo> list = (ArrayList<CalVo>) service.CalList("abc");
		ArrayList<CalPostVo> plist = (ArrayList<CalPostVo>) servicep.CalPostList("abc");
		
		
		request.setAttribute("list", list);
		request.setAttribute("plist", plist);
		
		
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		String paramYear = request.getParameter("year");
		String paramMonth = request.getParameter("month"); 
		
		cal.set(year, month-1,1);
		int dayofweek = cal.get(Calendar.DAY_OF_WEEK);
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		
	
			request.setAttribute("month", month);
			request.setAttribute("year", year);
			request.setAttribute("dayofweek", dayofweek);
			request.setAttribute("lastDay", lastDay);
			request.setAttribute("paramYear", paramYear);
			request.setAttribute("paramMonth", paramMonth);
		
			System.out.println(dayofweek);
			
		String path = "calandar/cal3.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(path);
		if (rd!=null) {
			rd.forward(request, response);
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
