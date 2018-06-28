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

@Controller //@Component�� ���� ��ü. @Component + Controller ��� �ο�
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
		item.setI_people(item.getI_people()+"~"+request.getParameter("i_people2"));
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
		System.out.println(no);
		ModelAndView mav = new ModelAndView();
		Item item = service.detail(no);
		System.out.println(item);
		mav.addObject("item",item);
		mav.addObject(new Item());
		return mav;
	}
//	@RequestMapping("item/list") //��û������ ���� ȣ��Ǵ� �޼��� ����.
//	public ModelAndView list() {
//		//itemList : item ���̺��� ��� ������ Item ��ü�� List�� ����.
//		List<Item> itemList = service.getItemList();
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("itemList",itemList);
//		return mav;
//	}
//	@RequestMapping("item/create")
//	public ModelAndView create() {
//		ModelAndView mav = new ModelAndView("item/add");
//		mav.addObject(new Item());
//		return mav;
//	}
//	@RequestMapping("item/register")
//	public ModelAndView register(@Valid Item item, BindingResult bindingResult, HttpServletRequest request) {
//		ModelAndView mav = new ModelAndView("item/add");
//		if(bindingResult.hasErrors()) {
//			mav.getModel().putAll(bindingResult.getModel());
//			return mav;
//		}
//		service.itemCreate(item, request);
//		mav.setViewName("redirect:/item/list.shop");
//		return mav;
//	}
//	/*
//	 * ��ǰ�󼼺��� : id�Ķ���Ͱ� ���۵�.
//	 *      1. id �Ķ���͸� �̿��Ͽ� db ��ȸ�ϱ�
//	 *      2. ��ȸ�� db ������ view�� �����ϱ�
//	 */
//	@RequestMapping("item/update")
//	public ModelAndView update(@Valid Item item, BindingResult bindingResult, HttpServletRequest request) {
//		ModelAndView mav = new ModelAndView("item/edit");
//		if(bindingResult.hasErrors()) {
//			mav.getModel().putAll(bindingResult.getModel());
//			return mav;
//		}
//		service.itemUdate(item, request);
//		mav.setViewName("redirect:/item/detail.shop?id="+item.getId());
//		return mav;
//	}
//	/*
//	 * �����ϱ�
//	 * id�� �ش��ϴ� ��ǰ������ �����ϱ� ���ż����� list.shop���� �̵�, ���� ���н� confirm.shop���� �̵�.
//	 */
//	@RequestMapping("item/delete")
//	public String delete(String id) {
//		int result = service.itemDelete(id);
//		if(result > 0) {
//			return "redirect:list.shop";
//		} else {
//			return "redirect:confirm.shop?id=" + id;
//		}
//	}
//	@RequestMapping("item/*")
//	public ModelAndView detail(String id) {
//		ModelAndView mav = new ModelAndView();
//		Item item = service.itemDetail(id);
//		mav.addObject("item",item);
//		return mav;
//	}
//	@RequestMapping("item/edit")
//	public ModelAndView edit(String id) {
//		return detail(id);
//	}
}
