package com.project.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.javabean.Menu;
import com.project.service.MenuService;
import com.project.util.*;

/**
 * Servlet implementation class MenuServlet
 */

@WebServlet( name = "MenuServlet", urlPatterns = { "/MenuServlet" } )
public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MenuServlet() {
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
		String which = request.getParameter("which");
		MenuService service = new MenuService();
		try {
			if (type.equals("add")) {
				
				FileUploadUtil fileUploadUtil = new FileUploadUtil(request);
				String food_name = fileUploadUtil.getParameter("food_name");
				String food_description = fileUploadUtil.getParameter("food_description");
				double food_price = Double.parseDouble(fileUploadUtil.getParameter("food_price"));
				
				BufferedInputStream inputStream = fileUploadUtil
						.getInputStream("profile");
				String food_image_path = fileUploadUtil.getFileName("profile");
				String name = "";
				if (inputStream != null && !food_image_path.equals("")) {
					Calendar calendar = Calendar.getInstance();
					name = String.valueOf(calendar.getTimeInMillis())
							+ food_image_path.substring(food_image_path.lastIndexOf("."));
					
					String filepath = request.getServletContext().getRealPath("MenuImages")
							+ "\\" + name;
				
					File file = new File(filepath);
					OutputStream outStream = new FileOutputStream(file);
					BufferedOutputStream outputStream = new BufferedOutputStream(
							outStream);
					WriteImageUtil imgUtil = new WriteImageUtil();
					imgUtil.writeImg(inputStream, outputStream);
				}
				Menu food = new Menu();
				food.setFood_description(food_description);
				food.setFood_image_path(name);
				food.setFood_name(food_name);
				food.setFood_price(food_price);
				if (which.equals("food")){
					String cook = fileUploadUtil.getParameter("cook");
					food.setFood_type(1);
					food.setCook(cook);
					service.addFood(food);		
					response.sendRedirect("menuList.jsp");
				}
				else
				{
					String drink_type = fileUploadUtil.getParameter("drink_type");
					
					food.setFood_type(2);
					food.setDrink_type(drink_type);
					service.addFood(food);		
					response.sendRedirect("drinkList.jsp");
				}
				
			} 
			else if (type.equals("delete")) {
				int food_id = Integer.parseInt(request.getParameter("food_id"));
				service.deleteFoodByFoodId(food_id);
				
				if (which.equals("food"))
					response.sendRedirect("menuList.jsp");
				else
					response.sendRedirect("drinkList.jsp");
					
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
