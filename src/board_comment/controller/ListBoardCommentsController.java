package board_comment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import board.service.Service;
import board.service.ServiceImpl;
import board_comment.service.B_Comment_Service;
import board_comment.service.B_Comment_ServiceImpl;
import model.Board;
import model.Board_comment;
import model.Member;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ListBoardCommentsController
 */
@WebServlet("/ListBoardCommentsController")
public class ListBoardCommentsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListBoardCommentsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청과 응답의 인코딩 설정
				request.setCharacterEncoding("euc-kr");
				response.setContentType("text/html; charset=EUC-KR");
				response.setCharacterEncoding("euc-kr");

				// 기능을 제공할 서비스 객체 생성
				B_Comment_Service service = new B_Comment_ServiceImpl();
				Board_comment b_comments = new Board_comment();

				int board_seq = Integer.parseInt(request.getParameter("board_seq"));
				// 글 전체 검색 기능 실행
				ArrayList<Board_comment> list = (ArrayList<Board_comment>) service.getAll(board_seq);

				// list를 request에 저장
				request.setAttribute("list", list);
				request.setAttribute("board_seq", board_seq);

				// 댓글글목록 jsp로 이동
				RequestDispatcher dispatcher = request.getRequestDispatcher("/board/board_comments/board_comments_view.jsp");
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
