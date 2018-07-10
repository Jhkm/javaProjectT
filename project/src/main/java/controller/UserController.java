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

@Controller //@Component의 하위 객체. @Component + Controller 기능 부여
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
			// user : 화면에서 입력된 정보 저장하고 있는 객체 , userCreate 로 db에 전달
			service.userCreate(user);
			mav.setViewName("user/login");
			mav.addObject("user", user);
			// DataIntegrityViolationException : primary(기본키) 키가 중복된 경우 발생되는 예외
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
				throw new ShopException("비밀번호가 틀립니다.", "update.shop?id=" + user.getM_id());
			}
		} else {
			if (!user.getM_passwd().equals(dbUser.getM_passwd())) {
				throw new ShopException("비밀번호가 틀립니다.", "update.shop?id=" + user.getM_id());
			}
		}
		try {
			// uesr : 화면에서 입력된 정보 저장하고 있는 객체
			service.updateUser(user);
			if (loginUser.getM_id().equals("admin")) {
				mav.setViewName("redirect:../admin/admin.sdj");
			}else {
				mav.setViewName("redirect:mypage.sdj?id=" + user.getM_id());
			}
		} catch (DataIntegrityViolationException e) { // DataIntegrityViolationException : 기본키가 중복된 경우 발생되는 예외
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
		
		//세션으로부터 로그인유저 객체를 받아옴. 
		User loginUser = service.getUser((String)session.getAttribute("loginUser"));
		//입력된 id의 db 회원정보를 저장하고 있는 user 객체
		if(user == null) {
			throw new ShopException("삭제 대상 사용자가 존재하지 않습니다.", "mypage.sdj?id="+user.getM_id());
		}
		if(loginUser.getM_id().equals("admin")) { //관리자인 경우
			if(!loginUser.getM_passwd().equals(user.getM_passwd())) { //비밀번호입력을 관리자 비밀번호로 등록함
				throw new LoginException("관리자 비밀번호가 틀립니다.", "delete.sdj?id="+user.getM_id());
			}
		} else { //일반사용자의 경우
			if(!user.getM_passwd().equals(user.getM_passwd())) {
				throw new LoginException("비밀번호가 틀립니다.", "delete.sdj?id="+user.getM_id());
			}
		}
		try {
			System.out.println(x);
			
			service.deleteUser(user.getM_id());
			if(loginUser.getM_id().equals("admin")) { //관리자로그인.
				return "redirect:../admin/admin.sdj";
			} else { //일반사용자로 로그인시 삭제 성공
				session.invalidate(); //로그아웃
				return "redirect:login.sdj";
			}
		} catch(Exception e) {
			e.printStackTrace();
			throw new ShopException("삭제시 오류 발생", "../user/mypage.shop?id="+user.getM_id());
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
