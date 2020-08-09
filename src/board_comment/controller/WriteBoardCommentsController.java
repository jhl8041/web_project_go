package board_comment.controller;

import java.io.IOException;
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


/**
 * Servlet implementation class WriteBoardCommentsController
 */
@WebServlet("/WriteBoardCommentsController")
public class WriteBoardCommentsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteBoardCommentsController() {
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
				B_Comment_Service b_c_service = new B_Comment_ServiceImpl();
				Service p_service = new ServiceImpl();
				// 세션에서 정보 받아오기
				HttpSession session = request.getSession(false);
				Member m = (Member) session.getAttribute("userinfo");
				
				// 작성 정보
				int board_seq = Integer.parseInt(request.getParameter("board_seq"));
				
				String board_comments_user_id = m.getId();
				String board_comments_writer = m.getNickname();
				
				// 요청 파라메터 값 읽기
				String board_comments_content = request.getParameter("board_comments_content");

				// 요청 파라메터로 읽은 값으로 Board 객체 생성
				Board_comment b_c = new Board_comment(board_seq,board_comments_user_id,board_comments_writer, 
						board_comments_content,null,0);
				
				// 서비스의 댓글 기능 실행
				b_c_service.writeBoardComment(b_c);
				Board b = p_service.getBoard(board_seq);
				request.setAttribute("b", b);

				// 글목록으로 이동
				RequestDispatcher dispatcher = request.getRequestDispatcher("/ReadController");
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
