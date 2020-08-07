package model;

import java.sql.Date;

public class ScrapBook {
	private int userSeq;			// 유저 seq
	private int postSeq;			// 공고 seq
	private String postName;		// 공고 이름
	private String postLink;		// 공고 링크
	private Date postPeriodStart;	// 공고 시작일
	private Date postPeriodEnd;		// 공고 마감일
	
	public ScrapBook() {}
	
	public ScrapBook(int userSeq, int postSeq, String postName, String postLink, Date postPeriodStart,
			Date postPeriodEnd) {
		super();
		this.userSeq = userSeq;
		this.postSeq = postSeq;
		this.postName = postName;
		this.postLink = postLink;
		this.postPeriodStart = postPeriodStart;
		this.postPeriodEnd = postPeriodEnd;
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

	public String getPostLink() {
		return postLink;
	}

	public void setPostLink(String postLink) {
		this.postLink = postLink;
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

	@Override
	public String toString() {
		return "ScrapBook [userSeq=" + userSeq + ", postSeq=" + postSeq + ", postName=" + postName + ", postLink="
				+ postLink + ", postPeriodStart=" + postPeriodStart + ", postPeriodEnd=" + postPeriodEnd + "]";
	}

	
}
