package logic;

import java.util.Date;

public class SaleItem {
	private Integer si_id;
	private Integer s_id;
	private Integer i_no;
	private Integer quantity;
	private Date updateTime;
	private Item item;
	public SaleItem() {}
	public SaleItem(Integer saleId, int saleItemId, ItemSet itemSet, Date currentTime) {
		this.s_id = saleId;
		this.si_id = saleItemId;
		this.item = itemSet.getItem();
		this.i_no = item.getI_no();
		this.updateTime = currentTime;
		this.quantity = itemSet.getQuantity();
	}
	public Integer getSi_id() {
		return si_id;
	}
	public void setSi_id(Integer si_id) {
		this.si_id = si_id;
	}
	public Integer getS_id() {
		return s_id;
	}
	public void setS_id(Integer s_id) {
		this.s_id = s_id;
	}
	public Integer getI_no() {
		return i_no;
	}
	public void setI_no(Integer i_no) {
		this.i_no = i_no;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	
}
