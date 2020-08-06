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

import model.Comment;
import post.service.PostService;
import post.service.PostServiceImpl;

/**
 * Servlet implementation class PostWriteController
 */
@WebServlet("/PostCommentController")
public class PostCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PostCommentController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");
		
		PostService service = new PostServiceImpl();
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		String nickname = request.getParameter("nickname");
		String content = request.getParameter("content");
		
		// 추가
		service.addComment(seq, nickname, content);
		
		// 갱신
		ArrayList<Comment> comment = service.selectCommentBySeq(seq);
		
		/////////////////////////////////////////////////////////////////////
		PrintWriter out = response.getWriter();
		JSONArray array = new JSONArray();
		array.add(comment);		
		out.print(array);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
