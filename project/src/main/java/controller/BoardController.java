package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import exception.BoardException;
import logic.Board;
import logic.Reply;
import logic.ShopService;

@Controller
public class BoardController {
	
	@Autowired
	private ShopService service;

	@RequestMapping("board/list")
	public ModelAndView list(Integer pageNum, String searchType, String searchContent, HttpServletRequest request) {
		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		String category = (request.getParameter("b_category") != null)?request.getParameter("b_category"):"1";
		ModelAndView mav = new ModelAndView();
		int limit = 10;
		int listcount = service.boardcount(searchType, searchContent,category);
		List<Board> boardlist = service.boardList(searchType, searchContent,pageNum,limit,category);
		int maxpage = (int)((double)listcount/limit + 0.95);
		int startpage = ((int)((pageNum/10.0 + 0.9) - 1)) * 10 + 1;
		int endpage = startpage + 9;
		if(endpage > maxpage) endpage = maxpage;
		int boardcnt = listcount - (pageNum - 1) * limit;
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("listcount", listcount);
		mav.addObject("boardlist", boardlist);
		mav.addObject("boardcnt", boardcnt);
		return mav;
	}
	@RequestMapping(value="board/write", method=RequestMethod.GET)
	public ModelAndView write2(Integer b_no, Integer pageNum, Integer b_category, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("board",new Board());
		return mav;
	}
	@RequestMapping(value="board/write", method=RequestMethod.POST)
	public ModelAndView write(Board board, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
//		if (bindingResult.hasErrors()) {
//			mav.getModel().putAll(bindingResult.getModel());
//			return mav;
//		} 
		try {
			service.insert(board, request, session);
			mav.setViewName("redirect:list.sdj?b_category="+request.getParameter("b_category"));
		} catch(Exception e) {
			e.printStackTrace();
			throw new BoardException("�Խñ� ��� ����", "write.sdj?b_category="+request.getParameter("b_category"));
		}
		return mav; 
	}
	
	@RequestMapping(value="board/reply", method=RequestMethod.POST)
	public ModelAndView reply(Board board, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
//		if (bindingResult.hasErrors()) {
//			mav.getModel().putAll(bindingResult.getModel());
//			board = service.getBoard(board.getB_no());
//			mav.addObject("board", board);
//			return mav;
//		}
		try {
			service.boardReply(board, request,session);
			mav.setViewName("redirect:list.sdj?b_category="+request.getParameter("b_category"));
		} catch(Exception e) {
			e.printStackTrace();
			throw new BoardException("��۽���", "reply.sdj");
		}
		return mav;
	}
	@RequestMapping(value="board/update", method=RequestMethod.POST)
	public ModelAndView boardUpdate(Board board, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Board dbBoard = service.getBoard(board.getB_no());
		/*if (bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			board = service.getBoard(board.getB_no());
			board = service.getBoard(board.getB_category());
			mav.addObject("board", board);
			return mav;
		}*/
		if(board.getB_file() == null || board.getB_file().isEmpty()) {
			board.setB_fileurl(request.getParameter("b_file"));
		}
		try {
			service.boardUpdate(board, request);
			mav.setViewName("redirect:detail.sdj?b_no="+request.getParameter("b_no")+"&pageNum="+request.getParameter("pageNum")+"&b_category="+request.getParameter("b_category"));
		} catch(Exception e) {
			throw new BoardException("��������", "update.sdj?b_no="+request.getParameter("b_no")+"&pageNum="+request.getParameter("pageNum"));
		}
		return mav;
	}
	@RequestMapping(value="board/delete", method=RequestMethod.POST)
	public ModelAndView boardDelete(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		Board dbBoard = service.getBoard(b_no);
//		if(!request.getParameter("pass").equals(dbBoard.getPass())) {
//			throw new BoardException("��й�ȣ ����", "delete.sdj?num="+request.getParameter("num")+"&pageNum="+request.getParameter("pageNum"));
//		}
		try {
			service.boardDelete(b_no);
			mav.setViewName("redirect:list.sdj?b_category=" + dbBoard.getB_category());
		} catch(Exception e) {
			e.printStackTrace();
			throw new BoardException("��������", "delete.sdj?b_no="+request.getParameter("b_no")+"&pageNum="+request.getParameter("pageNum"));
		}
		return mav;
	}

//	@RequestMapping(value="board/delete", method=RequestMethod.POST)
//	public ModelAndView boardDelete2(@RequestParam HashMap<String, String> map) {
//		ModelAndView mav = new ModelAndView();
//		int b_no = Integer.parseInt(map.get("b_no"));
//		Board dbBoard = service.getBoard(b_no);
//		if(!map.get("pass").equals(dbBoard.getPass())) {
//			throw new BoardException("��й�ȣ ����", "delete.sdj?num="+num+"&pageNum="+map.get("pageNum"));
//		}
//		try {
//			service.boardDelete(b_no);
//			mav.setViewName("redirect:list.sdj");
//		} catch(Exception e) {
//			e.printStackTrace();
//			throw new BoardException("��������", "delete.sdj?b_no="+b_no+"&pageNum="+map.get("pageNum"));
//		}
//		return mav;
//	}
	
