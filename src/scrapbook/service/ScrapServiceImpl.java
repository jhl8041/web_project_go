package scrapbook.service;

import java.util.ArrayList;

import model.ScrapBook;
import post.dao.PostDao;
import post.dao.PostDaoImpl;
import scrapbook.dao.ScrapDao;
import scrapbook.dao.ScrapDaoImpl;

public class ScrapServiceImpl implements ScrapService{
	private ScrapDao dao;
	
	public ScrapServiceImpl() {
		dao = new ScrapDaoImpl();
	}
	
	@Override
	public void add(int userSeq, int postSeq) {
		dao.insert(userSeq, postSeq);
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
