package calpost.service;

import java.util.ArrayList;
import java.util.List;

import model.CalVo;


public interface CalpostService {
	
	void addcalpost(CalVo c);
	
	void delcalpost(int num, String title, String content);
	
	ArrayList<CalVo> getAllPost(int num);
}
