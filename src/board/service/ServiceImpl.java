package board.service;
import java.util.List;

import board.dao.Dao;
import board.dao.DaoImpl;
import model.Board;

public class ServiceImpl implements Service{
	private Dao dao;

	public ServiceImpl() {
		dao = new DaoImpl();
	}
	@Override
	public void writeBoard(Board b) {
		// TODO Auto-generated method stub
		dao.insert(b);
	}

	@Override
	public Board getBoard(int num) {
		// TODO Auto-generated method stub
		return dao.select(num);
	}

	@Override
	public List getList(String board_code,int page) {
		// TODO Auto-generated method stub
		return dao.selectBoardList( board_code, page);
	}

	@Override
	public void editBoard(Board b) {
		// TODO Auto-generated method stub
		dao.updateContent(b);
	}

	@Override
	public void delBoard(int num) {
		// TODO Auto-generated method stub
		dao.delete(num);
	}
	
	@Override
	public void updateLikeBoard(int seq, boolean like) {
		// TODO Auto-generated method stub
		dao.updateLike(seq, like);
	}
	@Override
	public void updateViewCountBoard(int seq) {
		// TODO Auto-generated method stub
		dao.updateViewCount(seq);
	}
	@Override
	public Board LastWriteBoard(String member_id) {
		// TODO Auto-generated method stub
		return dao.MyLastBoard(member_id);
	}



}
