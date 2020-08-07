package calpost.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.DBConnect;
import model.CalPostVo;

public class CalpostDaoImpl implements CalpostDao{
	
	private DBConnect db;

	public CalpostDaoImpl() {
		db= DBConnect.getInstance();
		
	}
	
	@Override
	public List getCalPostViewList(String p_id) {
		 Connection conn = db.getConnection(); 
		  	ArrayList<CalPostVo>  list = new ArrayList<CalPostVo>();
			ResultSet rs = null;
			
			String sql ="select *  from postboard where id = ?";
			try {
				PreparedStatement pstm = conn.prepareStatement(sql);
				pstm.setString(1, p_id);
				
				rs = pstm.executeQuery();
				while (rs.next()) {
					list.add(new CalPostVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getDate(6)));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return list;
	}


	


}
