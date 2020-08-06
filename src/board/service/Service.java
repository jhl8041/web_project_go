package board.service;

import java.util.List;

import model.Board;

public interface Service {
	void writeBoard(Board b);	//글 작성
	Board getBoard(int seq);	//글 검색
	List getList(String board_code,int page);				//글 전체 검색
	void editBoard(Board b);	//글 수정
	void delBoard(int seq);		//글 삭제
	void updateLikeBoard(int seq, boolean like);		//글 좋아요,싫어요 관리
	void updateViewCountBoard(int seq);					//글 조회수
	Board LastWriteBoard(String member_id); //현재 보드 시퀀스조회
	
}
