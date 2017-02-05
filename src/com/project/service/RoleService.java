package com.project.service;

import java.sql.SQLException;
import java.util.List;

import com.project.dao.RolesDAO;
import com.project.javabean.Role;

public class RoleService {
	RolesDAO dao = new RolesDAO();

	public boolean addUser(Role u) throws Exception {
	
		int oldRoleId = dao.listAllUsers().size();
		u.setUser_id(oldRoleId + 1);
		return dao.addUser(u);

	}

	public boolean isExist(Role u) throws Exception {
		
		return dao.isExist(u);
	}

	public boolean deleteUserByUid(int userId) throws Exception {
		
		return dao.deleteUserByUid(userId);
	}


	public List<Role> listAllUsers() throws Exception {
		return dao.listAllUsers();
	}

	public Role getUserByUserId(int user_id) throws Exception {
		return dao.getUserByUserId(user_id);
	}

	public int getUserIdByUserName(String user_name) throws SQLException {
		return dao.getUserIdByUserName(user_name);
	}

	public String getUserNameByUserId(int user_id) throws Exception {
		return dao.getUserNameByUserId(user_id);
	}
	
	public int getUserTotalNum() throws Exception {
		return dao.getUserTotalNum();
	}
	
	public List<Role> listAllUserOrderByUserId(int begin, int offset) throws Exception{
		return dao.listAllUserOrderByUserId(begin, offset);
	}
}
