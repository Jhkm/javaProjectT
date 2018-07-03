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

@Service
public class ShopServiceImpl implements ShopService{
	@Autowired
	private ItemDao itemDao;
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
	public List<Item> getItemList() {
		return itemDao.list();
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
	
	
}
