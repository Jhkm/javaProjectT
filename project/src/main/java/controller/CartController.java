package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import exception.CartEmptyException;
import logic.Cart;
import logic.Item;
import logic.ItemSet;
import logic.Sale;
import logic.ShopService;
import logic.User;
@Controller
public class CartController {
	@Autowired
	private ShopService service;
	
	@RequestMapping("cart/cartAdd")
	public ModelAndView add(Integer no, Integer quantity,Boolean checkAS, HttpSession session) {
		//selectedItem : id에 해당하는 상품정보를 db에서 읽어서 저장.
		String loginId = (String)session.getAttribute("loginUser");
		service.addItemToCart(no,quantity,loginId);
		Cart cart = service.selectCart(loginId);
		ModelAndView mav = null;
		if(checkAS) {
			mav = new ModelAndView("cart/cart");
			mav.addObject("message",service.detail(no).getI_name()+"을/를" + quantity + "개 카트에 추가");
			mav.addObject("cart",cart);
		} else {
			mav = new ModelAndView("redirect:../item/list.sdj");
		}
		return mav;
	}
	@RequestMapping("cart/cartDelete")
	public ModelAndView delete(Integer index, HttpSession session) {
		//index : 상품목록 순서정보
		String loginId = (String)session.getAttribute("loginUser");
		Cart cart = service.selectCart(loginId);
		ModelAndView mav = new ModelAndView("cart/cart");
		ItemSet delete = null;
		try {
			delete = cart.getItemList().get(index);
			service.cartSubtraction(delete.getItem().getI_no(),loginId);
			cart.getItemList().remove(delete);
			mav.addObject("message",delete.getItem().getI_name() + "을(를) 카트에서 제거 함");
		} catch (Exception e) {
			mav.addObject("message","상품을 카트에서 제거 실패함");
		}
		mav.addObject("cart",cart);
		return mav;
	}
	@RequestMapping("cart/cartView")
	public ModelAndView view(HttpSession session) {
		String loginId = (String)session.getAttribute("loginUser");
		Cart cart = service.selectCart(loginId);
		ModelAndView mav = new ModelAndView("cart/cart");
		if(cart == null || cart.isEmpty()) {
			throw new CartEmptyException("카트에 상품이 없습니다. 상품 목록으로 갑니다.","../item/list.sdj");
		}
		mav.addObject("message","카트 상품 조회 입니다.");
		mav.addObject("cart",cart);
		return mav;
	}
	@RequestMapping(value="cart/countUpdate",method = RequestMethod.GET)
	public ModelAndView countUpdate1(Integer no) {
		ModelAndView mav = new ModelAndView();
		Item item = service.detail(no);
		mav.addObject("item",item);
		return mav;
	}
	// 20180702 끝 내일 여기부터
	@RequestMapping(value="cart/countUpdate",method = RequestMethod.POST)
	public void countUpdate2(HttpServletRequest request, HttpSession session) {
		Integer no = Integer.parseInt(request.getParameter("itemNo"));
		Integer quantity = Integer.parseInt(request.getParameter("quantity"));
		String loginId = (String)session.getAttribute("loginUser");
		service.cartUpdate(no,quantity,loginId);
	}
	//AOP 추가하기
	//1. 로그인이 안된경우 : 로그인이 필요합니다. login.shop으로 /user/login.shop
	//2. 카트가 비어 있는 경우 : 장바구니가 비었습니다. /item/list.shop
	@RequestMapping("cart/checkout")
	public ModelAndView checkout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String loginId = (String)session.getAttribute("loginUser");
		Cart cart = service.selectCart(loginId);
		mav.addObject("cart",cart);
		mav.addObject("loginUser1",(User)service.getUser(loginId));
		return mav; // view 이름
	}
	
	@RequestMapping("cart/end")
	public ModelAndView checkend(HttpSession session, HttpServletRequest request) {
		Cart cart = service.selectCart((String)session.getAttribute("loginUser"));
		String loginId = (String)session.getAttribute("loginUser");
		User loginUser = service.getUser(loginId);
		
		if(cart == null || cart.isEmpty()) {
			throw new CartEmptyException("장바구니에 계산할 상품이 없습니다.","../item/list.sdj");
		}
		/*
		 * 주문 정보 생성
		 *  sale 객체에 정보를 저장하여 리턴
		 *  db에 주문정보와 주문 상품 정보 저장.
		 */
		Sale sale = service.checkEnd(loginUser,cart,request);
		List<ItemSet> itemList = cart.getItemList();
		int tot = cart.getTotalAmount(); //총 금액 산출
		service.clearCart();// 장바구니 비우기
		ModelAndView mav = new ModelAndView();
		mav.addObject("loginUser1",(User)service.getUser(loginId));
		mav.addObject("sale",sale);
		mav.addObject("totalAmount",tot);
		return mav;
	}
}
