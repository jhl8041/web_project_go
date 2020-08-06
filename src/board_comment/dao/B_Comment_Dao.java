package board_comment.dao;

import java.util.ArrayList;
import java.util.List;

import model.Board_comment;

public interface B_Comment_Dao {
	void insert(Board_comment b_c);	// 댓글 정보 db에 저장
	List selectAll(int seq);		// 댓글 전체 검색하여 List로 반환
	void updateContent(Board_comment b_c);	// 댓글 정보 db에서 수정
	void delete(int seq);	// 댓글 번호으로 db에서 삭제

}
