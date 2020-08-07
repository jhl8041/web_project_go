package post.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.MemberService;
import member.service.MemberServiceImpl;
import model.Comment;
import model.JobPost;
import model.Member;
import model.ScrapBook;
import post.service.PostService;
import post.service.PostServiceImpl;
import scrapbook.service.ScrapService;
import scrapbook.service.ScrapServiceImpl;

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
		
		PostService pservice = new PostServiceImpl();
		MemberService mservice = new MemberServiceImpl();
		ScrapService sbservice = new ScrapServiceImpl();
		
		String id = request.getParameter("id");
		int sbcount = 0;
		
		// scrapbook 개수
		if(!id.equals("0")) {
			int mseq = mservice.getMember(id).getNum();	
			ArrayList<ScrapBook> sblist = sbservice.list(mseq);			
			sbcount = sblist.size();
		}

		// 공고 리스트
		ArrayList<JobPost> list = (ArrayList<JobPost>) pservice.postList();
		 	
		request.setAttribute("posts", list);
		request.setAttribute("sbCount", sbcount);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/main/Main.jsp");
		if(dispatcher != null) {
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
