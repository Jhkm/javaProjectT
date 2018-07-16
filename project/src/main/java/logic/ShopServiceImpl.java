package logic;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;

import com.sun.jimi.core.Jimi;
import com.sun.jimi.core.JimiException;
import com.sun.jimi.core.JimiUtils;

import dao.BoardDao;
import dao.ItemDao;
import dao.ReplyDao;
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
	BoardDao boardDao;
	@Autowired
	ReplyDao replyDao;
	@Autowired
	private SaleDao saleDao;
	
	@Override
	public int boardcount(String searchType, String searchContent, String category) {
		return boardDao.count(searchType, searchContent, category);
	}

	@Override
	public List<Board> boardList(String searchType, String searchContent, Integer pageNum, int limit, String category) {
		return boardDao.list(searchType, searchContent, pageNum, limit, category);
	}

	@Override
	public Board getBoard(Integer b_no) {
		return boardDao.getBoard(b_no);
	}

	@Override
	public void insert(Board board, HttpServletRequest request, HttpSession session) {
		if(board.getB_file() != null && !board.getB_file().isEmpty()) {
			uploadBoardFileCreate(board.getB_file(), request);
			board.setB_fileurl(board.getB_file().getOriginalFilename());
		}
		int b_no = boardDao.maxNum();
		board.setB_no(++b_no);
		board.setB_ref(b_no);
		board.setB_reflevel(0);
		board.setB_refstep(0);
		if(board.getB_category() == 0) {
			board.setB_category(Integer.parseInt(request.getParameter("b_category")));
		}
		if (!board.getB_date().equals("0")) {
			String[] date = board.getB_date().split(",");
			board.setB_date(date[0]+" "+date[1]+":00");
		} else {
			
			board.setB_date("null");
		}
		System.out.println("service" + board);
		if(board.getI_no() == 0) {
			board.setI_no(Integer.parseInt(request.getParameter("i_no")));
		}
		boardDao.insert(board);
	}
	private void uploadBoardFileCreate(MultipartFile file1, HttpServletRequest request) {
		String uploadPath = request.getServletContext().getRealPath("/") + "/file/";
		String orgFile = file1.getOriginalFilename();
		try {
			file1.transferTo(new File(uploadPath + orgFile));
		} catch (Exception e) {
			e.printStackTrace();
		}
	} 

	@Override
	public void updatereadcnt(Integer b_no) {
		boardDao.b_readcnt(b_no);
	}
	
	@Override
	public void boardReply(Board board,HttpServletRequest request, HttpSession session) {
		boardDao.refstepadd(board);
		int b_no = boardDao.maxNum();
		board.setB_no(++b_no);
		board.setB_reflevel(board.getB_reflevel()+1);
		board.setB_refstep(board.getB_refstep()+1);
		board.setM_id((String)session.getAttribute("loginUser"));
		board.setB_category(Integer.parseInt(request.getParameter("b_category")));
		boardDao.insert(board);
	}

	@Override
	public void boardUpdate(Board board, HttpServletRequest request) {
		if(board.getB_file() != null && !board.getB_file().isEmpty()) {
			uploadBoardFileCreate(board.getB_file(), request);
			board.setB_fileurl(board.getB_file().getOriginalFilename());
		}
		boardDao.update(board);
	}


	@Override
	public void boardDelete(int b_no) {
		boardDao.delete(b_no);
	}
	
	
	@Autowired
	private SaleItemDao saleItemDao;
	@Override
	public void itemCreate(Item item, HttpServletRequest request) {
		if(item.getI_Img_File() != null && !item.getI_Img_File().isEmpty()) {
			uploadFileCreate(item.getI_Img_File(),request);
			item.setI_img(item.getI_Img_File().getOriginalFilename()); 
			item.setI_img(item.getI_Img_File().getOriginalFilename());
		}
		createThumbnail(item.getI_img(),request);
		item.setI_img("thumb_"+item.getI_img());
		itemDao.create(item);
	}
	// 썸네일 만들기
	private void createThumbnail(String i_img,HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("/") +"/picture/";
		System.out.println(path);
		String orgFile = path + i_img;
		String thumbFile = path+"thumb_" + i_img;
		int thumbHeight = 400;
		int thumbWidth = 400;
		
		try {
			Image thumbnail = JimiUtils.getThumbnail(orgFile, thumbWidth, thumbHeight, Jimi.IN_MEMORY);
			Jimi.putImage(thumbnail, thumbFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void uploadFileCreate(MultipartFile picture, HttpServletRequest request) {
		String uploadPath = request.getServletContext().getRealPath("/") + "/picture/";
		String orgFile = picture.getOriginalFilename();
		try {
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
			uploadFileCreate(item.getI_Img_File(),request);
			item.setI_img(item.getI_Img_File().getOriginalFilename()); 
			item.setI_img(item.getI_Img_File().getOriginalFilename());
			createThumbnail(item.getI_img(),request);
			item.setI_img("thumb_"+item.getI_img());
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
	public void Reply(Reply reply, Board board, HttpServletRequest request, HttpSession session) {
		int r_no = replyDao.maxNum();
		board.setB_no(Integer.parseInt(request.getParameter("b_no")));
		reply.setR_no(++r_no);
		reply.setR_ref(r_no);
		reply.setR_reflevel(0);
		reply.setR_refstep(0);
		reply.setM_id((String)session.getAttribute("loginUser"));
		System.out.println(board.getM_id());
		replyDao.insert(reply);
	}

	@Override
	public Reply getReply(Integer r_no, HttpServletRequest request) {
		return replyDao.getReply(r_no);
	}
	@Override
	public Sale checkEnd(User loginUser, Cart cart, HttpServletRequest request) {
		Sale sale = new Sale();
		sale.setS_id(saleDao.getMaxSaleId());
		sale.setUser(loginUser); 
		sale.setUser(loginUser);
		sale.setS_updateTime(new Date());
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
		}
		saleDao.insert(sale);
		List<SaleItem> saleItemList = sale.getSaleItemList();
		for(SaleItem saleItem : saleItemList) {
			saleItemDao.insert(saleItem); 
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

	@Override
	public int deleteItem(int i_no) {
		return itemDao.delete(i_no);
	}
	
	@Override
	public List<logic.Reply> getBoardReply(Integer b_no) {
		return replyDao.getBoardReply(b_no);
	}

	@Override
	public void r_update(logic.Reply reply, Board board, HttpServletRequest request, HttpSession session) {
		replyDao.r_update(reply);
	}
//==========================================================================
	@Override
	public List<Sale> getSaleList(String loginId) {
		return saleDao.getSaleList(loginId);
	}

	@Override
	public List<SaleItem> getSaleItemList(Integer s_id) {
		return saleItemDao.getSaleItemList(s_id);
	}

	@Override

	public List<logic.Reply> replylist(Integer b_no) {
		 return replyDao.replyList(b_no);
	}

	@Override
	public void r_delte(logic.Reply reply, Board board, HttpServletRequest request, HttpSession session) {
		replyDao.r_delete(reply);
	}

	public List<Sale> getSaleList() {
		return saleDao.getSaleList();
	}

	@Override
	public void changeStep(String s_id, String s_step) {
		saleDao.changeStep(s_id,s_step);
	}
	//==========================================================================
	@Override
	public boolean duplicateIdCheck(String id) {
		boolean result = false;
		if (userDao.checkId(id) < 1) {
			result = true;
		}
		return result;
	}

	@Override
	public void mileageSave(Integer mileage,String loginId) {
		userDao.saveMileage(mileage,loginId);
	}

	@Override
	public void updateAmount(Integer i_no) {
		itemDao.updateAmount(i_no);
	}

	@Override
	public void buyOneItem(HttpServletRequest request, String loginId) {
		int s_num = saleDao.getMaxSaleId();
		int i_num = Integer.parseInt(request.getParameter("i_no"));
		Sale sale = new Sale();
		if(request.getParameter("newAddress").equals("") || request.getParameter("newAddress") == null) {
			sale.setAddress(request.getParameter("oldAddress"));
		} else {
			sale.setAddress(request.getParameter("newAddress"));
		}
		sale.setS_id(s_num);
		sale.setS_updateTime(new Date());
		sale.setUser(userDao.select(loginId));
		saleDao.insert(sale);
		SaleItem saleItem = new SaleItem(s_num, 1, new ItemSet(itemDao.detail(i_num),Integer.parseInt(request.getParameter("quantity"))), sale.getS_updateTime());
		saleItemDao.insert(saleItem);
	}

	@Override
	public String favoritItem(String i_no, String loginId, int i) {
		String result = "";
		try {
			int checkRe = itemDao.checkFavorit(i_no,loginId,i);
			if(checkRe == 0) {
				itemDao.insertFavorit(i_no,loginId,i);
				result = "success";
			} else if(checkRe == 1) {
				itemDao.removeFavorit(i_no,loginId,i);
				result = "clear";
			}
		} catch(Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return result;
	}

	@Override
	public int checkFavorit(Integer no, String attribute, int i) {
		return itemDao.checkFavorit(no+"",attribute,i);
	}

	@Override
	public String getSaleUserId(String s_id) {
		return saleDao.getUserId(s_id);
	}

	@Override
	public void mileageSubtract(Integer mileage, String saleUserId) {
		userDao.subtractMileage(mileage,saleUserId);
	}
	
	@Override
	public int replyMaxNum() {
		return replyDao.maxNum();

	}
	/*
	@Override
	public void replyCreate(logic.Reply reply) {
		 replyDao.replyCreate(reply);

		
	}

	@Override
	public void insertReReply(logic.Reply reply) {
		  replyDao.insertReReply(reply);

		
	}

	@Override
	public logic.Reply setlectReply(Integer r_no) {
		   return replyDao.selectReply(r_no);
	}

	@Override
	public void replyDelete(Integer r_no) {
	    replyDao.replyDelete(r_no);
	}*/

	@Override
	public void replyRe(Board board, HttpServletRequest request, HttpSession session,Reply reply) {
		replyDao.replyrefstepadd(reply);
		int b_no = replyDao.maxNum();
		reply.setR_ref(reply.getR_no());
		reply.setR_no(++b_no);
		reply.setR_reflevel(reply.getR_reflevel()+1);
		reply.setR_refstep(reply.getR_refstep()+1);
		reply.setM_id((String)session.getAttribute("loginUser"));
		replyDao.insert(reply);
	}

	@Override
	public void replyDelete(Integer r_no) {
		replyDao.replyDelete(r_no);
		
	}

	@Override
	public List<Board> getItemCommentList(Integer no, int i) {
		return boardDao.getItemCommentList(no,i);
	}

	@Override
	public double avgGrade(Integer no, int i) {
		return boardDao.avgGrade(no,i);
	}
	
	@Override
	public List<Item> getBestItemList() {
		return itemDao.bestItemList();
		}

	@Override
	public List<Board> getReview() {
		return boardDao.review();
	}
}
