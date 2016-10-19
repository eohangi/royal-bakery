package jsputil.cart;

import java.util.ArrayList;

public class GoodsDAO {
	
	public ArrayList<Goods> getGoodsList(){
		ArrayList<Goods> goodsList = new ArrayList<Goods>();
		goodsList.add(new Goods("A-100","컴퓨터",10000));
		goodsList.add(new Goods("B-200","세탁기",13000));
		goodsList.add(new Goods("C-300","보온기",21000));
		return goodsList;
	}
}
