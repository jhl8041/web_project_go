package calpost.service;

import java.util.List;

import model.CalPostVo;
import calpost.dao.CalpostDao;
import calpost.dao.CalpostDaoImpl;

public class CalpostServiceImpl implements CalpostService{
	private CalpostDao dao;
	public CalpostServiceImpl() {
		this.dao = new CalpostDaoImpl();
	}
	@Override
	public List CalPostList(String p_id) {
		
		return dao.getCalPostViewList(p_id);
	}


}
