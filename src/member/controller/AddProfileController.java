package member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jobpost.service.JobPostService;
import jobpost.service.JobPostServiceImpl;
import member.service.MemberService;
import member.service.MemberServiceImpl;
import model.JobPost;
import model.Member;
import model.Profile;

@WebServlet("/AddProfileController")
public class AddProfileController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public AddProfileController() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();

		MemberService mservice = new MemberServiceImpl();
		Profile p = new Profile();
		
		String img = "";
		
		//String uploadPath = "C:\\Users\\jhl80\\OneDrive\\문서\\키트리노트\\workspace_web\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\post_img";
		String uploadPath = "C:\\Users\\jhl80\\Desktop\\workwork\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\post_img";
		//String uploadPath = "C:\\Users\\kitri\\Desktop\\OneDrive\\문서\\키트리노트\\workspace_project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\post_img";
		int maxSize = 1024*1024*10;
		MultipartRequest multi = null;
		
		try {
			multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
			int seq = Integer.parseInt(multi.getParameter("user_seq"));
			
			Enumeration files = multi.getFileNames();
			
			while (files.hasMoreElements()) {
				String file1 = (String) files.nextElement();
				img = multi.getFilesystemName(file1);
				File file = multi.getFile(file1);
			}
			
			String p_img = ("/post_img/" + img);
			mservice.insertProfile(seq, p_img);
			
			out.print("success");
		}catch(Exception e) {
			e.printStackTrace();
			out.print("fail");
		}

	}
   
//      request.setCharacterEncoding("utf-8");
//      response.setContentType("text/html;charset=utf-8");
//      response.setCharacterEncoding("utf-8");
//      
//      MemberService mservcie = new MemberServiceImpl();
//            
//      String uploadpath = "C:\\workspace_web\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\post_img";
//      int maxsize = 1024*1024*10;
//            
//      PrintWriter out = response.getWriter();
//      try {
//         MultipartRequest multi = new MultipartRequest(request, uploadpath, maxsize, "utf-8", new DefaultFileRenamePolicy());
//         
//         int seq = Integer.parseInt(multi.getParameter("seq"));
//         String img = multi.getParameter("img");
//
//         mservcie.insertProfile(seq, "/post_img/" + img);
//         out.print("success");
//      }catch(Exception e) {
//         out.print("fail");
//      }
//   }


   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}