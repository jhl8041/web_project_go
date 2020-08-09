package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.Service;
import board.service.ServiceImpl;
import model.Board;

/**
 * Servlet implementation class EditBoardController
 */
@WebServlet("/EditBoardController")
public class EditBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 요청과 응답의 인코딩 설정
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		// 기능을 제공할 서비스 객체 생성
		Service service =new ServiceImpl();
		
		// 요청 파라메터 값 읽기
		int seq = Integer.parseInt(request.getParameter("seq"));
		String board_code = request.getParameter("board_code");
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		
		System.out.println(seq);
		System.out.println(board_code);
		System.out.println(board_title);
		System.out.println(board_content);
		
		Board b = new Board(seq,null,null,null,board_title,board_content,null,0,0,0);
		
		service.editBoard(b);
		
		// 글목록으로 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ListController?board_code="+ board_code +"&pageNum=1");
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
