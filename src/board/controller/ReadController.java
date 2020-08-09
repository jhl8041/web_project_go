package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.service.Service;
import board.service.ServiceImpl;
import board_comment.service.B_Comment_Service;
import board_comment.service.B_Comment_ServiceImpl;
import model.Board;
import model.Board_comment;
import model.Member;

/**
 * Servlet implementation class ReadController
 */
@WebServlet("/ReadController")
public class ReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 요청과 응답의 인코딩 설정
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");
		
		HttpSession session = request.getSession(false);
		Member m = (Member) session.getAttribute("userinfo");
		String nick = m.getNickname();
		
		int board_seq = Integer.parseInt(request.getParameter("board_seq"));
		String board_code = request.getParameter("board_code");
		
		B_Comment_Service service_c = new B_Comment_ServiceImpl();
		Service service = new ServiceImpl();
		
		Board_comment b_comments = new Board_comment();
		Board b = service.getBoard(board_seq);
			
		
		// 글 전체 검색 기능 실행
		ArrayList<Board_comment> list_c = (ArrayList<Board_comment>) service_c.getAll(board_seq);
		
		//분류된 list를 request에 저장
		request.setAttribute("list_c", list_c);
		request.setAttribute("board_seq", board_seq);
		request.setAttribute("board_code", board_code);
		request.setAttribute("b", b);
		request.setAttribute("nick", nick);
			
		// 글정보 출력페이지로 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher("/board/board_view2.jsp");
		if (dispatcher != null) {
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
