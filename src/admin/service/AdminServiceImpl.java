package admin.service;

import admin.dao.AdminDao;
import admin.dao.AdminDaoImpl;
import model.Admin;

public class AdminServiceImpl implements AdminService{
	private AdminDao dao;

	public AdminServiceImpl() {
		dao = new AdminDaoImpl();
	}
	
	@Override
	public Admin getAdmin(String id) {
		return dao.select(id);
	}
	
}
