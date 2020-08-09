package scrapbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;
import model.JobPost;
import model.ScrapBook;

public class ScrapDaoImpl implements ScrapDao{
	private DBConnect db;

	public ScrapDaoImpl() {
		db = DBConnect.getInstance();
	}
	
	@Override
	public ArrayList<ScrapBook> selectAll(int userSeq) {
		Connection conn = null;
		ArrayList<ScrapBook> list = new ArrayList<ScrapBook>();
		ResultSet rs = null;
		
		String sql = "select * from post_scrap where scrap_user_seq=?";
		
		try {
			conn = db.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,userSeq);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new ScrapBook(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getDate(6)));
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
	public void insert(int userSeq, JobPost post) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into post_scrap values(?,?,?,?,?,?)";
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, userSeq);
			pstmt.setInt(2, post.getNum());
			pstmt.setString(3, post.getPostName());
			pstmt.setString(4, post.getPostUrl());
			pstmt.setDate(5, post.getPostPeriodStart());
			pstmt.setDate(6, post.getPostPeriodEnd());

			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void delete(int userSeq, int postSeq) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "delete post_scrap where scrap_user_seq=? and scrap_parent_seq=?";

		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, userSeq);
			pstmt.setInt(2, postSeq);

			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
