package scrapbook.service;

import java.util.ArrayList;

import model.ScrapBook;

public interface ScrapService {
	void add(int userSeq, int postSeq);
	void remove(int userSeq, int postSeq);
	ArrayList<ScrapBook> list(int userSeq);
}
