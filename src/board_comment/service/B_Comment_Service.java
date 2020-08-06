package board_comment.service;

import java.util.ArrayList;
import java.util.List;

import model.Board_comment;

public interface B_Comment_Service {
	void writeBoardComment(Board_comment b_c);	//게시판 댓글 작성
	List getAll(int parent_seq);				//게시판 번호에 따른 전체 댓글 검색
	void editBoardComment(Board_comment b_c);	//게시판 댓글 수정
	void delBoardComment(int seq);				//게시판 댓글 삭제
}
