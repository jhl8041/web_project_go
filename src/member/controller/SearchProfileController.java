package member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.service.MemberService;
import member.service.MemberServiceImpl;
import model.Member;
import model.Profile;

/**
 * Servlet implementation class SearchProfileController
 */
@WebServlet("/SearchProfileController")
public class SearchProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession(false);
		Member m = (Member) session.getAttribute("userinfo");
		int seq = m.getNum();
		System.out.println("profile load done");
		MemberService mservice = new MemberServiceImpl();
		Profile p = new Profile();
		
		String imgpath = mservice.searchProfileImg(seq);
			
		out.print(imgpath);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
