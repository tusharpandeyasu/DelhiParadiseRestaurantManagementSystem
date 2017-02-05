package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.project.javabean.CustOrder;
import com.project.javabean.Role;
import com.project.util.DataBasePoolUtil;

public class CustomerOrderDAO {
	
	public boolean addOrder(CustOrder o) throws Exception {
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "insert into custorder_table (order_state,order_date,order_id,order_price) values (?,?,?,?)";
		PreparedStatement prestmt = conn.prepareStatement(sql);
		prestmt.setInt(1, o.getOrder_state());
		
		prestmt.setString(2,o.getOrder_date() );
		prestmt.setInt(3, o.getOrder_id()+ 1);
		prestmt.setFloat(4, (float) o.getOrder_price());
		prestmt.executeUpdate();
		DataBasePoolUtil.closeConnection(conn);
		return true;
	}
	public int getOrderIdByOrder(CustOrder o) throws Exception {
		int order_id=-1;
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "select * from custorder_table where order_date='" + o.getOrder_date()+
				"' and order_state="+o.getOrder_state();
		PreparedStatement prestmt = conn.prepareStatement(sql);
		ResultSet result = prestmt.executeQuery(sql);
		if (result.next()) {
			order_id=result.getInt("order_id");
		}
		DataBasePoolUtil.closeConnection(conn);
		return order_id;
	}
	public CustOrder getOrderByOrderId(int order_id) throws Exception {
		CustOrder o = new CustOrder();
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "select * from custorder_table where order_id=" + order_id;
		PreparedStatement prestmt = conn.prepareStatement(sql);
		ResultSet result = prestmt.executeQuery(sql);
		if (result.next()) {
			o.setOrder_id(order_id);
			o.setOrder_date(result.getString("order_date"));
			o.setOrder_price(result.getDouble("order_price"));
			o.setOrder_state(result.getInt("order_state"));
		}
		DataBasePoolUtil.closeConnection(conn);
		return o;
	}
	public List<CustOrder> listAllOrders() throws Exception {
		List<CustOrder> orders = new ArrayList<CustOrder>();
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "select * from custorder_table";
		PreparedStatement prestmt = conn.prepareStatement(sql);
		ResultSet result = prestmt.executeQuery(sql);

		while (result.next()) {
			CustOrder o = new CustOrder();
			o.setOrder_id(result.getInt("order_id"));
			o.setOrder_date(result.getString("order_date"));
			o.setOrder_state(result.getInt("order_state"));
			o.setOrder_price(result.getDouble("order_price"));
			orders.add(o);
		}
		DataBasePoolUtil.closeConnection(conn);
		return orders;
	}
	
	public boolean deleteOrderByOrderId(int order_id) throws Exception {
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "delete from custorder_table where order_id=?";
		PreparedStatement prestmt = conn.prepareStatement(sql);
		prestmt.setInt(1, order_id);
		prestmt.executeUpdate();
		DataBasePoolUtil.closeConnection(conn);
		return true;
	}
	public boolean modifyOrderState(CustOrder o) throws Exception {
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "update custorder_table set order_state=? where order_id=?";
		PreparedStatement prestmt = conn.prepareStatement(sql);
		prestmt.setInt(1, o.getOrder_state());
		prestmt.setInt(2, o.getOrder_id());
		
		prestmt.executeUpdate();
		DataBasePoolUtil.closeConnection(conn);
		return true;
	}
	public boolean modifyOrderPrice(CustOrder o) throws Exception {
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "update custorder_table set order_price=? where order_id=?";
		PreparedStatement prestmt = conn.prepareStatement(sql);
		prestmt.setDouble(1, o.getOrder_price());
		prestmt.setInt(2, o.getOrder_id());
		
		prestmt.executeUpdate();
		DataBasePoolUtil.closeConnection(conn);
		return true;
	}
}