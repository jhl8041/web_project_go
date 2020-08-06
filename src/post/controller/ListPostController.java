package post.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Comment;
import model.JobPost;
import post.service.PostService;
import post.service.PostServiceImpl;

@WebServlet("/ListPostController")
public class ListPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListPostController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");
		
		PostService service = new PostServiceImpl();
		
		ArrayList<JobPost> list = (ArrayList<JobPost>) service.postList();
		
		request.setAttribute("posts", list);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/main/Main.jsp");
		if(dispatcher != null) {
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
