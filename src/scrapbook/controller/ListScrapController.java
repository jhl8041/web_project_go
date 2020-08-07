package scrapbook.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import model.ScrapBook;
import scrapbook.service.ScrapService;
import scrapbook.service.ScrapServiceImpl;

@WebServlet("/ListScrapController")
public class ListScrapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListScrapController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");
		
		int mseq = Integer.parseInt(request.getParameter("mseq"));
		
		ScrapService service = new ScrapServiceImpl();
		
		ArrayList<ScrapBook> scraplist = service.list(mseq);
		
		////////////////////////////////////////////////
		PrintWriter out = response.getWriter(); 
		
		JSONArray total = new JSONArray();
		
		for(ScrapBook one : scraplist) {
			JSONObject obj = new JSONObject();
			obj.put("name", one.getPostName());
			obj.put("start", one.getPostPeriodStart().toString());
			obj.put("end", one.getPostPeriodEnd().toString());
			obj.put("link", one.getPostLink().toString());
			
			total.add(obj);
		}
		out.print(total);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
