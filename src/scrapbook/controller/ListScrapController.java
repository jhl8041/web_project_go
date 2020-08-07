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

/**
 * Servlet implementation class ListScrapController
 */
@WebServlet("/ListScrapController")
public class ListScrapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListScrapController() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mseq = Integer.parseInt(request.getParameter("mseq"));
		
		ScrapService service = new ScrapServiceImpl();
		
		ArrayList<ScrapBook> list = service.list(mseq);
		
		////////////////////////////////////////////////
		PrintWriter out = response.getWriter();
		
		JSONArray total = new JSONArray();
		
		int idx = 0;
		for(ScrapBook one : list) {
			JSONObject obj = new JSONObject();
			obj.put("name", one.getPostName());
			obj.put("start", one.getPostPeriodStart());
			obj.put("end", one.getPostPeriodEnd());
			obj.put("link", one.getPostLink());
			
			total.add(obj);
		}
		out.print(total);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
