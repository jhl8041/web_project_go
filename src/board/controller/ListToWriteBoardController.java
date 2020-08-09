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
 * Servlet implementation class ListToWriteBoardController
 */
@WebServlet("/ListToWriteBoardController")
public class ListToWriteBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListToWriteBoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");
		
		HttpSession session = request.getSession(false);
		Member m = (Member) session.getAttribute("userinfo");
		
		
		
		String b_code = request.getParameter("board_code");
		
		/////////////////
		Service service = new ServiceImpl();
		Board b;
		int board_seq;
		if (request.getParameter("board_seq") != null) {
			board_seq = Integer.parseInt(request.getParameter("board_seq"));
			b = service.getBoard(board_seq);
			request.setAttribute("board_seq", board_seq);
			request.setAttribute("b", b);
		}
		
		request.setAttribute("board_code", b_code);
		
		//////////////
		
		request.setAttribute("nickname", m.getNickname());
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/board/board_write2.jsp");
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
