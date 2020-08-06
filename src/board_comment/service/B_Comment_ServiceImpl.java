package board_comment.service;

import java.util.ArrayList;
import java.util.List;

import board.dao.Dao;
import board.dao.DaoImpl;
import board_comment.dao.B_Comment_Dao;
import board_comment.dao.B_Comment_DaoImpl;
import model.Board_comment;

public class B_Comment_ServiceImpl implements B_Comment_Service{
	private B_Comment_Dao dao;
	
	public B_Comment_ServiceImpl() {
		dao = new B_Comment_DaoImpl();
	}
	
	@Override
	public void writeBoardComment(Board_comment b_c) {
		// TODO Auto-generated method stub
		dao.insert(b_c);
	}

	@Override
	public List getAll(int parent_seq) {
		// TODO Auto-generated method stub
		return dao.selectAll(parent_seq);
	}

	@Override
	public void editBoardComment(Board_comment b_c) {
		// TODO Auto-generated method stub
		dao.updateContent(b_c);
	}

	@Override
	public void delBoardComment(int seq) {
		// TODO Auto-generated method stub
		dao.delete(seq);
	}
	
}
