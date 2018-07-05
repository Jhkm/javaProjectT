package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.SaleItem;

public interface SaleItemMapper {

	@Insert("insert into saleitem (si_id, s_id, i_no, quantity, updatetime) values (#{si_id},#{s_id},#{i_no},#{quantity},#{updateTime})")
	void insert(SaleItem saleItem);

	@Select("select * from SaleItem where s_id = #{value}")
	List<SaleItem> selectList(Integer s_id);
}
