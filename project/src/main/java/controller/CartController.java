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
		//selectedItem : id�� �ش��ϴ� ��ǰ������ db���� �о ����.
		String loginId = (String)session.getAttribute("loginUser");
		service.addItemToCart(no,quantity,loginId);
		Cart cart = service.selectCart(loginId);
		ModelAndView mav = null;
		if(checkAS) {
			mav = new ModelAndView("cart/cart");
			mav.addObject("message",service.detail(no).getI_name()+"��/��" + quantity + "�� īƮ�� �߰�");
			mav.addObject("cart",cart);
		} else {
			mav = new ModelAndView("redirect:../item/list.sdj");
		}
		return mav;
	}
	@RequestMapping("cart/cartDelete")
	public ModelAndView delete(Integer index, HttpSession session) {
		//index : ��ǰ��� ��������
		String loginId = (String)session.getAttribute("loginUser");
		Cart cart = service.selectCart(loginId);
		ModelAndView mav = new ModelAndView("cart/cart");
		ItemSet delete = null;
		try {
			delete = cart.getItemList().get(index);
			service.cartSubtraction(delete.getItem().getI_no(),loginId);
			cart.getItemList().remove(delete);
			mav.addObject("message",delete.getItem().getI_name() + "��(��) īƮ���� ���� ��");
		} catch (Exception e) {
			mav.addObject("message","��ǰ�� īƮ���� ���� ������");
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
			throw new CartEmptyException("īƮ�� ��ǰ�� �����ϴ�. ��ǰ ������� ���ϴ�.","../item/list.sdj");
		}
		mav.addObject("message","īƮ ��ǰ ��ȸ �Դϴ�.");
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
	// 20180702 �� ���� �������
	@RequestMapping(value="cart/countUpdate",method = RequestMethod.POST)
	public void countUpdate2(HttpServletRequest request, HttpSession session) {
		Integer no = Integer.parseInt(request.getParameter("itemNo"));
		Integer quantity = Integer.parseInt(request.getParameter("quantity"));
		String loginId = (String)session.getAttribute("loginUser");
		service.cartUpdate(no,quantity,loginId);
	}
	//AOP �߰��ϱ�
	//1. �α����� �ȵȰ�� : �α����� �ʿ��մϴ�. login.shop���� /user/login.shop
	//2. īƮ�� ��� �ִ� ��� : ��ٱ��ϰ� ������ϴ�. /item/list.shop
	@RequestMapping("cart/checkout")
	public ModelAndView checkout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String loginId = (String)session.getAttribute("loginUser");
		Cart cart = service.selectCart(loginId);
		mav.addObject("cart",cart);
		mav.addObject("loginUser1",(User)service.getUser(loginId));
		return mav; // view �̸�
	}
	
	@RequestMapping("cart/end")
	public ModelAndView checkend(HttpSession session, HttpServletRequest request) {
		Cart cart = service.selectCart((String)session.getAttribute("loginUser"));
		String loginId = (String)session.getAttribute("loginUser");
		User loginUser = service.getUser(loginId);
		
		if(cart == null || cart.isEmpty()) {
			throw new CartEmptyException("��ٱ��Ͽ� ����� ��ǰ�� �����ϴ�.","../item/list.sdj");
		}
		/*
		 * �ֹ� ���� ����
		 *  sale ��ü�� ������ �����Ͽ� ����
		 *  db�� �ֹ������� �ֹ� ��ǰ ���� ����.
		 */
		Sale sale = service.checkEnd(loginUser,cart,request);
		List<ItemSet> itemList = cart.getItemList();
		int tot = cart.getTotalAmount(); //�� �ݾ� ����
		service.clearCart();// ��ٱ��� ����
		ModelAndView mav = new ModelAndView();
		mav.addObject("loginUser1",(User)service.getUser(loginId));
		mav.addObject("sale",sale);
		mav.addObject("totalAmount",tot);
		return mav;
	}
}
