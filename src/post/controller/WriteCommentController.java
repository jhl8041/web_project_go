package post.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import member.service.MemberService;
import member.service.MemberServiceImpl;
import model.Comment;
import model.Member;
import post.service.PostService;
import post.service.PostServiceImpl;

@WebServlet("/WriteCommentController")
public class WriteCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WriteCommentController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		
		MemberService mservice = new MemberServiceImpl();
		PostService pservice = new PostServiceImpl();
		
		int mseq =  Integer.parseInt(request.getParameter("mseq"));
		int pseq = Integer.parseInt(request.getParameter("pseq"));
		String content = request.getParameter("content");
		
		
		// comment 추가 
		Member m = mservice.getMember(mseq);
		
		System.out.println(m.getNickname() + ":" + content);
		
		pservice.addComment(pseq, m.getNickname(), content);
		  
		// comment list 불러오기 
		ArrayList<Comment> list = (ArrayList<Comment>)
		pservice.selectCommentBySeq(pseq);
		  
		//////////////////////////////////////// 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		PrintWriter out = response.getWriter(); 
		
		JSONArray total = new JSONArray();
		  
		int idx = 0; 
		for(Comment one : list) { 
			JSONObject obj = new JSONObject();
			obj.put("nickname", one.getBoard_comment_nickname());
			obj.put("content", one.getBoard_comment_content());
			obj.put("date", sdf.format(one.getBoard_comment_sysdate()));

			total.add(obj);
		}
		out.print(total);		 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
