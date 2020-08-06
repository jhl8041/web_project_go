package post.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;
import model.Comment;
import model.JobPost;

public class PostDaoImpl implements PostDao{
	private DBConnect db;

	public PostDaoImpl() {
		db = DBConnect.getInstance();
	}
	
	
	
	@Override
	public ArrayList<Comment> selectCommentBySeq(int num) {
		Connection conn = null;
		ArrayList<Comment> list = new ArrayList<Comment>();
		ResultSet rs = null;
		String sql = "select * from post_comments where post_comment_seq=?";
		
		try {
			conn = db.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
	
			while(rs.next()) {
				list.add(new Comment( rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4)));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public void updateComment(int num, String nickname, String content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update post_comments set post_comment_seq=?, post_comment_nickname=?, post_comment_content=?, post_comment_sysdate=sysdate";
		
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, nickname);
			pstmt.setString(3, content);
			
			pstmt.executeUpdate();
		}catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         try {
	            pstmt.close();
	            conn.close();
	         }catch(SQLException e){
	            e.printStackTrace();
	         }
	      }
	}
	
	@Override
	public JobPost select(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from job_post where post_seq=?";
		
		try {
			conn = db.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return new JobPost(			
					rs.getInt(1), rs.getString(2), rs.getString(3),
					rs.getString(4), rs.getString(5), rs.getString(6),
					rs.getDate(7), rs.getDate(8), rs.getInt(9),
					rs.getInt(10), rs.getInt(11), rs.getString(12), rs.getDate(13)
				);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	@Override
	public ArrayList<JobPost> selectAll() {
		Connection conn = null;
		ArrayList<JobPost> list = new ArrayList<JobPost>();
		ResultSet rs = null;
		String sql = "select * from job_post";
		
		try {
			conn = db.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
	
			while(rs.next()) {
				list.add(new JobPost(	rs.getInt(1), rs.getString(2), rs.getString(3),
										rs.getString(4), rs.getString(5), rs.getString(6),
										rs.getDate(7), rs.getDate(8), rs.getInt(9),
										rs.getInt(10), rs.getInt(11), rs.getString(12), rs.getDate(13)));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	@Override
	public void increLike(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update job_post set post_like=(post_like + 1) where post_seq = ?";
		
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);	
			pstmt.executeUpdate();
		}catch(SQLException e) {
	         e.printStackTrace();
	    }finally {
			try {
	            pstmt.close();
	            conn.close();
	         }catch(SQLException e){
	            e.printStackTrace();
	         }
	      }
	}

	@Override
	public void decreLike(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update job_post set post_like = (post_like - 1) where post_seq = ?";
		
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);	
			pstmt.executeUpdate();
		}catch(SQLException e) {
	         e.printStackTrace();
	    }finally {
			try {
	            pstmt.close();
	            conn.close();
	         }catch(SQLException e){
	            e.printStackTrace();
	         }
	      }	
	}

	@Override
	public void increUnlike(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update job_post set post_unlike = (post_unlike + 1) where post_seq = ?";
		
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);	
			pstmt.executeUpdate();
		}catch(SQLException e) {
	         e.printStackTrace();
	    }finally {
			try {
	            pstmt.close();
	            conn.close();
	         }catch(SQLException e){
	            e.printStackTrace();
	         }
	      }
	}

	@Override
	public void decreUnlike(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update job_post set post_unlike = (post_unlike - 1) where post_seq = ?";
		
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);	
			pstmt.executeUpdate();
		}catch(SQLException e) {
	         e.printStackTrace();
	    }finally {
			try {
	            pstmt.close();
	            conn.close();
	         }catch(SQLException e){
	            e.printStackTrace();
	         }
	      }
	}
}
