package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import member.service.MemberService;
import member.service.MemberServiceImpl;
import model.Member;


@WebServlet("/SearchController")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");
		
		PrintWriter out = response.getWriter();
		
		MemberService service = new MemberServiceImpl();
		int num = Integer.parseInt(request.getParameter("num"));
		Member m = service.getMember(num);
		
		JSONObject mobj = new JSONObject();
		mobj.put("id", m.getId());
		mobj.put("name", m.getName());
		mobj.put("nickname", m.getNickname());
		mobj.put("phone", m.getPhone());
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		mobj.put("birthdate", dateFormat.format(m.getBirthdate()));
		mobj.put("gender", m.getGender());
		mobj.put("email", m.getEmail());
		mobj.put("address", m.getAddress());
		mobj.put("type", m.getPrefCode());
		
		out.print(mobj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
