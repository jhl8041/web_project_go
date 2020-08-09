package post.service;

import java.sql.Timestamp;
import java.util.ArrayList;

import model.Comment;
import model.JobPost;

public interface PostService {	
	/* POST */
	ArrayList<JobPost> postList();
	JobPost getPost(int num);
	
	/* LIKE */
	void onLike(int num);
	void offLike(int num);
	void onUnlike(int num);
	void offUnlike(int num);
	
	/* COMMENT */
	void addComment(int num, String nickname, String content);
	void delComment(int pseq, Timestamp date);
	ArrayList<Comment> selectCommentBySeq(int num);	
}
