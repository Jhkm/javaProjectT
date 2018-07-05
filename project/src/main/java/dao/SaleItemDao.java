package dao;

import java.util.List;

import logic.SaleItem;

public interface SaleItemDao {

	void insert(SaleItem saleItem);

	List<SaleItem> getSaleItemList(Integer s_id);
	
}
