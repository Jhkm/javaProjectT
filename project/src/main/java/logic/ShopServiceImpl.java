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

import dao.BoardDao;
import dao.ItemDao;
import dao.UserDao;

@Service
public class ShopServiceImpl implements ShopService{
	@Autowired
	private ItemDao itemDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	BoardDao boardDao;
	
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
	public void insert(Board board, HttpServletRequest request) {
		if(board.getB_file() != null && !board.getB_file().isEmpty()) {
			uploadBoardFileCreate(board.getB_file(), request);
			board.setB_fileurl(board.getB_file().getOriginalFilename());
		}
		int b_no = boardDao.maxNum();
		board.setB_no(++b_no);
		board.setB_ref(b_no);
		board.setB_reflevel(0);
		board.setB_refstep(0);
		board.setB_people(0);
		board.setB_category(Integer.parseInt(request.getParameter("b_category")));
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
	public void boardReply(Board board) {
		boardDao.refstepadd(board);
		int b_no = boardDao.maxNum(); //
		board.setB_no(++b_no); //
//		board.getRef :
//		board.setReflevel() : 
//		board.setRefstep() : 
		board.setB_reflevel(board.getB_reflevel()+1);
		board.setB_refstep(board.getB_refstep()+1);
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
	public void Reply(Reply reply, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Reply getReply(Integer r_no, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
