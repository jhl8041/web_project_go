package scrapbook.service;

import java.util.ArrayList;

import model.JobPost;
import model.ScrapBook;

public interface ScrapService {
	void add(int userSeq, JobPost post);
	void remove(int userSeq, int postSeq);
	ArrayList<ScrapBook> list(int userSeq);
}
