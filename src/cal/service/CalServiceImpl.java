package cal.service;

import java.util.ArrayList;
import java.util.List;

import cal.dao.CalDao;
import cal.dao.CalDaoImpl;
import model.CalVo;


public class CalServiceImpl implements CalService{
	
	@Override
	public void del(String id, String mdate, String title) {
		dao.del(id, mdate, title);
		
	}


	private CalDao dao;
	public CalServiceImpl() {
		this.dao = new CalDaoImpl();
	}
	

	@Override
	public List CalList(String c_id) {
		
		return dao.getCalViewList(c_id);
	}


	@Override
	public void addCal(CalVo c) {
		dao.insertCalBoard(c);
	}

}
