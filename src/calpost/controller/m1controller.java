package calpost.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cal.service.CalService;
import cal.service.CalServiceImpl;
import model.CalPostVo;
import model.CalVo;
import calpost.service.CalpostService;
import calpost.service.CalpostServiceImpl;

@WebServlet("/m1controller")
public class m1controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public m1controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CalService service = new CalServiceImpl();
		CalpostService servicep = new CalpostServiceImpl();
		
		ArrayList<CalVo> list = (ArrayList<CalVo>) service.CalList("abc");
		ArrayList<CalPostVo> plist = (ArrayList<CalPostVo>) servicep.CalPostList("abc");
		
		
		request.setAttribute("list", list);
		request.setAttribute("plist", plist);
		
		
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		String paramYear = request.getParameter("year");
		String paramMonth = request.getParameter("month"); 
		
		if(paramYear != null)
			year = Integer.parseInt(paramYear);
		if(paramMonth != null)
			month = Integer.parseInt(paramMonth);
	 	if(month>12)
			month=1; year = year+1;
		if(month<1)
			month=12; year = year-1;
			cal.set(year, month-1,1);
			int dayofweek = cal.get(Calendar.DAY_OF_WEEK);
			int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			
		String path = "cal.jsp";
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
