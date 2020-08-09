package jobpost.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.DBConnect;
import model.JobPost;

public class JobPostDaoImpl implements JobPostDao {
	private DBConnect db;

	public JobPostDaoImpl() {
		db = DBConnect.getInstance();
	}
	
	@Override
	public void insert(JobPost jp) {
		
		Connection conn = null;
		PreparedStatement pt = null;
		
		String sql = "insert into job_post values(post_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
		
		try {
			conn = db.getConnection();
			pt = conn.prepareStatement(sql);
			pt.setString(1, jp.getPostCorpName());
			pt.setString(2, jp.getPostName());
			pt.setString(3, jp.getPostUrl());
			pt.setString(4, jp.getPostImg());
			pt.setString(5, jp.getPostContent());
			pt.setDate(6, jp.getPostPeriodStart());
			pt.setDate(7, jp.getPostPeriodEnd());
			pt.setInt(8, jp.getPostLike());
			pt.setInt(9, jp.getPostDislike());
			pt.setInt(10, jp.getPostView());
			pt.setString(11, jp.getPostClassiCode());
			
			pt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public JobPost select(int num) {
		Connection conn = null;
		PreparedStatement pt = null;
		ResultSet rs = null;
		
		String sql = "select * from job_post where post_seq=?";
		
		try {
			conn = db.getConnection();
			pt = conn.prepareStatement(sql);
			pt.setInt(1, num);
			
			rs = pt.executeQuery();
			
			if (rs.next()) {
				return new JobPost(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getDate(7),
						rs.getDate(8), rs.getInt(9), rs.getInt(10), rs.getInt(11), rs.getString(12), rs.getDate(13));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}

	@Override
	public List<JobPost> selectAll() {
		Connection conn = null;
		PreparedStatement pt = null;
		ResultSet rs = null;
		ArrayList<JobPost> list = null;
		
		String sql = "select * from job_post order by post_seq desc";
		
		try {
			conn = db.getConnection();
			pt = conn.prepareStatement(sql);
			
			rs = pt.executeQuery();
			list = new ArrayList<JobPost>();
					
			while (rs.next()) {
				list.add(new JobPost(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getDate(7),
						rs.getDate(8), rs.getInt(9), rs.getInt(10), rs.getInt(11), rs.getString(12), rs.getDate(13)));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public void update(JobPost jp) {
		Connection conn = null;
		PreparedStatement pt = null;
		
		String sql = "update job_post set post_corp_name =?, post_name=?, post_url=?, post_img=?, post_content=?, post_period_start=?,"
				+ " post_period_end=?, post_like=?, post_unlike=?, post_view=?, post_classi_code=?, post_add_date=sysdate where post_seq=?";
		
		try {
			conn = db.getConnection();
			pt = conn.prepareStatement(sql);
			pt.setString(1, jp.getPostCorpName());
			pt.setString(2, jp.getPostName());
			pt.setString(3, jp.getPostUrl());
			pt.setString(4, jp.getPostImg());
			pt.setString(5, jp.getPostContent());
			pt.setDate(6, jp.getPostPeriodStart());
			pt.setDate(7, jp.getPostPeriodEnd());
			pt.setInt(8, jp.getPostLike());
			pt.setInt(9, jp.getPostDislike());
			pt.setInt(10, jp.getPostView());
			pt.setString(11, jp.getPostClassiCode());
			pt.setInt(12, jp.getNum());

			pt.executeUpdate();

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}

	}

	@Override
	public void delete(int num) {
		Connection conn = null;
		PreparedStatement pt = null;
		
		String sql = "delete job_post where post_seq=?";
		
		try {
			conn = db.getConnection();
			pt = conn.prepareStatement(sql);
			pt.setInt(1, num);
			
			pt.executeUpdate();

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	
}
