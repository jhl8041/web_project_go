package post.service;

import java.sql.Timestamp;
import java.util.ArrayList;

import model.Comment;
import model.JobPost;
import post.dao.PostDao;
import post.dao.PostDaoImpl;

public class PostServiceImpl implements PostService{
	private PostDao dao;
	
	public PostServiceImpl() {
		dao = new PostDaoImpl();
	}
	
	@Override
	public void addComment(int num, String nickname, String content) {
		dao.updateComment(num, nickname, content);
	}
	
	@Override
	public void delComment(int pseq, Timestamp date) {
		dao.deleteComment(pseq, date);
	}

	@Override
	public ArrayList<Comment> selectCommentBySeq(int num) {
		return dao.selectCommentBySeq(num);
	}

	@Override
	public ArrayList<JobPost> postList() {
		return dao.selectAll();
	}

	@Override
	public void onLike(int num) {
		dao.increLike(num);
	}

	@Override
	public void offLike(int num) {
		dao.decreLike(num);
	}

	@Override
	public void onUnlike(int num) {
		dao.increUnlike(num);
	}

	@Override
	public void offUnlike(int num) {
		dao.decreUnlike(num);
	}
	
	@Override
	public JobPost getPost(int num) {
		return dao.select(num);
	}
}
