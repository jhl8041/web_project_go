package model;

import java.sql.Date;

public class JobPost {
	private int num;
	private String postCorpName;
	private String postName;
	private String postUrl;
	private String postImg;
	private String postContent;
	private Date postPeriodStart;
	private Date postPeriodEnd;
	private int postLike;
	private int postDislike;
	private int postView;
	private String postClassiCode;
	private Date postAddDate;
	
	public JobPost() {}
	
	public JobPost(int num, String postCorpName, String postName, String postUrl, String postImg, String postContent, Date postPeriodStart,
			Date postPeriodEnd, int postLike, int postDislike, int postView, String postClassiCode, Date postAddDate) {
		super();
		this.num = num;
		this.postCorpName = postCorpName;
		this.postName = postName;
		this.postUrl = postUrl;
		this.postImg = postImg;
		this.postContent = postContent;
		this.postPeriodStart = postPeriodStart;
		this.postPeriodEnd = postPeriodEnd;
		this.postLike = postLike;
		this.postDislike = postDislike;
		this.postView = postView;
		this.postClassiCode = postClassiCode;
		this.postAddDate = postAddDate;
	}
	
	public String getPostImg() {
		return postImg;
	}

	public void setPostImg(String postImg) {
		this.postImg = postImg;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getPostCorpName() {
		return postCorpName;
	}
	public void setPostCorpName(String postCorpName) {
		this.postCorpName = postCorpName;
	}
	public String getPostName() {
		return postName;
	}
	public void setPostName(String postName) {
		this.postName = postName;
	}
	public String getPostUrl() {
		return postUrl;
	}
	public void setPostUrl(String postUrl) {
		this.postUrl = postUrl;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
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
	public int getPostLike() {
		return postLike;
	}
	public void setPostLike(int postLike) {
		this.postLike = postLike;
	}
	public int getPostDislike() {
		return postDislike;
	}
	public void setPostDislike(int postDislike) {
		this.postDislike = postDislike;
	}
	public int getPostView() {
		return postView;
	}
	public void setPostView(int postView) {
		this.postView = postView;
	}
	public String getPostClassiCode() {
		return postClassiCode;
	}
	public void setPostClassiCode(String postClassiCode) {
		this.postClassiCode = postClassiCode;
	}

	public Date getPostAddDate() {
		return postAddDate;
	}
	public void setPostAddDate(Date postAddDate) {
		this.postAddDate = postAddDate;
	}

	@Override
	public String toString() {
		return "JobPost [num=" + num + ", postCorpName=" + postCorpName + ", postName=" + postName + ", postUrl="
				+ postUrl + ", postContent=" + postContent + ", postPeriodStart=" + postPeriodStart + ", postPeriodEnd="
				+ postPeriodEnd + ", postLike=" + postLike + ", postDislike=" + postDislike + ", postView=" + postView
				+ ", postClassiCode=" + postClassiCode + ", postAddDate=" + postAddDate + "]";
	}
	
	
}
