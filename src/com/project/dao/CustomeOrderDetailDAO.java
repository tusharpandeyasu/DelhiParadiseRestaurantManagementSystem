package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.project.javabean.CustOrder;
import com.project.javabean.CustOrderDetail;
import com.project.util.DataBasePoolUtil;

public class CustomeOrderDetailDAO {
	public boolean addOrderDetail(CustOrderDetail o) throws Exception {
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "insert into cust_order_detail_table (order_id,food_id,order_detail_num) values (?,?,?)";
		PreparedStatement prestmt = conn.prepareStatement(sql);
		prestmt.setInt(1, o.getOrder_id());
		prestmt.setInt(2, o.getFood_id());
		prestmt.setInt(3, o.getOrder_detail_num());
		prestmt.executeUpdate();
		DataBasePoolUtil.closeConnection(conn);
		return true;
	}
	public List<CustOrderDetail> listAllOrderDetailsByOrderID(int order_id) throws Exception {
		List<CustOrderDetail> orderDetails = new ArrayList<CustOrderDetail>();
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "select * from cust_order_detail_table where order_id="+order_id;
		PreparedStatement prestmt = conn.prepareStatement(sql);
		ResultSet result = prestmt.executeQuery(sql);

		while (result.next()) {
			CustOrderDetail o = new CustOrderDetail();
			o.setOrder_id(result.getInt("order_id"));
			o.setOrder_detail_num(result.getInt("order_detail_num"));
			o.setFood_id(result.getInt("food_id"));
			orderDetails.add(o);
		}
		DataBasePoolUtil.closeConnection(conn);
		return orderDetails;
	}
}
