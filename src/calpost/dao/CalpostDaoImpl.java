package calpost.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.DBConnect;
import model.CalVo;

public class CalpostDaoImpl implements CalpostDao{
	
	private DBConnect db;

	public CalpostDaoImpl() {
		db= DBConnect.getInstance();
		
	}
	
	@Override
	public ArrayList<CalVo> selectAllBySeq(int num) {
		 Connection conn = db.getConnection(); 
		  	ArrayList<CalVo>  list = new ArrayList<CalVo>();
			ResultSet rs = null;
			
			String sql ="select * from calpost where user_seq = ?";
			try {
				PreparedStatement pstm = conn.prepareStatement(sql);
				pstm.setInt(1, num);
				
				rs = pstm.executeQuery();
				while (rs.next()) {
					list.add(new CalVo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getDate(7), rs.getDate(8)));
				}
			} catch (SQLException e) {
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
	public void insert(CalVo c) {
		Connection conn = null;
		PreparedStatement pt = null;
		
		String sql = "insert into calpost values(seq_seq.nextval,?,?,?,?,?,?,sysdate)";
		try {
			conn = db.getConnection();
			pt = conn.prepareStatement(sql);
			
			pt.setInt(1, c.getUserseq());
			pt.setString(2, c.getId());
			pt.setString(3, c.getTitle());
			pt.setString(4, c.getContent());
			pt.setDate(5, c.getStartdate());
			pt.setDate(6, c.getEnddate());

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
	public void delete(int num, String title, String content) {
		Connection conn = null;
		PreparedStatement pt = null;
		
		String sql = "delete calpost where user_seq=? and posttitle=? and postcontent=?";
		try {
			conn = db.getConnection();
			pt = conn.prepareStatement(sql);
			
			pt.setInt(1, num);
			pt.setString(2, title);
			pt.setString(3, content);

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
