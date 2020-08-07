package scrapbook.service;

import java.util.ArrayList;

import model.JobPost;
import model.ScrapBook;
import scrapbook.dao.ScrapDao;
import scrapbook.dao.ScrapDaoImpl;

public class ScrapServiceImpl implements ScrapService{
	private ScrapDao dao;
	
	public ScrapServiceImpl() {
		dao = new ScrapDaoImpl();
	}
	
	@Override
	public void add(int userSeq, JobPost post) {
		dao.insert(userSeq, post);
	}

	@Override
	public void remove(int userSeq, int postSeq) {
		dao.delete(userSeq, postSeq);
	}

	@Override
	public ArrayList<ScrapBook> list(int userSeq) {
		return dao.selectAll(userSeq);
	}
}
