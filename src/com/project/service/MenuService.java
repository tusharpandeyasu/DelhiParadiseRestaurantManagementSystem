package com.project.service;

import java.util.List;

import com.project.dao.MenuDAO;
import com.project.javabean.Menu;

public class MenuService {
	
	MenuDAO dao = new MenuDAO();

	public boolean addFood(Menu u) throws Exception {
	
		int oldFoodId = dao.getFoodTotalNum();
		u.setFood_id(oldFoodId+1);
		return dao.addFood(u);

	}
	
	public double getFoodPriceByFoodId(int food_id) throws Exception {
		return dao.getFoodPriceByFoodId(food_id);
	}
	public Menu getFoodByFoodId(int food_id) throws Exception {
		return dao.getFoodByFoodId(food_id);
	}
	public boolean deleteFoodByFoodId(int food_id) throws Exception {
		return dao.deleteFoodByFoodId(food_id);
	}


	public List<Menu> listAllFoods() throws Exception {
		return dao.listAllFoodsByFoodType(1);
	}
	
	public List<Menu> listAllDrinks() throws Exception {
		return dao.listAllFoodsByFoodType(2);
	}

	public int getFoodTotalNum() throws Exception {
		return dao.getFoodTotalNum();
	}

}
