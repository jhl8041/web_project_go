package model;
import java.sql.Date;
public class Board_comment {
	private int board_comment_parent_seq;
	private String board_comment_user_id;
	private String board_comment_writer;
	private String board_comment_content;
	private Date board_comment_sysdate;
	private int board_comment_seq;
	
	public Board_comment() {}
	
	public Board_comment(int board_comment_parent_seq, String board_comment_user_id, String board_comment_writer,
			String board_comment_content, Date board_comment_sysdate, int board_comment_seq) {
		super();
		this.board_comment_parent_seq = board_comment_parent_seq;
		this.board_comment_user_id = board_comment_user_id;
		this.board_comment_writer = board_comment_writer;
		this.board_comment_content = board_comment_content;
		this.board_comment_sysdate = board_comment_sysdate;
		this.board_comment_seq = board_comment_seq;
	}


	public int getBoard_comment_parent_seq() {
		return board_comment_parent_seq;
	}

	public void setBoard_comment_parent_seq(int board_comment_parent_seq) {
		this.board_comment_parent_seq = board_comment_parent_seq;
	}

	public String getBoard_comment_user_id() {
		return board_comment_user_id;
	}

	public void setBoard_comment_user_id(String board_comment_user_id) {
		this.board_comment_user_id = board_comment_user_id;
	}

	public String getBoard_comment_writer() {
		return board_comment_writer;
	}

	public void setBoard_comment_writer(String board_comment_writer) {
		this.board_comment_writer = board_comment_writer;
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
	}
	
	public int getBoard_comment_seq() {
		return board_comment_seq;
	}

	public void setBoard_comment_seq(int board_comment_seq) {
		this.board_comment_seq = board_comment_seq;
	}

	@Override
	public String toString() {
		return "Board_comment [board_comment_parent_seq=" + board_comment_parent_seq + ", board_comment_user_id="
				+ board_comment_user_id + ", board_comment_writer=" + board_comment_writer + ", board_comment_content="
				+ board_comment_content + ", board_comment_sysdate=" + board_comment_sysdate + ", board_comment_seq="
				+ board_comment_seq + "]";
	}

	
}
