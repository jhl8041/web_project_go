package jobpost.service;

import java.util.ArrayList;
import java.util.List;

import model.JobPost;

public interface JobPostService {
	void add(JobPost p);
	void editPost(JobPost jp);
	void delPost(int num);
	JobPost getPost(int num);
	List<JobPost> getPostAll();
}
