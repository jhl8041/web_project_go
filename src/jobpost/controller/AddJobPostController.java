package jobpost.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.sql.Date;

import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jobpost.service.JobPostService;
import jobpost.service.JobPostServiceImpl;
import model.JobPost;

@WebServlet("/AddJobPostController")
public class AddJobPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddJobPostController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		JobPostService service = new JobPostServiceImpl();
		JobPost jp = new JobPost();
		
		String img = "";
		
		//String uploadPath = "C:\\Users\\jhl80\\OneDrive\\문서\\키트리노트\\workspace_web\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\post_img";
		String uploadPath = "C:\\Users\\kitri\\Desktop\\OneDrive\\문서\\키트리노트\\workspace_project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\post_img";
		int maxSize = 1024*1024*10;
		MultipartRequest multi = null;
		
		try {
			multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
			jp.setPostCorpName(multi.getParameter("postcorpname"));
			jp.setPostName(multi.getParameter("postname"));
			jp.setPostUrl(multi.getParameter("posturl"));
			jp.setPostContent(multi.getParameter("postcontent"));
			
			String eng,noneng,capital,noncapital;
			
			if (multi.getParameter("eng")==null) eng="0";
			else eng="1";
			
			if (multi.getParameter("noneng")==null) noneng="0";
			else noneng = "1";
			
			if (multi.getParameter("capital")==null) capital="0";
			else capital="1";
			
			if (multi.getParameter("noncapital")==null) noncapital="0";
			else noncapital="1";
			
			jp.setPostClassiCode(eng+noneng+capital+noncapital);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			java.util.Date datestart = sdf.parse(multi.getParameter("poststart"));
			java.util.Date dateend = sdf.parse(multi.getParameter("postend"));
			java.sql.Date sqlDatestart = new Date(datestart.getTime());
			java.sql.Date sqlDateend = new Date(dateend.getTime());
			jp.setPostPeriodStart(sqlDatestart);
			jp.setPostPeriodEnd(sqlDateend);
			

			Enumeration files = multi.getFileNames();
			
			while (files.hasMoreElements()) {
				String file1 = (String) files.nextElement();
				img = multi.getFilesystemName(file1);
				File file = multi.getFile(file1);
			}
			
			jp.setPostImg("/post_img/" + img);
			service.add(jp);
			out.print("success");
		}catch(Exception e) {
			out.print("fail");
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
