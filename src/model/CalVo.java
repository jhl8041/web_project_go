package model;

import java.sql.Date;


public class CalVo {

	private int seq;
	private int userseq;
	private String id;
	private String title;
	private String content;
	private Date startdate;
	private Date enddate;
	private Date regdate;
	
	public CalVo() {
		
	}
	
	

	public CalVo(int seq, int userseq, String id, String title, String content, Date startdate, Date enddate,
			Date regdate) {
		super();
		this.seq = seq;
		this.userseq = userseq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.startdate = startdate;
		this.enddate = enddate;
		this.regdate = regdate;
	}



	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getUserseq() {
		return userseq;
	}

	public void setUserseq(int userseq) {
		this.userseq = userseq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	
	
	
	
}
