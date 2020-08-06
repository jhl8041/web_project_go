package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.DBConnect;
import model.Board;
import model.Member;

public class DaoImpl implements Dao {
	private DBConnect db;

	public DaoImpl() {
		db = DBConnect.getInstance();
	}

	@Override
	public void insert(Board b) {
		Connection conn =null;
		//board db에 한줄 추가하는 sql
		String sql = "insert into board values(board_seq.nextval,?,?,?,?,?,sysdate,?,?,?)";
		PreparedStatement pstmt=null;
		try {
			//커넥션 객체 획득
			conn = db.getConnection();
			//java에서  sql을 실행하는 PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			//sql의 ?파라메터 매칭
			pstmt.setString(1, b.getBoard_code());
			pstmt.setString(2, b.getBoard_user_id());
			pstmt.setString(3, b.getBoard_writer());
			pstmt.setString(4, b.getBoard_title());
			pstmt.setString(5, b.getBoard_content());
			pstmt.setInt(6, b.getBoard_like());
			pstmt.setInt(7, b.getBoard_unlike());
			pstmt.setInt(8, b.getBoard_view());

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
	public Board select(int seq) {
		Connection conn = null;
		ResultSet rs = null;
		Board b = null;
		//board에서 board_seq로  한줄 검색해오는  sql
		String sql1 = "update board set board_view=(board_view+1) where board_seq =?";
		String sql2 = "select * from board where board_seq=?";
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		try {
			conn = db.getConnection();
			pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setInt(1, seq);
			pstmt1.executeUpdate();
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, seq);
			// sql실행하여 검색된 결과를 ResultSet에 저장
			rs = pstmt2.executeQuery();
			// 검색 결과가 있다면 컬럼 값 하나씩 읽어서 Board 객체를 생성하여 반환
			if (rs.next()) {
				return new Board(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)
						,rs.getString(5),rs.getString(6),rs.getDate(7),
						rs.getInt(8),rs.getInt(9),rs.getInt(10));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { //무조건 받아주겠다
			try {
				rs.close();
				pstmt1.close();pstmt2.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return null;
	}

	@Override
	public List selectBoardList(String board_code,int page) {
		Connection conn = null;
		ResultSet rs = null;
		ArrayList<Board> list = new ArrayList<Board>();
		PreparedStatement pstmt = null;

		// 전체 검색하는 sql문	
		String sql ="select board_seq, board_title, board_writer, board_sysdate, board_view, board_like, board_unlike from (select rownum r, board_seq, board_title, board_writer, board_sysdate, board_view, board_like, board_unlike from (select * from board where board_code=? order by board_seq desc)) where r>=? and r <=?";	
		
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, board_code);
			//한페이지당 게시글 개수(3) 지정
			pstmt.setInt(2, (page-1)*3+1);
			pstmt.setInt(3, page*3);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Board(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getDate(4)
						,rs.getInt(5),rs.getInt(6),rs.getInt(7)));
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
	public void updateContent(Board b) {
		Connection conn =null;
		boolean result=false;
		//w_date, title, content 컬럼을 수정하는 sql
		String sql = "update board set board_sysdate=sysdate,board_title=?,board_content=? where board_seq=?";
		PreparedStatement pstmt=null;
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBoard_title());
			pstmt.setString(2, b.getBoard_content());
			pstmt.setInt(3, b.getBoard_seq());
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
		String sql = "delete board where board_seq =?";
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
	
	@Override
	public void updateLike(int seq, boolean like) {
		Connection conn =null;
		//num이 동일한 줄을 sql
		String sql;
		String sql2;
		if (like) 
			sql = "update board set board_like=(board_like+1) where board_seq =?";
		else 
			sql = "update board set board_unlike=(board_unlike+1) where board_seq =?";
		sql2 ="update board set board_view=(board_view-1) where board_seq =?";
		
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, seq);
			pstmt2.executeUpdate();
			
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
	public void updateViewCount(int seq) {
		Connection conn =null;
		//w_date, title,content 컬럼을 수정하는 sql
		String sql = "update board set board_view=(board_view+1) where board_seq =?";
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

	@Override
	public Board MyLastBoard(String member_id) {
		Connection conn = null;
		ResultSet rs = null;
		Board b = null;
		String sql = null;
		//board에서 board_seq로  한줄 검색해오는  sql
		sql = "select * from board where board_seq=(select max(board_seq) from board where board_user_id=?)";
		PreparedStatement pstmt= null;
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			pstmt.executeUpdate();
			// sql실행하여 검색된 결과를 ResultSet에 저장
			rs = pstmt.executeQuery();
			// 검색 결과가 있다면 컬럼 값 하나씩 읽어서 Board 객체를 생성하여 반환
			if (rs.next()) {
				return new Board(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)
						,rs.getString(5),rs.getString(6),rs.getDate(7),
						rs.getInt(8),rs.getInt(9),rs.getInt(10));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { //무조건 받아주겠다
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return null;
	}

	
	
	
}
