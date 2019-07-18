package controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import exception.ShopException;
import logic.Board;
import logic.ShopService;

@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired
	private ShopService service;
	
	@RequestMapping("{notice,consult}")
	public ModelAndView list(Integer pageNum, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		String searchtype = request.getParameter("searchtype");
		String searchcontent = request.getParameter("searchcontent");
		
		if(searchtype != null && searchtype.equals("")) searchtype=null;
		if(searchcontent != null && searchcontent.equals("")) searchcontent=null;
		
		int limit = 10;
		int listcount = service.boardcount(searchtype, searchcontent);
		List<Board> boardlist = service.boardlist(pageNum, limit, searchtype, searchcontent);
		int maxpage = (int)((double)listcount/limit + 0.95);
		int startpage = ((int)((pageNum/10.0+0.9) -1)*10 + 1);
		int endpage = startpage + 9;
		if(endpage > maxpage) endpage = maxpage;
		int boardnum = listcount - (pageNum -1) * limit;
		mav.addObject("pageNum",pageNum);
		mav.addObject("maxpage",maxpage);
		mav.addObject("startpage",startpage);
		mav.addObject("endpage",endpage);
		mav.addObject("listcount",listcount);
		mav.addObject("boardlist",boardlist);
		mav.addObject("boardnum",boardnum);
		return mav;
	}
	@GetMapping("*")
	public ModelAndView getBoard(Integer boardNo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Board board = new Board();
		mav.addObject("board",board);
		if(boardNo != null) {
			board = service.getBoard(boardNo, request);
		}
		mav.addObject("board",board);
		return mav;
	}
	
	@PostMapping("write")
	public ModelAndView write(@Valid Board board, BindingResult br) {
		ModelAndView mav = new ModelAndView();
		if(br.hasErrors()) {return mav;}
		try {
			service.boardWrite(board);
			mav.setViewName("redirect:notice.shop");
		} catch (Exception e) {
			e.printStackTrace();
			throw new ShopException("게시물 등록에 실패했습니다.", "write.shop");
		}
		return mav;
	}
	@PostMapping("reply")
	public ModelAndView reply(@Valid Board board, BindingResult bindResult) {
		ModelAndView mav = new ModelAndView();
		if(bindResult.hasErrors()) { return mav; }
		try {
			service.boardReply(board);
			mav.setViewName("redirect:notice.shop");
		} catch(Exception e) {
			e.printStackTrace();
			throw new ShopException("답변 등록에 실패했습니다.", "reply.shop");
		}
		return mav;
	}
	@RequestMapping("imgupload")
	public String imgupload (MultipartFile upload, String CKEditorFuncNum, HttpServletRequest request, Model model) {
		String path = request.getSession().getServletContext().getRealPath("/") + "board/imgfile/";
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		if(!upload.isEmpty()) {
			File file = new File(path, upload.getOriginalFilename());
			try {
				upload.transferTo(file);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		String project = request.getContextPath();
		String fileName = project+"/board/imgfile/" +upload.getOriginalFilename();
		model.addAttribute("fileName",fileName);
		model.addAttribute("CKEditorFuncNum",CKEditorFuncNum);
		return "ckeditor";
	}
	@PostMapping("update")
	public ModelAndView update(@Valid Board board, BindingResult bindResult) {
		ModelAndView mav = new ModelAndView();
		if(bindResult.hasErrors()) { return mav; }
		try {
			service.boardUpdate(board);
			mav.setViewName("redirect:/board/notice.shop");
		} catch(Exception e) {
			e.printStackTrace();
			throw new ShopException("등록 실패했음", "update.shop?boardNo="+board.getBoardNo());
		}
		return mav;
	}
	
	@PostMapping("delete")
	public ModelAndView delete(Board board, BindingResult bindResult) {
		ModelAndView mav = new ModelAndView();
		if(bindResult.hasErrors()) { return mav; }
		try {
			service.boardDelete(board);
			mav.addObject("msg","삭제성공");
			mav.addObject("url","notice.shop");
			mav.setViewName("alert");
		} catch (Exception e) {
			e.printStackTrace();
			throw new ShopException("삭제 실패", "delete.shop?boardNo="+board.getBoardNo());
		}
		return mav;
	}
	
}
