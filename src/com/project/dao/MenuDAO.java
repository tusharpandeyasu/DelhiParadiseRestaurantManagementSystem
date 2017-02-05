package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.project.javabean.Menu;
import com.project.javabean.Role;
import com.project.util.DataBasePoolUtil;

public class MenuDAO {
	
	public boolean addFood(Menu f) throws Exception {
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "insert into menu_table(food_name,food_description,food_image_path,food_type,food_price,cook,drink_type, food_id) values (?,?,?,?,?,?,?,?)";
		PreparedStatement prestmt = conn.prepareStatement(sql);
		prestmt.setString(1, f.getFood_name());
		prestmt.setString(2, f.getFood_description());
		prestmt.setString(3, f.getFood_image_path());
		prestmt.setInt(4, f.getFood_type());
		prestmt.setDouble(5, f.getFood_price());
		prestmt.setString(6, f.getCook());
		prestmt.setString(7, f.getDrink_type());
		prestmt.setInt(8, f.getFood_id());
		prestmt.executeUpdate();
		DataBasePoolUtil.closeConnection(conn);
		return true;
	}
	
	public int getFoodTotalNum() throws Exception {
		int num = 0;
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "select * from menu_table ";
		PreparedStatement prestmt = conn.prepareStatement(sql);
		ResultSet result = prestmt.executeQuery(sql);
		if (result.next()) {
			result.last();
			num = result.getRow();
		} else {
			num = 0;
		}
		DataBasePoolUtil.closeConnection(conn);
		return num;
	}
	
	public List<Menu> listAllFoodsByFoodType(int food_type) throws Exception {
		List<Menu> foods = new ArrayList<Menu>();
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "select * from menu_table where food_type="+food_type;
		PreparedStatement prestmt = conn.prepareStatement(sql);
		ResultSet result = prestmt.executeQuery(sql);

		while (result.next()) {
			Menu f = new Menu();
			f.setFood_id(result.getInt("food_id"));
			f.setFood_name(result.getString("food_name"));
			f.setFood_description(result.getString("food_description"));
			f.setFood_image_path(result.getString("food_image_path"));
			f.setFood_type(result.getInt("food_type"));
			f.setFood_price(result.getInt("food_price"));
			f.setCook(result.getString("cook"));
			f.setDrink_type(result.getString("drink_type"));
			foods.add(f);
		}
		DataBasePoolUtil.closeConnection(conn);
		return foods;
	}
	
	public boolean deleteFoodByFoodId(int food_id) throws Exception {
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "delete from menu_table where food_id=?";
		PreparedStatement prestmt = conn.prepareStatement(sql);
		prestmt.setInt(1, food_id);
		prestmt.executeUpdate();
		DataBasePoolUtil.closeConnection(conn);
		return true;
	}
	public double getFoodPriceByFoodId(int food_id) throws Exception {
		double food_price=0;
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "select * from menu_table where food_id=" + food_id;
		PreparedStatement prestmt = conn.prepareStatement(sql);
		ResultSet result = prestmt.executeQuery(sql);
		if (result.next()) {
			food_price = result.getDouble("food_price");
		}
		DataBasePoolUtil.closeConnection(conn);
		return food_price;
	}
	
	public Menu getFoodByFoodId(int food_id) throws Exception {
		Menu food = new Menu();
		Connection conn = DataBasePoolUtil.getConnection();
		String sql = "select * from menu_table where food_id=" + food_id;
		PreparedStatement prestmt = conn.prepareStatement(sql);
		ResultSet result = prestmt.executeQuery(sql);
		if (result.next()) {
			food.setFood_price(result.getDouble("food_price"));
			food.setFood_description(result.getString("food_description"));
			food.setFood_id(food_id);
			food.setFood_name(result.getString("food_name"));
			food.setFood_type(result.getInt("food_type"));
			food.setCook(result.getString("cook"));
			food.setDrink_type(result.getString("drink_type"));
		}
		DataBasePoolUtil.closeConnection(conn);
		return food;
	}
}
