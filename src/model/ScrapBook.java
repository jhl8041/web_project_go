package model;

import java.sql.Date;

public class ScrapBook {
	private int userSeq;			// ���� seq
	private int postSeq;			// ���� seq
	private String postName;		// ���� �̸�
	private Date postPeriodStart;	// ���� ������
	private Date postPeriodEnd;		// ���� ������
	private String postLink;		// ���� ��ũ
	
	public ScrapBook() {}

	public ScrapBook(int userSeq, int postSeq, String postName, Date postPeriodStart, Date postPeriodEnd,
			String postLink) {
		super();
		this.userSeq = userSeq;
		this.postSeq = postSeq;
		this.postName = postName;
		this.postPeriodStart = postPeriodStart;
		this.postPeriodEnd = postPeriodEnd;
		this.postLink = postLink;
	}
	
	public int getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}

	public int getPostSeq() {
		return postSeq;
	}

	public void setPostSeq(int postSeq) {
		this.postSeq = postSeq;
	}

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public Date getPostPeriodStart() {
		return postPeriodStart;
	}

	public void setPostPeriodStart(Date postPeriodStart) {
		this.postPeriodStart = postPeriodStart;
	}

	public Date getPostPeriodEnd() {
		return postPeriodEnd;
	}

	public void setPostPeriodEnd(Date postPeriodEnd) {
		this.postPeriodEnd = postPeriodEnd;
	}

	public String getPostLink() {
		return postLink;
	}

	public void setPostLink(String postLink) {
		this.postLink = postLink;
	}	
}
