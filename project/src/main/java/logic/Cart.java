package logic;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

public class Cart {
	// itemList : ������ ��ϵ� ��ٱ��� ��ǰ
	private List<ItemSet> itemList = new ArrayList<ItemSet>();
	public List<ItemSet> getItemList() {
		return itemList;
	}
	//itemSet : �߰��� ��ǰ
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
	//���� ��ٱ����� ��ǰ ������ ������ ����
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
	public void clearAll(HttpSession session) {
		itemList = new ArrayList<ItemSet>();
		session.setAttribute("CART", this);
	}
}
