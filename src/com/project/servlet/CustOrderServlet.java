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

import com.project.javabean.CustOrder;
import com.project.javabean.CustOrderDetail;
import com.project.service.CustOrderService;

@WebServlet("/CustOrderServlet")
public class CustOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CustOrderServlet() {
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
		
		CustOrderService service = new CustOrderService();
		try {
			if (type.equals("add")) {
				String orderString = request.getParameter("orderString");
				service.addOrder(orderString);
				response.sendRedirect("orderList.jsp");
			} else if (type.equals("begin_cooking")) {
				int order_id = Integer.parseInt(request.getParameter("order_id"));
				CustOrder order = service.getOrderByOrderId(order_id);
				order.setOrder_state(2);
				service.modifyOrderState(order);
				response.sendRedirect("orderList.jsp");
			}else if (type.equals("finish_cooking")) {
				int order_id = Integer.parseInt(request.getParameter("order_id"));
				CustOrder order = service.getOrderByOrderId(order_id);
				order.setOrder_state(3);
				service.modifyOrderState(order);
				response.sendRedirect("orderList.jsp");
			}
			else if (type.equals("delete")) {
				int order_id = Integer.parseInt(request.getParameter("order_id"));
				service.deleteOrderByOrderId(order_id);
				String finance = request.getParameter("which");
				if(finance==null)
					response.sendRedirect("orderList.jsp");
				else
					response.sendRedirect("financeManage.jsp");
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
