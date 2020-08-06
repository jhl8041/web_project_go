package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.DBConnect;
import model.Admin;
import model.Member;

public class AdminDaoImpl implements AdminDao {
	private DBConnect db;

	public AdminDaoImpl() {
		db = DBConnect.getInstance();
	}

	@Override
	public Admin select(String id) {
		Connection conn = null;
		PreparedStatement pt = null;
		ResultSet rs = null;
		
		String sql = "select * from admin_info where admin_id=?";
		try {
			conn = db.getConnection();
			
			pt = conn.prepareStatement(sql);
			pt.setString(1, id);
			
			rs = pt.executeQuery();
			
			if(rs.next()) {
				return new Admin(rs.getString(1),rs.getString(2));
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
	
}
