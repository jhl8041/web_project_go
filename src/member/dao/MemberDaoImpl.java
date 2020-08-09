package member.dao;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.DBConnect;
import model.JobPost;
import model.Member;

public class MemberDaoImpl implements MemberDao {
	private DBConnect db;

	public MemberDaoImpl() {
		db = DBConnect.getInstance();
	}

	@Override
	public void updatewithid(Member m) {
		Connection conn = null;
		PreparedStatement pt = null;
				
		String sql = "update member_info set member_pwd=?, member_name=?, member_nickname=?, member_phone=?, member_birthdate=?,"
				+ " member_email=?, member_gender=?, member_address=?, member_pref_code=? where member_id=?";
		try {
			conn = db.getConnection();
			
			pt = conn.prepareStatement(sql);
			pt.setString(1, m.getPwd());
			pt.setString(2, m.getName());
			pt.setString(3, m.getNickname());
			pt.setString(4, m.getPhone());
			pt.setDate(5, m.getBirthdate());
			pt.setString(6, m.getEmail());
			pt.setString(7, m.getGender());
			pt.setString(8, m.getAddress());
			pt.setString(9, m.getPrefCode());
			pt.setString(10,m.getId());
			
			pt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pt.close();
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public void insert(Member m) {
		Connection conn = null;
		PreparedStatement pt = null;
		
		String sql = "insert into member_info values(member_seq.nextval,?,?,?,?,?,?,?,?,sysdate,?,?)";
		try {
			conn = db.getConnection();
			pt = conn.prepareStatement(sql);
			
			pt.setString(1, m.getId());
			pt.setString(2, m.getPwd());
			pt.setString(3, m.getName());
			pt.setString(4, m.getNickname());
			pt.setString(5, m.getPhone());
			pt.setDate(6, m.getBirthdate());
			pt.setString(7, m.getEmail());
			pt.setString(8, m.getGender());
			pt.setString(9, m.getAddress());
			pt.setString(10, m.getPrefCode());

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
	public Member select(int num) {
		Connection conn = null;
		PreparedStatement pt = null;
		ResultSet rs = null;
		
		String sql = "select * from member_info where member_seq=?";
		try {
			conn = db.getConnection();
			
			pt = conn.prepareStatement(sql);
			pt.setInt(1, num);
			
			rs = pt.executeQuery();
			
			if(rs.next()) {
				return new Member(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),
						rs.getString(6),rs.getDate(7),rs.getString(8),rs.getString(9),
						rs.getDate(10),rs.getString(11),rs.getString(12));
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
	public void update(Member m) {
		Connection conn = null;
		PreparedStatement pt = null;
				
		String sql = "update member_info set member_pwd=?, member_name=?, member_nickname=?, member_phone=?, member_birthdate=?,"
				+ " member_email=?, member_gender=?, member_address=?, member_pref_code=? where member_seq=?";
		try {
			conn = db.getConnection();
			
			pt = conn.prepareStatement(sql);
			pt.setString(1, m.getPwd());
			pt.setString(2, m.getName());
			pt.setString(3, m.getNickname());
			pt.setString(4, m.getPhone());
			pt.setDate(5, m.getBirthdate());
			pt.setString(6, m.getEmail());
			pt.setString(7, m.getGender());
			pt.setString(8, m.getAddress());
			pt.setString(9, m.getPrefCode());
			pt.setInt(10,m.getNum());
			
			pt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pt.close();
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		 
	}

	@Override
	public void delete(String id) {
		Connection conn = null;
		PreparedStatement pt = null;
		
		String sql = "delete member_info where member_id=?";
		
		try {
			conn = db.getConnection();
			
			pt = conn.prepareStatement(sql);
			pt.setString(1, id);
			
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
	public boolean findNick(String nickname) {
		Connection conn = null;
		PreparedStatement pt = null;
		ResultSet rs = null;
		
		String sql = "select * from member_info where member_nickname=?";
		try {
			conn = db.getConnection();

			pt = conn.prepareStatement(sql);
			pt.setString(1, nickname);
			
			rs = pt.executeQuery();
			
			if(rs.next()) {
				return true;
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
		return false;
	}

	@Override
	public boolean findEmail(String email) {
		Connection conn = null;
		PreparedStatement pt = null;
		ResultSet rs = null;
		
		String sql = "select * from member_info where member_email=?";
		try {
			conn = db.getConnection();

			pt = conn.prepareStatement(sql);
			pt.setString(1, email);
			
			rs = pt.executeQuery();
			
			if(rs.next()) {
				return true;
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
		return false;
	}
	
	@Override
	public boolean matchInfo(String id, String email, String name, Date birthdate) {
		Connection conn = null;
		PreparedStatement pt = null;
		ResultSet rs = null;
		
		String sql = "select member_nickname from member_info where member_email=? and member_name=? "
				+ "and member_birthdate=? and member_id=?";
		try {
			conn = db.getConnection();

			pt = conn.prepareStatement(sql);
			pt.setString(1, email);
			pt.setString(2, name);
			pt.setDate(3, birthdate);
			pt.setString(4, id);
			
			rs = pt.executeQuery();
			
			if(rs.next()) {
				return true;
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
		return false;
	}
	
	

	@Override
	public String findLostId(String email, String name, Date birthdate) {
		Connection conn = null;
		PreparedStatement pt = null;
		ResultSet rs = null;
		
		String sql = "select member_id from member_info where member_email=? and member_name=? and member_birthdate=?";
		try {
			conn = db.getConnection();

			pt = conn.prepareStatement(sql);
			pt.setString(1, email);
			pt.setString(2, name);
			pt.setDate(3, birthdate);
			
			rs = pt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
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
	public void updatePwd(String id, String pwd) {
		Connection conn = null;
		PreparedStatement pt = null;
				
		String sql = "update member_info set member_pwd=? where member_id=?";
		try {
			conn = db.getConnection();
			
			pt = conn.prepareStatement(sql);
			pt.setString(1, pwd);
			pt.setString(2, id);
			
			pt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pt.close();
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public List<Member> selectAll() {
		Connection conn = null;
		PreparedStatement pt = null;
		ResultSet rs = null;
		ArrayList<Member> list = null;
		
		String sql = "select * from member_info order by member_joindate";
		
		try {
			conn = db.getConnection();
			pt = conn.prepareStatement(sql);
			
			rs = pt.executeQuery();
			list = new ArrayList<Member>();
					
			while (rs.next()) {
				list.add(new Member(rs.getInt(1),rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getDate(7),rs.getString(8),
						rs.getString(9), rs.getDate(10), rs.getString(11), rs.getString(12)));
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
	public Member select(String id) {
		Connection conn = null;
		PreparedStatement pt = null;
		ResultSet rs = null;
		
		String sql = "select * from member_info where member_id=?";
		try {
			conn = db.getConnection();
			
			pt = conn.prepareStatement(sql);
			pt.setString(1, id);
			
			rs = pt.executeQuery();
			
			if(rs.next()) {
				return new Member(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),
						rs.getString(6),rs.getDate(7),rs.getString(8),rs.getString(9),
						rs.getDate(10),rs.getString(11),rs.getString(12));
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
	public void updateNoPwd(Member m) {
		Connection conn = null;
		PreparedStatement pt = null;
				
		String sql = "update member_info set member_name=?, member_nickname=?, member_phone=?, member_birthdate=?,"
				+ " member_gender=?, member_email=?, member_address=?, member_pref_code=? where member_id=?";
		try {
			conn = db.getConnection();
			
			pt = conn.prepareStatement(sql);
			pt.setString(1, m.getName());
			pt.setString(2, m.getNickname());
			pt.setString(3, m.getPhone());
			pt.setDate(4, m.getBirthdate());
			pt.setString(5, m.getGender());
			pt.setString(6, m.getEmail());
			pt.setString(7, m.getAddress());
			pt.setString(8, m.getPrefCode());
			pt.setString(9, m.getId());
			
			pt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pt.close();
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}

	@Override
	public void updateWithPwd(Member m) {
		Connection conn = null;
		PreparedStatement pt = null;
				
		String sql = "update member_info set member_name=?, member_nickname=?, member_phone=?, member_birthdate=?,"
				+ " member_gender=?, member_email=?, member_address=?, member_pref_code=?, member_pwd=? where member_id=?";
		try {
			conn = db.getConnection();
			
			pt = conn.prepareStatement(sql);
			pt.setString(1, m.getName());
			pt.setString(2, m.getNickname());
			pt.setString(3, m.getPhone());
			pt.setDate(4, m.getBirthdate());
			pt.setString(5, m.getGender());
			pt.setString(6, m.getEmail());
			pt.setString(7, m.getAddress());
			pt.setString(8, m.getPrefCode());
			pt.setString(9, m.getPwd());
			pt.setString(10, m.getId());
			
			pt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pt.close();
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
	}

	
	
	
	
	
	
	
}
