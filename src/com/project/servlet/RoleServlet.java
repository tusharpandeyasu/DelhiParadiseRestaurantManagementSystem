package com.project.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.javabean.Role;
import com.project.service.RoleService;


@WebServlet("/RoleServlet")
public class RoleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public RoleServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		String type = request.getParameter("type");
		
		RoleService service = new RoleService();
		HttpSession session = request.getSession();
		try {
			if (type.equals("login")) {
				String user_name = request.getParameter("user_name");
				String user_pass = request.getParameter("user_pass");
				Role u = new Role();
				u.setUser_name(user_name);
				u.setUser_pass(user_pass);
				if (service.isExist(u)) {
					int user_id = service.getUserIdByUserName(user_name);
					u.setUser_id(user_id);
					Role user = service.getUserByUserId(user_id);
					u.setUser_type(user.getUser_type());
					session.setAttribute("user", u);
					String jump_url="";
					switch(user.getUser_type())
					{
					case 1:jump_url="postOrder.jsp";break;
					case 2:jump_url="menuList.jsp";break;
					case 3:jump_url="postOrder.jsp";break;
					case 4:jump_url="orderList.jsp";break;
					default:jump_url="error.jsp";break;
					}
					request.getRequestDispatcher(jump_url).forward(request,
							response);
				   } else {
					request.setAttribute("result", "Incorrect Password!!");
					request.getRequestDispatcher("login.jsp").forward(request,
							response);
				   }
				
			}
			else if (type.equals("add")) {
				String user_name = request.getParameter("user_name");
				String user_pass = request.getParameter("user_pass");
				int user_type = Integer.parseInt(request.getParameter("user_type"));
				
				Role u = new Role();
				u.setUser_name(user_name);
				u.setUser_pass(user_pass);
				u.setUser_type(user_type);
				service.addUser(u);
				response.sendRedirect("userManage.jsp");
			} 
			else if (type.equals("delete")) {
				int user_id = Integer.parseInt(request.getParameter("user_id"));
				service.deleteUserByUid(user_id);
				response.sendRedirect("userManage.jsp");
			}
			else if (type.equals("exit")) {
				session.invalidate();
				request.getRequestDispatcher("login.jsp").forward(request,
						response);
			} 
			else {
				response.sendRedirect("error.jsp");
				}
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

}
