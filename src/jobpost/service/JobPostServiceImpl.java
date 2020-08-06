package jobpost.service;

import java.util.ArrayList;
import java.util.List;

import model.JobPost;
import jobpost.dao.JobPostDao;
import jobpost.dao.JobPostDaoImpl;


public class JobPostServiceImpl implements JobPostService {
	private JobPostDao dao;

	public JobPostServiceImpl() {
		this.dao = new JobPostDaoImpl();
	}

	@Override
	public void add(JobPost jp) {
		dao.insert(jp);	
	}

	@Override
	public void editPost(JobPost jp) {
		dao.update(jp);
	}

	@Override
	public void delPost(int num) {
		dao.delete(num);
	}

	@Override
	public JobPost getPost(int num) {
		return dao.select(num);
	}

	@Override
	public List<JobPost> getPostAll() {
		return dao.selectAll();
	}

	

}
