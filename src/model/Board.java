package model;

import java.sql.Date;

public class Board {
	private int board_seq;
	private String board_code;
	private String board_user_id;
	private String board_writer;
	private String board_title;
	private String board_content;
	private Date board_sysdate;
	private int board_like;
	private int board_unlike;
	private int board_view;
	
	public Board() {
	}
	
	public Board(int board_seq, String board_code, String board_user_id, String board_writer, String board_title,
			String board_content, Date board_sysdate, int board_like, int board_unlike,
			int board_view) {
		super();
		this.board_seq = board_seq;
		this.board_code = board_code;
		this.board_user_id = board_user_id;
		this.board_writer = board_writer;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_sysdate = board_sysdate;
		this.board_like = board_like;
		this.board_unlike = board_unlike;
		this.board_view = board_view;
	}
	
	public Board(int board_seq, String board_title, String board_writer,  Date board_sysdate, int board_view,int board_like,
			int board_unlike) {
		super();
		this.board_seq = board_seq;
		this.board_writer = board_writer;
		this.board_title = board_title;
		this.board_sysdate = board_sysdate;
		this.board_like = board_like;
		this.board_unlike = board_unlike;
		this.board_view = board_view;
	}

	@Override
	public String toString() {
		return "Board [board_seq=" + board_seq + ", board_code=" + board_code + ", board_user_id=" + board_user_id
				+ ", board_writer=" + board_writer + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", board_img=" + ", board_sysdate=" + board_sysdate + ", board_like=" + board_like
				+ ", board_unlike=" + board_unlike + ", board_view=" + board_view + "]";
	}

	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}

	public String getBoard_code() {
		return board_code;
	}

	public void setBoard_code(String board_code) {
		this.board_code = board_code;
	}

	public String getBoard_user_id() {
		return board_user_id;
	}

	public void setBoard_user_id(String board_user_id) {
		this.board_user_id = board_user_id;
	}

	public String getBoard_writer() {
		return board_writer;
	}

	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public Date getBoard_sysdate() {
		return board_sysdate;
	}

	public void setBoard_sysdate(Date board_sysdate) {
		this.board_sysdate = board_sysdate;
	}

	public int getBoard_like() {
		return board_like;
	}

	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}

	public int getBoard_unlike() {
		return board_unlike;
	}

	public void setBoard_unlike(int board_unlike) {
		this.board_unlike = board_unlike;
	}

	public int getBoard_view() {
		return board_view;
	}

	public void setBoard_view(int board_view) {
		this.board_view = board_view;
	}
	
}
