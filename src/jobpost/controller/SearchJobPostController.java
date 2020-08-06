package jobpost.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jobpost.service.JobPostService;
import jobpost.service.JobPostServiceImpl;
import model.JobPost;

import org.json.simple.JSONObject;

/**
 * Servlet implementation class SearchJobPostController
 */
@WebServlet("/SearchJobPostController")
public class SearchJobPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchJobPostController() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");
		
		PrintWriter out = response.getWriter();
		
		JobPostService service = new JobPostServiceImpl();
		JobPost jp = service.getPost(Integer.parseInt(request.getParameter("num")));
		
		JSONObject jpobj = new JSONObject();
		jpobj.put("postcorpname", jp.getPostCorpName());
		jpobj.put("postname", jp.getPostName());
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		jpobj.put("poststart", dateFormat.format(jp.getPostPeriodStart()));
		jpobj.put("postend", dateFormat.format(jp.getPostPeriodEnd()));
		
		jpobj.put("posturl", jp.getPostUrl());
		jpobj.put("postimg", jp.getPostImg());
		jpobj.put("postcontent", jp.getPostContent());
		jpobj.put("type", jp.getPostClassiCode());
		
		// 숨겨짐
		jpobj.put("like", jp.getPostLike());
		jpobj.put("dislike", jp.getPostDislike());
		jpobj.put("view", jp.getPostView());
		
		
		out.print(jpobj);
		
		

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
