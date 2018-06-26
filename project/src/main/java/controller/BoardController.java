package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@RequestMapping(value="board/*",method=RequestMethod.GET)
	public ModelAndView detail(Integer num,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
}
