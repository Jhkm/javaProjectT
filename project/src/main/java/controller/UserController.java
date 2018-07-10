package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import exception.LoginException;
import exception.ShopException;
import logic.Item;
import logic.Sale;
import logic.SaleItem;
import logic.ShopService;
import logic.User;

@Controller //@Component�� ���� ��ü. @Component + Controller ��� �ο�
public class UserController {
	@Autowired
	private ShopService service;

	@RequestMapping("user/userForm")
	public ModelAndView userForm() {
		ModelAndView mav = new ModelAndView();
		List<Map<Integer, String>> maplist = service.gameType();
		mav.addObject("gametype", maplist);
		mav.addObject(new User());
		return mav;
	}
	
	@RequestMapping("user/userEntry")
	public ModelAndView userEntry(@Valid User user, BindingResult bindingResult) {
		ModelAndView mav = new ModelAndView("user/userForm");
		mav.addObject(new User());
		if (bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		try {
			// user : ȭ�鿡�� �Էµ� ���� �����ϰ� �ִ� ��ü , userCreate �� db�� ����
			service.userCreate(user);
			mav.setViewName("user/login");
			mav.addObject("user", user);
			// DataIntegrityViolationException : primary(�⺻Ű) Ű�� �ߺ��� ��� �߻��Ǵ� ����
		} catch (DataIntegrityViolationException e) {
			bindingResult.reject("error.duplicate.user");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@ModelAttribute
	public User getUser() {
		return new User();
	}
	@RequestMapping(value = "user/login", method = RequestMethod.GET)
	public String loginFrom() {
		return "user/login";
	}

	@RequestMapping(value = "user/login", method = RequestMethod.POST)
	public ModelAndView login(@Valid User user, BindingResult bindingResult, HttpSession session) {
		ModelAndView mav = new ModelAndView("user/login");
		if (bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		User dbUser = service.getUser(user.getM_id());
		if (dbUser == null) {
			bindingResult.reject("error.login.m_id");
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		if (dbUser.getM_passwd().equals(user.getM_passwd())) {
			mav.addObject("dbUser", dbUser);
			mav.setViewName("user/loginSuccess");
			session.setAttribute("loginUser", dbUser.getM_id());
		} else {
			bindingResult.reject("error.login.m_passwd");
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		return mav;
	}
	
	@RequestMapping("user/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView("user/login");
		session.invalidate();
		return mav;
	}
	
	@RequestMapping("user/mypage")
	public ModelAndView mypage(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String loginUserId = (String)session.getAttribute("loginUser");
		User user = service.getUser(id);
/*		List<Sale> salelist = service.saleList(id);
		for(Sale sale : salelist) {
			List<SaleItem> saleItemList = service.saleitemList(sale.getS_id());
			int amount = 0;
			for(SaleItem sitem : saleItemList) {
				Item item = service.ItemDetail(sitem.getSi_id()+"");
				sitem.setItem(item);
				amount += sitem.getQuantity() * item.getI_price();
			}
			sale.setSaleItemList(saleItemList);
			sale.setAmount(amount);
		}
		mav.addObject("salelist", salelist);*/
		List<Map<Integer, String>> maplist = service.gameType();
		String likegame = "";
		for (Map m : maplist) {
			if (m.get("tp_no") == user.getM_game()) {
				likegame += m.get("tp_name");
			}
		}
		mav.addObject("likegame",likegame);
		mav.addObject("gametype", maplist);
		mav.addObject("user", user);
		return mav;
	}
	
	@RequestMapping(value = "user/update", method = RequestMethod.POST)
	public ModelAndView update(@Valid User user, BindingResult bindingResult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
/*		if (bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}*/
		User loginUser = service.getUser((String) session.getAttribute("loginUser"));
		User dbUser = service.getUser(user.getM_id());
		if (loginUser.getM_id().equals("admin")) {
			if (!user.getM_passwd().equals(loginUser.getM_passwd())) {
				throw new ShopException("��й�ȣ�� Ʋ���ϴ�.", "update.shop?id=" + user.getM_id());
			}
		} else {
			if (!user.getM_passwd().equals(dbUser.getM_passwd())) {
				throw new ShopException("��й�ȣ�� Ʋ���ϴ�.", "update.shop?id=" + user.getM_id());
			}
		}
		try {
			// uesr : ȭ�鿡�� �Էµ� ���� �����ϰ� �ִ� ��ü
			service.updateUser(user);
			if (loginUser.getM_id().equals("admin")) {
				mav.setViewName("redirect:../admin/admin.sdj");
			}else {
				mav.setViewName("redirect:mypage.sdj?id=" + user.getM_id());
			}
		} catch (DataIntegrityViolationException e) { // DataIntegrityViolationException : �⺻Ű�� �ߺ��� ��� �߻��Ǵ� ����
			bindingResult.reject("error.duplicate.user");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping(value = "user/update", method = RequestMethod.GET)
	public ModelAndView myupdateForm(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = service.getUser(id);
		List<Map<Integer, String>> maplist = service.gameType();
		String likegame = "";
		for (Map m : maplist) {
			if (m.get("tp_no") == user.getM_game()) {
				likegame += m.get("tp_name");
			}
		}
		String[] fulladdress = user.getM_address().split(",");
		String maddress = "";
		for (int i =0; i<fulladdress.length-1; i++) {
			maddress += fulladdress[i];
			if (i<fulladdress.length-2) {
				maddress +=",";
			}
		}
		user.setM_address(maddress);
		String address = fulladdress[fulladdress.length-1];
		mav.addObject("address", address);
		mav.addObject("likegame",likegame);
		mav.addObject("gametype", maplist);
		mav.addObject("user", user);
		return mav;
	}

	
	@RequestMapping(value="user/delete", method=RequestMethod.POST)
	public String delete(@Valid User user, HttpSession session, String x) {
		
		//�������κ��� �α������� ��ü�� �޾ƿ�. 
		User loginUser = service.getUser((String)session.getAttribute("loginUser"));
		//�Էµ� id�� db ȸ�������� �����ϰ� �ִ� user ��ü
		if(user == null) {
			throw new ShopException("���� ��� ����ڰ� �������� �ʽ��ϴ�.", "mypage.sdj?id="+user.getM_id());
		}
		if(loginUser.getM_id().equals("admin")) { //�������� ���
			if(!loginUser.getM_passwd().equals(user.getM_passwd())) { //��й�ȣ�Է��� ������ ��й�ȣ�� �����
				throw new LoginException("������ ��й�ȣ�� Ʋ���ϴ�.", "delete.sdj?id="+user.getM_id());
			}
		} else { //�Ϲݻ������ ���
			if(!user.getM_passwd().equals(user.getM_passwd())) {
				throw new LoginException("��й�ȣ�� Ʋ���ϴ�.", "delete.sdj?id="+user.getM_id());
			}
		}
		try {
			System.out.println(x);
			
			service.deleteUser(user.getM_id());
			if(loginUser.getM_id().equals("admin")) { //�����ڷα���.
				return "redirect:../admin/admin.sdj";
			} else { //�Ϲݻ���ڷ� �α��ν� ���� ����
				session.invalidate(); //�α׾ƿ�
				return "redirect:login.sdj";
			}
		} catch(Exception e) {
			e.printStackTrace();
			throw new ShopException("������ ���� �߻�", "../user/mypage.shop?id="+user.getM_id());
		}
		
	}
	@RequestMapping(value = "user/delete", method = RequestMethod.GET)
	public ModelAndView deleteForm(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = service.getUser(id);
		mav.addObject("user", user);
		return mav;
	}
//	====================================================================================
	@RequestMapping(value="user/shoping", method = RequestMethod.GET)
	public ModelAndView shoping(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String loginId = request.getParameter("id");
		System.out.println(loginId);
		List<Sale> saleList = service.getSaleList(loginId);
		System.out.println(saleList);
		for(Sale s : saleList) {
			List<SaleItem> saleItemList = service.getSaleItemList(s.getS_id());
			int amount =0;
			for(SaleItem sitem : saleItemList) {
				Item item = service.detail(sitem.getI_no());
				sitem.setItem(item);
				amount += sitem.getQuantity() * item.getI_price();
			}
			s.setSaleItemList(saleItemList);
			s.setAmount(amount);
		}
		mav.addObject("salelist",saleList);
		return mav;
	}
}
