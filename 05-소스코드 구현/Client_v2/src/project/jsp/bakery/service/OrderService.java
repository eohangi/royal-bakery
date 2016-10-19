package project.jsp.bakery.service;

import java.util.List;

import project.jsp.bakery.model.Custom;
import project.jsp.bakery.model.Document;
import project.jsp.bakery.model.order;

public interface OrderService {

	
	public void insertOrder(order order) throws Exception;
	
	public List<Document> selectOrder(order order) throws Exception;
	

}
