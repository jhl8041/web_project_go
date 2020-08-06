package post.controller;

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

import model.Comment;
import post.service.PostService;
import post.service.PostServiceImpl;

@WebServlet("/ListCommentController")
public class ListCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListCommentController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");
		PrintWriter out = response.getWriter();
		
		PostService service = new PostServiceImpl();

		int num = Integer.parseInt(request.getParameter("seq"));
		ArrayList<Comment> list = (ArrayList<Comment>) service.selectCommentBySeq(num);
		
		////////////////////////////////////////////////////
		JSONObject total = new JSONObject();
		
		int idx = 0;
		for(Comment one : list) {
			String value = one.getBoard_comment_nickname() + ": " + one.getBoard_comment_content() + " (" + one.getBoard_comment_sysdate() + ")";
			String key = "list" + idx++;
			
			total.put(key, value);
		}
		out.print(total);
		
		
		//System.out.println(total.get("list_1"));
		/*
		 * JSONObject total = new JSONObject();	
		 * int idx = 0; for(Comment one : list) { JSONObject obj = new JSONObject();
		 * JSONObject line = new JSONObject();
		 * 
		 * obj.put("nickname", one.getBoard_comment_nickname()); obj.put("content",
		 * one.getBoard_comment_content()); obj.put("date",
		 * one.getBoard_comment_sysdate());
		 * 
		 * total.put("value_" + idx, obj);
		 * 
		 * idx++; } System.out.println("size:" + total.size());
		 * System.out.println(total.get("value_1")); out.print(total);
		 */
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
