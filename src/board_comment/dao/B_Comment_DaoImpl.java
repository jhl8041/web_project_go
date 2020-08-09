package board_comment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.DBConnect;
import model.Board;
import model.Board_comment;

public class B_Comment_DaoImpl implements B_Comment_Dao{
	
	private DBConnect db;

	public B_Comment_DaoImpl() {
		db = DBConnect.getInstance();
	}

	@Override
	public void insert(Board_comment b_c) {
		Connection conn =null;
		//board db에 한줄 추가하는 sql
		String sql = "insert into board_comments values(?,?,?,?,sysdate,board_comments_seq.nextval)";
		PreparedStatement pstmt=null;
		try {
			//커넥션 객체 획득
			conn = db.getConnection();
			//java에서  sql을 실행하는 PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			//sql의 ?파라메터 매칭
			pstmt.setInt(1, b_c.getBoard_comment_parent_seq());
			pstmt.setString(2, b_c.getBoard_comment_user_id());
			pstmt.setString(3, b_c.getBoard_comment_writer());
			pstmt.setString(4, b_c.getBoard_comment_content());

			//sql 실행
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
	public List selectAll(int seq) {
		Connection conn = null;
		ResultSet rs = null;
		ArrayList<Board_comment> list = new ArrayList<Board_comment>();

		// 전체 검색하는 sql문
		String sql = "select * from board_comments where board_comment_parent_seq=? order by board_comment_seq ";
		PreparedStatement pstmt = null;
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Board_comment(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)
						,rs.getDate(5),rs.getInt(6)));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// 검색 결과가 저장된 list 반환
		return list;
	}

	@Override
	public void updateContent(Board_comment b_c) {
		Connection conn =null;
		boolean result=false;
		String sql = "update board_comments set board_comment_content=?,board_comment_sysdate=sysdate where board_comments_seq=?";
		PreparedStatement pstmt=null;
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b_c.getBoard_comment_content());
			pstmt.setInt(2, b_c.getBoard_comment_seq());
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
	public void delete(int seq) {
		Connection conn =null;
		//seq로 row 삭제하는 sql
		String sql = "delete board_comments where board_comment_seq =?";
		PreparedStatement pstmt=null;
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
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
