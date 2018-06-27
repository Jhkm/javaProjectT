package controller;

import java.util.List;

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
	
//	@RequestMapping("item/list") //요청벙보에 따라 호출되는 메서드 설정.
//	public ModelAndView list() {
//		//itemList : item 테이블의 모든 정보를 Item 객체의 List로 저장.
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
//	 * 상품상세보기 : id파라미터가 전송됨.
//	 *      1. id 파라미터를 이용하여 db 조회하기
//	 *      2. 조회된 db 내용을 view로 전송하기
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
//	 * 삭제하기
//	 * id에 해당하는 상품정보를 제거하기 제거성공시 list.shop으로 이동, 제거 실패시 confirm.shop으로 이동.
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
