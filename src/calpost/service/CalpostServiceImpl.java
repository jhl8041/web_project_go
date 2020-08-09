package calpost.service;

import java.util.ArrayList;
import java.util.List;

import model.CalVo;
import calpost.dao.CalpostDao;
import calpost.dao.CalpostDaoImpl;

public class CalpostServiceImpl implements CalpostService{
	private CalpostDao dao;
	public CalpostServiceImpl() {
		this.dao = new CalpostDaoImpl();
	}
	@Override
	public ArrayList<CalVo> getAllPost(int num) {
		return dao.selectAllBySeq(num);
	}
	@Override
	public void addcalpost(CalVo c) {
		dao.insert(c);
	}
	@Override
	public void delcalpost(int num, String title, String content) {
		dao.delete(num, title, content);
		
	}
	
	

}
