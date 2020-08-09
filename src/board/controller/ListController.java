package board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.Service;
import board.service.ServiceImpl;
import board_comment.service.B_Comment_Service;
import board_comment.service.B_Comment_ServiceImpl;
import model.Board;
import model.Board_comment;

/**
 * Servlet implementation class ListController
 */
@WebServlet("/ListController")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListController() {
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
		
		
		//게시판 종류 코드
		String board_code = request.getParameter("board_code");
		//페이지넘버
		int page = Integer.parseInt(request.getParameter("pageNum"));
		request.setAttribute("board_code", board_code);
		
		// 글 전체 검색 기능 실행
		ArrayList<Board> list = (ArrayList<Board>) service.getList(board_code,page);
		
		//분류된 list를 request에 저장
		request.setAttribute("list", list);
		
		request.setAttribute("pageNum", page);
		
		//페이징처리
		String minpage_2= "",minpage_1= "",maxpage_1= "",maxpage_2 = "";
		ArrayList<Board> list_m2 = (ArrayList<Board>) service.getList(board_code,page-2);
		ArrayList<Board> list_m1 = (ArrayList<Board>) service.getList(board_code,page-1);
		ArrayList<Board> list_p1 = (ArrayList<Board>) service.getList(board_code,page+1);
		ArrayList<Board> list_p2 = (ArrayList<Board>) service.getList(board_code,page+2);
		
		if(list_m2.isEmpty()) 
			minpage_2="disabled";
		if(list_m1.isEmpty())
			minpage_1="disabled";
		if(list_p1.isEmpty())
			maxpage_1="disabled";
		if(list_p2.isEmpty())
			maxpage_2="disabled";
		request.setAttribute("minpage_2", minpage_2);
		request.setAttribute("minpage_1", minpage_1);
		request.setAttribute("maxpage_1", maxpage_1);
		request.setAttribute("maxpage_2", maxpage_2);
		
		// 글목록 출력페이지로 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher("/board/board_list.jsp");
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
