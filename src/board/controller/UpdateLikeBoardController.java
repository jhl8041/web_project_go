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
 * Servlet implementation class UpdateLikeBoardController
 */
@WebServlet("/UpdateLikeBoardController")
public class UpdateLikeBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateLikeBoardController() {
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

		// 서비스 객체 생성
		Service service = new ServiceImpl();

		// 요청 파라미터 값 읽기
		int seq = Integer.parseInt(request.getParameter("seq"));
		boolean like = Boolean.parseBoolean(request.getParameter("like"));

		// 서비스에서 좋아요 관리 메서드 호출
		service.updateLikeBoard(seq, like);
		Board b = service.getBoard(seq);
		
		request.setAttribute("b", b);
		
		// 메뉴 페이지로 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ReadController?board_seq="+seq);
		
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
