package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import com.project.javabean.Role;
import com.project.util.DataBasePoolUtil;

public class RolesDAO {

	public boolean addUser(Role u) throws Exception {

		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "insert into role_table(user_name,user_pass,user_type,user_id) values (?,?,?,?)";
		PreparedStatement prestmt = conn.prepareStatement(sql);
		prestmt.setString(1, u.getUser_name());
		prestmt.setString(2, u.getUser_pass());
		prestmt.setInt(3, u.getUser_type());
		prestmt.setInt(4, u.getUser_id()+1);
		prestmt.executeUpdate();
		DataBasePoolUtil.closeConnection(conn);
		return true;
	}

	public boolean isExist(Role u) throws Exception {

		boolean flag = false;
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "select * from role_table where user_name='"
				+ u.getUser_name() + "' and user_pass='" + u.getUser_pass()
				+ "'";
		PreparedStatement prestmt = conn.prepareStatement(sql);
		ResultSet result = prestmt.executeQuery(sql);
		if (result.next())
			flag = true;
		DataBasePoolUtil.closeConnection(conn);
		return flag;
	}

	public boolean deleteUserByUid(int user_id) throws Exception {
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "delete from role_table where user_id=?";
		PreparedStatement prestmt = conn.prepareStatement(sql);
		prestmt.setInt(1, user_id);
		prestmt.executeUpdate();
		DataBasePoolUtil.closeConnection(conn);
		return true;
	}

	

	public List<Role> listAllUsers() throws Exception {
		List<Role> users = new ArrayList<Role>();
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "select * from role_table";
		PreparedStatement prestmt = conn.prepareStatement(sql);
		ResultSet result = prestmt.executeQuery(sql);

		while (result.next()) {
			Role u = new Role();
			u.setUser_id(result.getInt("user_id"));
			u.setUser_name(result.getString("user_name"));
			u.setUser_pass(result.getString("user_pass"));
			u.setUser_type(result.getInt("user_type"));
			users.add(u);
		}
		DataBasePoolUtil.closeConnection(conn);
		return users;
	}

	public Role getUserByUserId(int user_id) throws Exception {
		Role u = new Role();
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "select * from role_table where user_id=" + user_id;
		PreparedStatement prestmt = conn.prepareStatement(sql);
		ResultSet result = prestmt.executeQuery(sql);
		if (result.next()) {
			u.setUser_id(user_id);
			u.setUser_name(result.getString("user_name"));
			u.setUser_pass(result.getString("user_pass"));
			u.setUser_type(result.getInt("user_type"));
		}
		DataBasePoolUtil.closeConnection(conn);
		return u;
	}

	public int getUserIdByUserName(String user_name) throws SQLException {
		int value = 0;
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "select * from role_table where user_name='" + user_name
				+ "'";
		PreparedStatement prestmt = conn.prepareStatement(sql);

		ResultSet result = prestmt.executeQuery(sql);
		if (result.next()) {
			value = result.getInt("user_id");
		}
		DataBasePoolUtil.closeConnection(conn);
		return value;

	}

	public String getUserNameByUserId(int user_id) throws Exception {
		String str = null;
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "select * from role_table where user_id='" + user_id + "'";
		PreparedStatement prestmt = conn.prepareStatement(sql);

		ResultSet result = prestmt.executeQuery(sql);
		if (result.next()) {
			str = result.getString("user_name");
		}
		DataBasePoolUtil.closeConnection(conn);
		return str;
	}
	public int getUserTotalNum() throws Exception {
		int user_num = 0;
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "select * from role_table ";
		PreparedStatement prestmt = conn.prepareStatement(sql);
		ResultSet result = prestmt.executeQuery(sql);
		if (result.next()) {
			result.last();
			user_num = result.getRow();
		} else {
			user_num = 0;
		}
		DataBasePoolUtil.closeConnection(conn);
		return user_num;
	}
	
	public List<Role> listAllUserOrderByUserId(int begin, int offset) throws Exception{
		List<Role> users = new ArrayList<Role>();
		Connection conn = DataBasePoolUtil.getConnection();

		String sql = "select * from role_table order by user_id desc limit "
				+ begin + "," + offset;
		PreparedStatement prestmt = conn.prepareStatement(sql);
		ResultSet result = prestmt.executeQuery(sql);

		while (result.next()) {
			Role u = new Role();
			u.setUser_id(result.getInt("user_id"));
			u.setUser_name(result.getString("user_name"));
			u.setUser_pass(result.getString("user_pass"));
			u.setUser_type(result.getInt("user_type"));
			users.add(u);
		}
		DataBasePoolUtil.closeConnection(conn);
		return users;
	}
}
