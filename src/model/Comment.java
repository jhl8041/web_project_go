package model;

import java.sql.Date;
import java.sql.Timestamp;

public class Comment {
	private int board_comment_parent_seq;
	private String board_comment_nickname;
	private String board_comment_content;
	private Timestamp board_comment_sysdate;
	
	public Comment() {}

	public int getBoard_comment_parent_seq() {
		return board_comment_parent_seq;
	}

	public void setBoard_comment_parent_seq(int board_comment_parent_seq) {
		this.board_comment_parent_seq = board_comment_parent_seq;
	}

	public String getBoard_comment_nickname() {
		return board_comment_nickname;
	}

	public void setBoard_comment_nickname(String board_comment_nickname) {
		this.board_comment_nickname = board_comment_nickname;
	}

	public String getBoard_comment_content() {
		return board_comment_content;
	}

	public void setBoard_comment_content(String board_comment_content) {
		this.board_comment_content = board_comment_content;
	}

	public Timestamp getBoard_comment_sysdate() {
		return board_comment_sysdate;
	}

	public void setBoard_comment_sysdate(Timestamp board_comment_sysdate) {
		this.board_comment_sysdate = board_comment_sysdate;
	}

	public Comment(int board_comment_parent_seq, String board_comment_nickname, String board_comment_content,
			Timestamp board_comment_sysdate) {
		super();
		this.board_comment_parent_seq = board_comment_parent_seq;
		this.board_comment_nickname = board_comment_nickname;
		this.board_comment_content = board_comment_content;
		this.board_comment_sysdate = board_comment_sysdate;
	}

	
	
	
}
