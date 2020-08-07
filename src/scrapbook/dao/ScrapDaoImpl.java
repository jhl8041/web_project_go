package scrapbook.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;
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
	public void insert(int userSeq, int postSeq) {
		
		
	}

	@Override
	public void delete(int userSeq, int postSeq) {
		
		
	}

}
