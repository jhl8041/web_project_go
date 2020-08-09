package scrapbook.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import jobpost.service.JobPostService;
import jobpost.service.JobPostServiceImpl;
import model.JobPost;
import scrapbook.service.ScrapService;
import scrapbook.service.ScrapServiceImpl;

/**
 * Servlet implementation class AddScrapController
 */
@WebServlet("/AddScrapController")
public class AddScrapController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddScrapController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");

		int mseq = Integer.parseInt(request.getParameter("mseq"));
		int pseq = Integer.parseInt(request.getParameter("pseq"));

		// 공고추가
		ScrapService sbservice = new ScrapServiceImpl();
		JobPostService pservice = new JobPostServiceImpl();
		JobPost post = pservice.getPost(pseq);

		sbservice.add(mseq, post);

		// 공고갯수 업데이트
		int count = sbservice.list(mseq).size();

		PrintWriter out = response.getWriter(); 
		JSONObject obj = new JSONObject();
		obj.put("count", count);

		out.print(obj);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}