package calpost.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import calpost.service.CalpostService;
import calpost.service.CalpostServiceImpl;
import model.CalVo;
import model.Comment;
import model.Member;
import model.ScrapBook;
import post.service.PostService;
import post.service.PostServiceImpl;
import scrapbook.service.ScrapService;
import scrapbook.service.ScrapServiceImpl;

/**
 * Servlet implementation class SearchCalendarController
 */
@WebServlet("/ListCalendarController")
public class ListCalendarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListCalendarController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");
		
		CalpostService service = new CalpostServiceImpl();
		ScrapService servicescrap = new ScrapServiceImpl();
		
		HttpSession session = request.getSession(false);

		Member m = (Member) session.getAttribute("userinfo");
		int num = m.getNum();
		
		ArrayList<CalVo> list = (ArrayList<CalVo>) service.getAllPost(num);
		ArrayList<ScrapBook> scraplist = servicescrap.list(num);
			
		////////////////////////////////////////////////////
		SimpleDateFormat year = new SimpleDateFormat("yyyy");
		SimpleDateFormat month = new SimpleDateFormat("MM");
		SimpleDateFormat day = new SimpleDateFormat("dd");
		
		PrintWriter out = response.getWriter(); 
		
		JSONArray totalcal = new JSONArray();
		
		for(ScrapBook one : scraplist) {
			JSONObject obj = new JSONObject();
			obj.put("title", one.getPostName());
			obj.put("content", "");
					
			obj.put("syear", year.format(one.getPostPeriodStart()));
			obj.put("smonth", month.format(one.getPostPeriodStart()));
			obj.put("sday", day.format(one.getPostPeriodStart()));
			
			obj.put("eyear", year.format(one.getPostPeriodEnd()));
			obj.put("emonth", month.format(one.getPostPeriodEnd()));
			obj.put("eday", day.format(one.getPostPeriodEnd()));
			
			totalcal.add(obj);
		}
		
		for(CalVo one : list) { 
			JSONObject obj = new JSONObject();
			obj.put("title", one.getTitle());
			obj.put("content", one.getContent());
			
			obj.put("syear", year.format(one.getStartdate()));
			obj.put("smonth", month.format(one.getStartdate()));
			obj.put("sday", day.format(one.getStartdate()));
			
			obj.put("eyear", year.format(one.getEnddate()));
			obj.put("emonth", month.format(one.getEnddate()));
			obj.put("eday", day.format(one.getEnddate()));

			totalcal.add(obj);
		}
		

		out.print(totalcal);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
