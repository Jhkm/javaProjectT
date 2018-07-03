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
		System.out.println("test1");
		try {
			// user : 화면에서 입력된 정보 저장하고 있는 객체 , userCreate 로 db에 전달
			service.userCreate(user);
			mav.setViewName("user/login");
			mav.addObject("user", user);
			// DataIntegrityViolationException : primary(기본키) 키가 중복된 경우 발생되는 예외
		} catch (DataIntegrityViolationException e) {
			bindingResult.reject("error.duplicate.user");
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
			bindingResult.reject("error.login.id");
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		if (dbUser.getM_passwd().equals(user.getM_passwd())) {
			mav.addObject("dbUser", dbUser);
			mav.setViewName("user/loginSuccess");
			session.setAttribute("loginUser", dbUser.getM_id());
		} else {
			bindingResult.reject("error.login.password");
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
}