	@RequestMapping(value="board/r_reply", method=RequestMethod.POST)
	public ModelAndView reply(Reply reply, Board board, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String b_no = request.getParameter("b_no");
		String pageNum = request.getParameter("pageNum");
		String b_category = request.getParameter("b_category");
		try {
			service.Reply(reply, board, request, session);
			mav.setViewName("redirect:detail.sdj?b_no="+b_no+"&pageNum="+pageNum);
		} catch(Exception e) {
			e.printStackTrace();
			throw new BoardException("��۽���", "detail.sdj?b_no="+b_no+"&pageNum="+pageNum+"&b_category="+b_category);
		}
		return mav;
	} 
	@RequestMapping(value="board/r_update", method=RequestMethod.POST)
	public ModelAndView r_update(Reply reply, Board board, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String b_no = request.getParameter("b_no");
		String pageNum = request.getParameter("pageNum");
		String b_category = request.getParameter("b_category");
		try {
			service.r_update(reply, board, request, session);
			mav.setViewName("redirect:detail.sdj?b_no="+b_no+"&pageNum="+pageNum+"&b_category="+b_category);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	@RequestMapping(value="board/replyRe", method=RequestMethod.POST)
	public ModelAndView replyRe(Board board, Reply reply, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String b_no = request.getParameter("b_no");
		String pageNum = request.getParameter("pageNum");
		String b_category = request.getParameter("b_category");
//		if (bindingResult.hasErrors()) {
//			mav.getModel().putAll(bindingResult.getModel());
//			board = service.getBoard(board.getB_no());
//			mav.addObject("board", board);
//			return mav;
//		}
		try {
			service.replyRe(board, request,session,reply);
			mav.setViewName("redirect:detail.sdj?b_no="+b_no+"&pageNum="+pageNum+"&b_category="+b_category);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	 @RequestMapping("board/replyDelete")
	   public ModelAndView comreplyConreplyDelete(HttpSession session, String memberid, Integer b_category, Integer b_no, Integer pageNum, Integer r_no) {
	      ModelAndView mav = new ModelAndView();
	      try {
	    	  service.replyDelete(r_no);
	         //info
	         List<Reply> replyList = service.replylist(b_no);
	         mav.addObject("replyList", replyList);
	      }catch (Exception e) {
	         e.printStackTrace();
	      }
	      mav.addObject("reply", new Reply());
	      mav.addObject("msg","����� ���� �Ǿ����ϴ�.");
	      mav.addObject("url","detail.sdj?b_no="+b_no+"&b_category="+b_category+"&pageNum="+pageNum);
	      mav.setViewName("alert");
	      return mav;
	   }
	@RequestMapping(value="board/purchaseComments",method=RequestMethod.GET)
	public ModelAndView purchaseComment(int i_no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new Board());
		mav.addObject("item", service.detail(i_no));
		return mav;
	}
	@RequestMapping(value="board/purchaseComments",method=RequestMethod.POST)
	public ModelAndView purchaseComments(HttpServletRequest request, HttpSession session,Board board) {
		ModelAndView mav = new ModelAndView("board/closeWindow");
		service.insert(board, request, session);
		System.out.println(board);
		System.out.println(request.getParameter("grade"));
		return mav;
	}
	@RequestMapping("board/main")
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<Board> review = service.getReview();
		mav.addObject("review", review);
		return mav;
	}
	
	@RequestMapping("board/join")
	@ResponseBody
	public String join(@RequestParam(value="value")String value, @RequestParam(value="b_no")Integer b_no, HttpSession session, HttpServletRequest request) {
		String result = "";
		System.out.println("join test"+b_no+"::::"+value);
		if (value.equals("1")) {
			try{
				System.out.println("!!!!");
				String id = (String)session.getAttribute("loginUser");
				Board board = service.getBoard(b_no);
				board.setG_id(board.getG_id()+((board.getG_id().substring(board.getG_id().length()-1).equals(","))?" ":",")+id);
				System.out.println(board);
				service.boardUpdate(board, request);
				board = service.getBoard(b_no);
				String[] idList = board.getG_id().split(",");
				String idList2 = "";
				for (int i=0; i<idList.length; i++) {
					idList[i] = idList[i].trim();
					idList2 += idList[i] +((i!=idList.length-1)?",":"");
				}
				result = idList2;
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try{
				String id = (String)session.getAttribute("loginUser");
				Board board = service.getBoard(b_no);
				String[] idList = board.getG_id().split(",");
				String idList2 = "";
				for (int i=0; i<idList.length; i++) {
					idList[i] = idList[i].trim();
					if (!idList[i].equals(id)) {
						idList2 += idList[i] +((i!=idList.length-1)? ",":"");
					}
				}
				board.setG_id(idList2);
				service.boardUpdate(board, request);

				board = service.getBoard(b_no);
				idList = board.getG_id().split(",");
				idList2 = "";
				for (int i=0; i<idList.length; i++) {
					idList[i] = idList[i].trim();
					idList2 += idList[i] +((i!=idList.length-1)? ",":"");
				}
				result = idList2;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	@RequestMapping(value="board/*", method=RequestMethod.GET)
	public ModelAndView detail(Integer b_no, Integer pageNum, Integer b_category, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
			try {
				Board board = service.getBoard(b_no);
				if (board.getG_id() != null) {
					String[] idList = board.getG_id().split(",");
					String[] idList2=new String[idList.length];
					for (int i=0; i<idList.length; i++) {
						idList2[i] = idList[i].trim();
					}
					mav.addObject("idList", idList2);
				}
				System.out.println(board);
				board.setG_id(board.getG_id().trim());
				mav.addObject("board",board);
				
				service.updatereadcnt(b_no);
				
				List<Reply> replylist =  service.getBoardReply(b_no);
				
				mav.addObject("replylist", replylist);
				mav.addObject("reply", new Reply());
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		return mav;
	}
}
