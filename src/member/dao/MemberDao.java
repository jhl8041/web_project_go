package member.dao;

import java.sql.Date;
import java.util.List;

import model.Member;

public interface MemberDao {
	void insert(Member m);

	Member select(String id);
	
	Member select(int num);
	
	List<Member> selectAll();

	void update(Member m);

	void delete(String id);
	
	boolean findNick(String nickname);
	
	boolean findEmail(String email);
	
	boolean matchInfo(String id, String email, String name, Date birthdate);
	
	String findLostId(String email, String name, Date birthdate);
	
	void updatePwd(String id, String pwd);
	
	void updateNoPwd(Member m);
	
	void updateWithPwd(Member m);
}
