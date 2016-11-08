package project.jsp.bakery.service;

import java.util.List;

import project.jsp.bakery.model.Custom;
import project.jsp.bakery.model.Document;
import project.jsp.bakery.model.Orders;

public interface OrderService {

	
	public void insertOrder(Orders orders) throws Exception;
	
	public List<Orders> selectOrderList(Orders orders) throws Exception;
	
	public Orders selectOrder(Orders orders) throws Exception;
	
	public void updateOrder(Orders orders) throws Exception;
	
	public int selectOrderCount(Orders orders) throws Exception;
	
	public void updateOrderMemberOut(Orders orders) throws Exception;
	

}
