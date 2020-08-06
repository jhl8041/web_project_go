package model;

import java.sql.Date;

public class Comment {
	private int board_comment_parent_seq;
	private String board_comment_nickname;
	private String board_comment_content;
	private Date board_comment_sysdate;
	
	public Comment() {}

	public Comment(int board_comment_parent_seq, String board_comment_nickname, String board_comment_content,
			Date board_comment_sysdate) {
		super();
		this.board_comment_parent_seq = board_comment_parent_seq;
		this.board_comment_nickname = board_comment_nickname;
		this.board_comment_content = board_comment_content;
		this.board_comment_sysdate = board_comment_sysdate;
	}

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

	public Date getBoard_comment_sysdate() {
		return board_comment_sysdate;
	}

	public void setBoard_comment_sysdate(Date board_comment_sysdate) {
		this.board_comment_sysdate = board_comment_sysdate;
	};
	
	
}
