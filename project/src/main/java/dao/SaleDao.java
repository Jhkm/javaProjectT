package dao;

import logic.Sale;

public interface SaleDao {

	Integer getMaxSaleId();

	void insert(Sale sale);

}
