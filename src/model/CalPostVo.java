package model;

import java.util.Date;

public class CalPostVo {

	int seq;
	String id;
	String postname;
	String posturl;
	Date sdate;
	Date edate;
	
	public CalPostVo() {
		
	}
	

	public CalPostVo(int seq, String id, String postname, String posturl, Date sdate, Date edate) {
		super();
		this.seq = seq;
		this.id = id;
		this.postname = postname;
		this.posturl = posturl;
		this.sdate = sdate;
		this.edate = edate;
	}


	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPostname() {
		return postname;
	}

	public void setPostname(String postname) {
		this.postname = postname;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public Date getEdate() {
		return edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}

	public String getPosturl() {
		return posturl;
	}

	public void setPosturl(String posturl) {
		this.posturl = posturl;
	}

	@Override
	public String toString() {
		return "CalPostVo [seq=" + seq + ", id=" + id + ", postname=" + postname + ", posturl=" + posturl + ", sdate="
				+ sdate + ", edate=" + edate + "]";
	}

	
	
	
	
}
