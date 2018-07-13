package dao;

import java.util.List;

import logic.Sale;

public interface SaleDao {

	Integer getMaxSaleId();

	void insert(Sale sale);

	List<Sale> getSaleList(String loginId);

	List<Sale> getSaleList();

	void changeStep(String s_id, String s_step);

	String getUserId(String s_id);

}
