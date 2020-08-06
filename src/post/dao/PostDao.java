package post.dao;

import java.util.ArrayList;

import model.Comment;
import model.JobPost;

public interface PostDao {
	ArrayList<Comment> selectCommentBySeq(int num);
	void updateComment(int num, String nickname, String content);
	
	ArrayList<JobPost> selectAll();
	JobPost select(int num);
	void increLike(int num);
	void decreLike(int num);
	void increUnlike(int num);
	void decreUnlike(int num);
}
