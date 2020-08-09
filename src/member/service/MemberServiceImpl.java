package member.service;

import java.sql.Date;
import java.util.List;

import member.dao.MemberDao;
import member.dao.MemberDaoImpl;
import model.Member;

public class MemberServiceImpl implements MemberService {
	private MemberDao dao;

	@Override
	public void editMemberwithid(Member m) {
		dao.updatewithid(m);	
	}

	public MemberServiceImpl() {
		dao = new MemberDaoImpl();
	}
	
	@Override
	   public void insertProfile(int seq, String img) {
	      dao.insertProfile(seq, img);
	   }

	
	@Override
	public void join(Member m) {
		dao.insert(m);
		
	}

	@Override
	public Member getMember(int num) {
		return dao.select(num);
	}
	
	@Override
	public Member getMember(String id) {
		return dao.select(id);
	}


	@Override
	public void editMember(Member m) {
		dao.update(m);
		
	}

	@Override
	public void delMember(String id) {
		dao.delete(id);
		
	}

	@Override
	public boolean findSameId(String id) {
		if (dao.select(id)!=null)
			return true;
		else
			return false;	
	}

	@Override
	public boolean findSameNickname(String nickname) {
		return dao.findNick(nickname);
	}

	@Override
	public boolean findSameEmail(String email) {
		return dao.findEmail(email);
	}

	@Override
	public String findLostId(String email, String name, Date birthdate) {
		return dao.findLostId(email, name, birthdate);
	}

	@Override
	public boolean matchInfo(String id, String email, String name, Date birthdate) {
		return dao.matchInfo(id, email, name, birthdate);
	}

	@Override
	public void updatePwd(String id, String pwd) {
		dao.updatePwd(id, pwd);
	}

	@Override
	public List<Member> getMemberAll() {
		return dao.selectAll();
	}

	@Override
	public void editMemberNoPwd(Member m) {
		dao.updateNoPwd(m);
		
	}

	@Override
	public void editMemberWithPwd(Member m) {
		dao.updateWithPwd(m);
		
	}

	@Override
	public String searchProfileImg(int seq) {
		return dao.searchProfile(seq);
		
	}
	
	
	
	
	
}
