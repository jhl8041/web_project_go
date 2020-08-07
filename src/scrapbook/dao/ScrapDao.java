package scrapbook.dao;

import java.util.ArrayList;

import model.JobPost;
import model.ScrapBook;

public interface ScrapDao {
	ArrayList<ScrapBook> selectAll(int userSeq);
	void insert(int userSeq, JobPost post);
	void delete(int userSeq, int postSeq);
}
