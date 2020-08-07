package cal.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CalVo;
import cal.service.CalService;
import cal.service.CalServiceImpl;

/**
 * Servlet implementation class AddPostController
 */
@WebServlet("/AddPostController")
public class AddPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");
		
		CalService service = new CalServiceImpl(); 
		HttpSession session = request.getSession(false);
		//String c_id = (String) session.getAttribute("id");//���ǿ���
		String c_id = "a";
		CalVo c = new CalVo();
		
		String id = (String) session.getAttribute("id");
		c.setContent(request.getParameter("content"));
		c.setTitle(request.getParameter("title"));
		c.setMdate(request.getParameter("mdate"));
		c.setId(c_id);
		service.addCal(c);
		String path = "./cal.jsp";
		
		response.sendRedirect(path);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
