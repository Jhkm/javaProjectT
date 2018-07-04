package logic;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.ItemDao;
import dao.SaleDao;
import dao.SaleItemDao;
import dao.UserDao;

@Service
public class ShopServiceImpl implements ShopService{
	@Autowired
	private ItemDao itemDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private SaleDao saleDao;
	@Autowired
	private SaleItemDao saleItemDao;
	@Override
	public void itemCreate(Item item, HttpServletRequest request) {
		if(item.getI_Img_File() != null && !item.getI_Img_File().isEmpty()) {
			uploadFileCreate(item.getI_Img_File(),request);//파일 생성
			item.setI_img(item.getI_Img_File().getOriginalFilename()); //파일의 이름 등록
		}
		itemDao.create(item);
	}
	private void uploadFileCreate(MultipartFile picture, HttpServletRequest request) {
		String uploadPath = request.getServletContext().getRealPath("/") + "/picture/";
		String orgFile = picture.getOriginalFilename();
		try {
			//new File(uploadPath + orgFile) : 파일 객체 설정
			picture.transferTo(new File(uploadPath + orgFile));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public List<Map<Integer, String>> gameType() {
		return itemDao.gameType();
	}
	@Override
	public List<Item> getItemList(HttpServletRequest request) {
		return itemDao.list(request);
	}
	@Override
	public Item detail(Integer no) {
		return itemDao.detail(no);
	}
	@Override
	public void update(Item item, HttpServletRequest request) {
		if(item.getI_Img_File() != null && !item.getI_Img_File().isEmpty()) {
			uploadFileCreate(item.getI_Img_File(),request);//파일 생성
			item.setI_img(item.getI_Img_File().getOriginalFilename()); //파일의 이름 등록
		}
		itemDao.update(item);
	}	
	@Override
	public void userCreate(User user) {
		userDao.insert(user);
	}
	@Override
	public User getUser(String id) {
		return userDao.select(id);
	}

	@Override
	public void addItemToCart(Integer no, Integer quantity, String id) {
		itemDao.addItemToCart(no,quantity, id);
	}
	@Override
	public Cart selectCart(String loginId) {
		
		return itemDao.selectCart(loginId);
	}
	@Override
	public void cartSubtraction(Integer i_no, String loginId) {
		itemDao.cartSubtraction(i_no,loginId);
	}
	@Override
	public void cartUpdate(Integer no, Integer quantity, String loginId) {
		itemDao.cartUpdate(no,quantity,loginId);
	}
	@Override
	public Sale checkEnd(User loginUser, Cart cart, HttpServletRequest request) {
		Sale sale = new Sale();
		sale.setS_id(saleDao.getMaxSaleId());
		sale.setUser(loginUser); //주문자
		sale.setS_updateTime(new Date());// 주문시간.
		if(request.getParameter("newAddress").equals("") || request.getParameter("newAddress") == null) {
			sale.setAddress(request.getParameter("oldAddress"));
		} else {
			sale.setAddress(request.getParameter("newAddress"));
		}
		List<ItemSet> itemList = cart.getItemList();
		for(int i=0;i<itemList.size();i++) {
			ItemSet itemSet =itemList.get(i);
			int saleItemId = i+1;
			SaleItem saleItem = new SaleItem(sale.getS_id(),saleItemId,itemSet,sale.getS_updateTime());
			sale.getSaleItemList().add(saleItem);
		}//db에 sale 테이블에 추가하기
		saleDao.insert(sale);
		List<SaleItem> saleItemList = sale.getSaleItemList();
		for(SaleItem saleItem : saleItemList) {
			saleItemDao.insert(saleItem); //주문상품 정보를 saleitem테이블에 저장.
		}
		
		return sale;
	}
	@Override
	public void clearCart() {
		itemDao.clearCart();
	}
	@Override
	public void updateUser(User user) {
		userDao.update(user);
	}
	@Override
	public void deleteUser(String id) {
		userDao.delete(id);
	}
	@Override
	public List<User> userList() {
		return userDao.list();
	}
	@Override
	public List<User> userList(String[] idchks) {
		return userDao.list(idchks);
	}
	
	
}
