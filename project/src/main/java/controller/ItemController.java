package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Item;
import logic.ShopService;

@Controller //@Component의 하위 객체. @Component + Controller 기능 부여
public class ItemController {
	@Autowired
	private ShopService service;
	
	@RequestMapping("item/create")
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView("item/itemadd");
		List<Map<Integer, String>> maplist = service.gameType();
		mav.addObject(new Item());
		mav.addObject("gametype", maplist);
		return mav;
	}
	@RequestMapping("item/register")
	public ModelAndView register(@Valid Item item, BindingResult bindingResult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("item/itemadd");
		System.out.println(item);
		item.setI_people(item.getI_people()+"~"+item.getI_people2());
		if(bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		service.itemCreate(item, request);
		mav.setViewName("redirect:/item/list.sdj");
		return mav;
	}
	@RequestMapping("item/list")
	public ModelAndView list() {
		List<Item> itemList = service.getItemList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("itemList",itemList);
		return mav;
	}
	@RequestMapping("item/detail")
	public ModelAndView detail(Integer no) {
		ModelAndView mav = new ModelAndView();
		Item item = service.detail(no);
		String[] people = item.getI_people().split("~");
		item.setI_people(people[0]);
		item.setI_people2(people[1]);
		List<Map<Integer, String>> maplist = service.gameType();
		mav.addObject("gametype", maplist);
		mav.addObject("item",item);
		return mav;
	}
	@RequestMapping("item/edit")
	public ModelAndView edit(Integer no) {
		return detail(no);
	}
	@RequestMapping("item/update")
	public ModelAndView update(Item item, BindingResult bindingResult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("item/edit");
		System.out.println(item);
		item.setI_people(item.getI_people()+"~"+item.getI_people2());
		if(bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		service.update(item,request);
		mav.setViewName("redirect:/item/list.sdj");
		return mav;
	}
}
