package board.dao;

import java.util.List;

import model.Board;

public interface Dao {
	void insert(Board b);	// 글 정보 db에 저장
	Board select(int seq);	// 글 하나에 대한 정보 검색하여 Board 객체 반환
	List selectBoardList(String board_code,int page);	// 글  코드별로 페이지별로 List로 반환
	void updateContent(Board b);	// 글 정보 db에서 수정
	void delete(int seq);	// 글 번호로 db에서 삭제
	void updateLike(int seq, boolean like); //좋아요,싫어요 버튼 받아서 like,unlike 정보 관리
	void updateViewCount(int seq); //글 조회수 업데이트
	Board MyLastBoard(String member_id); //id가 마지막 작성한 게시글 조회
}
