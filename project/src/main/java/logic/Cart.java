package logic;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import dao.ItemDao;

public class Cart {
	// itemList : 기존에 등록된 장바구니 상품
	private List<ItemSet> itemList = new ArrayList<ItemSet>();
	public List<ItemSet> getItemList() {
		return itemList;
	}
	public void create(List<Integer> nolist) {
		List<ItemSet> ilist = new ArrayList<ItemSet>();
		for(Integer no : nolist) {
			for(ItemSet is : itemList) {
				if(is.getItem().getI_no() == no) {
					ilist.add(is);
				}
			}
		}
		itemList = ilist;
	}
	//itemSet : 추가될 상품
	public void push(ItemSet itemSet) {
		for(ItemSet is : itemList) {
			if(is.getItem().getI_no() == itemSet.getItem().getI_no()) {
				is.setQuantity(is.getQuantity() + itemSet.getQuantity());
				return;
			}
		}
		itemList.add(itemSet);
	}
	public boolean isEmpty() {
		return itemList == null || itemList.size() == 0;
	}
	//현재 장바구니의 상품 가격의 총합을 리턴
	public int getTotalAmount() {
		int tot = 0;
		for(ItemSet i : itemList) {
			tot += i.getItem().getI_price() * i.getQuantity();
		}
//		tot=0;
//		Iterator<ItemSet> it = itemList.iterator();
//		while(it.hasNext()) {
//			ItemSet is = it.next();
//			tot += is.getItem().getPrice()*is.getQuantity();
//		}
		return tot;
	}
}
