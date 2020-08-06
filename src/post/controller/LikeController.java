package post.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import model.JobPost;
import post.service.PostService;
import post.service.PostServiceImpl;

@WebServlet("/LikeController")
public class LikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LikeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");
		PrintWriter out = response.getWriter();
		
		PostService service = new PostServiceImpl();
		
		int seq =  Integer.parseInt(request.getParameter("seq"));
		int type = Integer.parseInt(request.getParameter("type"));
		
		if(type == 1) 		service.onLike(seq); 
		else if(type == 2) 	service.offLike(seq);
		else if(type == 3) 	service.onUnlike(seq);
		else if(type == 4)  service.offUnlike(seq);
		
		JobPost post = service.getPost(seq);
		
		//////////////////////////////////////////////
		JSONObject obj = new JSONObject();
		
		obj.put("good",	Integer.toString(post.getPostLike()));
		obj.put("bad", Integer.toString(post.getPostDislike()));				
		
		out.print(obj);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
