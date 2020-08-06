package board.controller;

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
import model.Board;

/**
 * Servlet implementation class WriteController
 */
@WebServlet("/WriteController")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteController() {
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
		// 기능을 제공할 서비스 객체 생성
		Service service = new ServiceImpl();
		// 세션에서 정보 받아오기
		HttpSession session = request.getSession();

		// 작성자 정보
//		String board_user_id = session.getAttribute("member_id").toString();
//		String board_writer = session.getAttribute("member_writer").toString();
		
		//임시
		String board_user_id ="a";
		String board_writer = "a";
		
		// 요청 파라메터 값 읽기
		String board_code = request.getParameter("board_code");
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");

		// 요청 파라메터로 읽은 값으로 Board 객체 생성
		Board b = new Board(0,board_code,board_user_id,board_writer
				,board_title,board_content,null,0,0,0);

		
		// 서비스의 글작성 기능 실행
		service.writeBoard(b);
		
		
		Board view_b =service.LastWriteBoard(board_user_id);
		request.setAttribute("b", view_b);

		// 글목록으로 이동
//		response.sendRedirect("/board/board_view.jsp");

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
