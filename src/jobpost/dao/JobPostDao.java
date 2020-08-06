package jobpost.dao;

import java.util.List;

import model.JobPost;

public interface JobPostDao {
	void insert(JobPost jp);	

	JobPost select(int num);	

	List<JobPost> selectAll();		

	void update(JobPost jp);	

	void delete(int num);
}
