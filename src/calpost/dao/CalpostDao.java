package calpost.dao;

import java.util.ArrayList;
import java.util.List;

import model.CalVo;
import model.Member;

public interface CalpostDao {
	void insert(CalVo c);
	
	ArrayList<CalVo> selectAllBySeq(int num); //member 번호로 불러오기

	void delete(int num, String title, String content); //calpost 번호로 삭제
}
