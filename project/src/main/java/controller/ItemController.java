package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.ShopException;
import logic.Item;
import logic.ItemSet;
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
		item.setI_people(item.getI_people()+"~"+item.getI_people2());
		if(bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		int pageNum = 1;
		if(request.getParameter("pageNum") == null || request.getParameter("pageNum").equals("")) {
			pageNum = 1;
		} else {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		service.itemCreate(item, request);
		mav.setViewName("redirect:/item/list.sdj?pageNum=" + pageNum);
		return mav;
	}
	@RequestMapping("item/list")
	public ModelAndView list(HttpServletRequest request) {
		List<Item> itemList = service.getItemList(request);
		String kind = request.getParameter("kind");
		String find = request.getParameter("find");
		ModelAndView mav = new ModelAndView();
		mav.addObject("itemList",itemList);
		int pageNum = 1;
		if(request.getParameter("pageNum") == null || request.getParameter("pageNum").equals("")) {
			pageNum = 1;
		} else {
			System.out.println(request.getParameter("pageNum"));
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		int count = itemList.size();
		int startPage = (pageNum/10)*10 +1;
		int endPage = startPage+9;
		if(endPage >= count/25+1) {
			endPage = count/25 + 1;
		}
		// 시작 페이지 마지막 페이지 현재페이지
		if(request.getParameter("gametype") != null && !request.getParameter("gametype").equals("")) {
			mav.addObject("gametype", request.getParameter("gametype"));
		}
		String sort = request.getParameter("sort");
		mav.addObject("kind",kind);
		mav.addObject("find", find);
		mav.addObject("sort", sort);
		mav.addObject("startPage",startPage);
		mav.addObject("endPage",endPage);
		mav.addObject("pageNum",pageNum);
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
		item.setI_people(item.getI_people()+"~"+item.getI_people2());
		if(bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		service.update(item,request);
		mav.setViewName("redirect:/item/list.sdj");
		return mav;
	}
	@RequestMapping("item/delete")
	public ModelAndView delete(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("item/list");
		int i_no = Integer.parseInt(request.getParameter("no"));
		if(service.deleteItem(i_no) > 0) {
			mav.addObject("msg","상품 삭제를 성공 했습니다.");
			mav.addObject("url","../item/list.sdj");
			mav.setViewName("alert");
		} else {
			throw new ShopException("상품 삭제를 실패 했습니다.","../item/detail.sdj?no=" + i_no);
		}
		return mav;
	}
	@RequestMapping("item/buyout")
	public ModelAndView buyout(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String loginId = (String)session.getAttribute("loginUser");
		mav.addObject("loginUser1", service.getUser(loginId));
		Item item = service.detail(Integer.parseInt(request.getParameter("i_no")));
		ItemSet is = new ItemSet(item,Integer.parseInt(request.getParameter("quantity")));
		mav.addObject("itemSet", is);
		return mav;
	}
	
}
