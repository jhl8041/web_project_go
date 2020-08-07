package cal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.DBConnect;
import model.CalVo;



public class CalDaoImpl implements CalDao {
	
	private DBConnect db;
	
	public CalDaoImpl() {
		db= DBConnect.getInstance();
		
	}

	


	
	  @Override 
	  public void insertCalBoard(CalVo vo) { //�����͸� db�� �Է��ϴ� ���
	  Connection conn = db.getConnection(); 
	  String sql = "insert into calboard values(seq_seq.nextval, ?, ?, ?,?,sysdate)";
	  
	  try { 
		  PreparedStatement pstm = conn.prepareStatement(sql); 
		  
		  pstm.setString(1, vo.getId()); 
		  pstm.setString(2,vo.getTitle());
		  pstm.setString(3, vo.getContent());
		  pstm.setString(4, vo.getMdate()); 
		  pstm.executeUpdate(); 
		  }catch (SQLException e) { e.printStackTrace();
		  } finally { try {
			  conn.close();
	  } catch (SQLException e) { e.printStackTrace(); } }
	  
	  }
	 



	


	
	  @Override 
	  public List getCalViewList( String c_id) {
		  Connection conn = db.getConnection(); 
	  	ArrayList<CalVo>  list = new ArrayList<CalVo>();
		ResultSet rs = null;
		
		String sql ="select *  from calboard where id = ? order by regdate";
		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, c_id);
			
			rs = pstm.executeQuery();
			while (rs.next()) {
				list.add(new CalVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getDate(6)));
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





	@Override
	public void del(String id, String mdate, String title) {
		
		Connection conn = null;
		String sql = "delete calboard where id=? and mdate=? and title = ?";
		PreparedStatement pstmt = null;
		try {
			
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, mdate);
			pstmt.setString(3, title);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	}
	 

	

	}


