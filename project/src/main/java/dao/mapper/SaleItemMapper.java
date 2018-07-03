package dao.mapper;

import org.apache.ibatis.annotations.Insert;

import logic.SaleItem;

public interface SaleItemMapper {

	@Insert("insert into saleitem (si_id, s_id, i_no, quantity, updatetime) values (#{si_id},#{s_id},#{i_no},#{quantity},#{updateTime})")
	void insert(SaleItem saleItem);
}
