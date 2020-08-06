package member.service;

import java.sql.Date;
import java.util.List;
import model.Member;

public interface MemberService {
	void join(Member m);

	Member getMember(int num);
	
	Member getMember(String id);

	void editMember(Member m);

	void delMember(String id);
	
	boolean findSameId(String id);
	
	boolean findSameNickname(String nickname);
	
	boolean findSameEmail(String email);
	
	String findLostId(String email, String name, Date birthdate);
	
	boolean matchInfo(String id, String email, String name, Date birthdate);
	
	void updatePwd(String id, String pwd);
	
	public List<Member> getMemberAll();
	
	void editMemberNoPwd(Member m);
	
	void editMemberWithPwd(Member m);
}
