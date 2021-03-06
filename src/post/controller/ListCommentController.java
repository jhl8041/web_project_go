package post.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sun.jmx.snmp.Timestamp;
import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils.Collections;
import member.service.MemberService;
import member.service.MemberServiceImpl;
import model.Comment;
import model.Member;
import post.service.PostService;
import post.service.PostServiceImpl;

@WebServlet("/ListCommentController")
public class ListCommentController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public ListCommentController() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");
		
		PostService service = new PostServiceImpl();

		MemberService mservice= new MemberServiceImpl();

		int pseq = Integer.parseInt(request.getParameter("pseq"));
		int mseq = Integer.parseInt(request.getParameter("mseq"));

		// comment list 가져오기
		ArrayList<Comment> list = (ArrayList<Comment>) service.selectCommentBySeq(pseq);
		// 해당 멤버 가져오기
		Member m = mservice.getMember(mseq);
		String mnickname = m.getNickname();
				
		////////////////////////////////////////////////////
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		PrintWriter out = response.getWriter(); 
		
		JSONArray total = new JSONArray();
		
		for(Comment one : list) { 
			JSONObject obj = new JSONObject();
			obj.put("nickname", one.getBoard_comment_nickname());
			obj.put("content", one.getBoard_comment_content());
			obj.put("date", sdf.format(one.getBoard_comment_sysdate()));
			
			if(mnickname.equals(one.getBoard_comment_nickname())) obj.put("writer", "1");
			else obj.put("writer", "0");

			total.add(obj);
		}

		out.print(total);
		 
		///////////////////////////////////////////////////
		
		/*
		JSONObject total = new JSONObject();
				
		
		int idx = 0;
		for(Comment one : list) {
			System.out.println(sdf.format(one.getBoard_comment_sysdate()));
			
			String value = one.getBoard_comment_nickname() + ": " + one.getBoard_comment_content() + " (" + one.getBoard_comment_sysdate() + ")";
			String key = "list" + idx++;
			
			total.put(key, value);
		}		
		
		
		out.print(total);
		*/
		
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

