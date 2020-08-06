package board_comment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board_comment.service.B_Comment_Service;
import board_comment.service.B_Comment_ServiceImpl;
import model.Board;
import board.service.Service;
import board.service.ServiceImpl;

/**
 * Servlet implementation class DelBoardCommentsController
 */
@WebServlet("/DelBoardCommentsController")
public class DelBoardCommentsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelBoardCommentsController() {
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

		// 서비스 객체 생성
		B_Comment_Service b_c_service = new B_Comment_ServiceImpl();
		Service p_service = new ServiceImpl();

		// 댓글 파라미터 값 읽기
		int seq = Integer.parseInt(request.getParameter("b_c_seq"));
		int p_seq = Integer.parseInt(request.getParameter("b_c_parent_seq"));
		// 서비스에서 댓글 삭제 메서드 호출
		b_c_service.delBoardComment(seq);
		Board b = p_service.getBoard(p_seq);
		request.setAttribute("b", b);

		// 페이지로 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher("/board/board_view.jsp");
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
