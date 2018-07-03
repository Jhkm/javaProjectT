package logic;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Sale implements Serializable{
	private Integer s_id;
	private Date s_updateTime;
	//진행상황
	private Integer s_step;
	private String address;
	private User user;
	private Integer amount;
	private List<SaleItem> saleItemList = new ArrayList<SaleItem>();
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getS_id() {
		return s_id;
	}
	public void setS_id(Integer s_id) {
		this.s_id = s_id;
	}
	public Date getS_updateTime() {
		return s_updateTime;
	}
	public void setS_updateTime(Date s_updateTime) {
		this.s_updateTime = s_updateTime;
	}
	public Integer getS_step() {
		return s_step;
	}
	public void setS_step(Integer s_step) {
		this.s_step = s_step;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public List<SaleItem> getSaleItemList() {
		return saleItemList;
	}
	public void setSaleItemList(List<SaleItem> saleItemList) {
		this.saleItemList = saleItemList;
	}
	
}
