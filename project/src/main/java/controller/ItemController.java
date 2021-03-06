package controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import exception.ShopException;
import logic.Board;
import logic.Item;
import logic.ItemSet;
import logic.ShopService;

@Controller //@Component의 하위 객체. @Component + Controller 기능 부여
public class ItemController {
	@Autowired
	private ShopService service;

	@RequestMapping("item/create")
	public ModelAndView admcreate(HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("item/itemadd");
		mav.addObject(new Item());
		List<Map<Integer, String>> maplist = service.gameType();
		mav.addObject("gametype", maplist);
		return mav;
	}
	@RequestMapping("item/register")
	public ModelAndView admregister(HttpSession session,HttpServletRequest request,@Valid Item item, BindingResult bindingResult) {
		System.out.println(item.getContentImgFile());
		ModelAndView mav = new ModelAndView("item/itemadd");
		item.setI_people(item.getI_people()+"~"+item.getI_people2());
		if(bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());		
			List<Map<Integer, String>> maplist = service.gameType();
			mav.addObject("gametype", maplist);
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
	public ModelAndView detail(Integer no,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		Item item = service.detail(no);
		String[] people = item.getI_people().split("~");
		item.setI_people(people[0]);
		item.setI_people2(people[1]);
		String explain[] = item.getI_explain().split(",");
		List<String> explainImg = new ArrayList<String>();
		for(int i = 0;i<explain.length;i++) {
			if(i == 0) {
				item.setI_explain(explain[i]);
			} else {
				explainImg.add(explain[i]);
			}
		}
		List<Map<Integer, String>> maplist = service.gameType();
		
		int checkResult = service.checkFavorit(no,(String)session.getAttribute("loginUser"),1);
		
		List<Board> commentList = service.getItemCommentList(no,10);
		
		double avgGrade = service.avgGrade(no,10);
		mav.addObject("explainImg", explainImg);
		mav.addObject("avgGrade", avgGrade);
		mav.addObject("commentsList", commentList);
		mav.addObject("checkResult", checkResult);
		mav.addObject("gametype", maplist);
		mav.addObject("item",item);
		return mav;
	}
	@RequestMapping("item/edit")
	public ModelAndView admedit(HttpSession session,HttpServletRequest request,Integer no) {
		return detail(no,session);
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
	public ModelAndView admdelete(HttpSession session,HttpServletRequest request) {
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
	public ModelAndView lcbuyout(HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String loginId = (String)session.getAttribute("loginUser");
		mav.addObject("loginUser1", service.getUser(loginId));
		Item item = service.detail(Integer.parseInt(request.getParameter("i_no")));
		ItemSet is = new ItemSet(item,Integer.parseInt(request.getParameter("quantity")));
		mav.addObject("itemSet", is);
		return mav;
	}
	@RequestMapping("item/end")
	public ModelAndView lcend(HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:list.sdj");
		String loginId = (String)session.getAttribute("loginUser");
		service.buyOneItem(request,loginId);
		return mav;
	}
	@RequestMapping("item/favoritItem")
	@ResponseBody
	public String lcfavoritItem(HttpSession session,String i_no) {
		String result = "";
		String loginId = (String)session.getAttribute("loginUser");
		result = service.favoritItem(i_no,loginId,1);
		return result;
	}
	@RequestMapping("item/main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		List<Item> itemList = service.getBestItemList();
		List<Board> review = service.getReview();
		mav.addObject("review", review);
		mav.addObject("itemlist", itemList);
		return mav;
	}
}
