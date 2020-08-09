package post.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
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

@WebServlet("/DelCommentController")
public class DelCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DelCommentController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("utf-8");

		int pseq = Integer.parseInt(request.getParameter("pseq"));
		int mseq = Integer.parseInt(request.getParameter("mseq"));
		int idx = Integer.parseInt(request.getParameter("idx"));

		PostService pservice = new PostServiceImpl();
		MemberService mservice= new MemberServiceImpl();

		// comment list 
		ArrayList<Comment> clist = (ArrayList<Comment>)pservice.selectCommentBySeq(pseq);

		// delete
		int i = 0;
		for(Comment one : clist) {
			if(i == idx) {
				System.out.println(one.getBoard_comment_sysdate());
				pservice.delComment(pseq, one.getBoard_comment_sysdate());
				break;
			}
			i++;
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/ListCommentController");
		if(dispatcher != null) {
			dispatcher.forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}