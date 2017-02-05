package com.project.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.project.javabean.Role;

public class ManageSession {

	private HttpServletRequest request = null;

	public ManageSession(HttpServletRequest request) {
		this.request = request;
	}

	public boolean checkUser() {
		HttpSession session = request.getSession();

		if (session.getAttribute("user") == null)
			return false;
		else
			return true;
	}

	public String getUser_name() {
		String user_name = "";
		HttpSession session = request.getSession();
		Role user = (Role) session.getAttribute("user");
		user_name = user.getUser_name();
		return user_name;
	}

	public int getUser_id() {
		int user_id = -1;
		HttpSession session = request.getSession();
		Role user = (Role) session.getAttribute("user");
		user_id = user.getUser_id();
		return user_id;
	}

	public boolean checkAdministrator() {
		HttpSession session = request.getSession();

		if (session.getAttribute("administrator") == null)
			return false;
		else
			return true;
	}
}
