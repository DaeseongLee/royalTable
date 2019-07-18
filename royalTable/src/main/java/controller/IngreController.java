package controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Ingre;
import logic.Menu;
import logic.ShopService;


@Controller
@RequestMapping("ingre")
public class IngreController {
	@Autowired
	private ShopService service;
	
	@RequestMapping("list")
	public ModelAndView list (Integer pageNum, String searchtype, String searchcontent) {
		ModelAndView mav = new ModelAndView();
		if(searchtype != null && searchtype.equals("")) searchtype = null;
		if(searchcontent != null && searchcontent.equals("")) searchcontent = null;
		if(pageNum == null || pageNum.toString().equals("")) { //pageNum�� �Ķ���͸� ���� ���
			pageNum = 1;
		}
		int limit = 10; // ���������� ��µǴ� �Խù� ����
		int listcount = service.ingrecount(searchtype, searchcontent); // ��ϵ� ��ü �Խù� ����
		// �� �������� ��µ� �Խù� ����
		List<Ingre> ingrelist = service.ingrelist(pageNum,limit,searchtype, searchcontent);
		// ��ü ������ ��
		int maxpage = (int)((double)listcount/limit + 0.95);
		// ȭ�鿡 ��µ� ���� ������
		int startpage = (int)((pageNum / 10.0 + 0.9) -1 ) * 10 + 1;
		// ȭ�鿡 ��µ� �� ������
		int endpage = startpage + 9;
		if(endpage>maxpage) endpage = maxpage;
		// ��µǴ� ����
		int ingreno = listcount - (pageNum -1) * limit;
		mav.addObject("pageNum",pageNum);
		mav.addObject("maxpage",maxpage);
		mav.addObject("startpage",startpage);
		mav.addObject("endpage",endpage);
		mav.addObject("listcount",listcount);
		mav.addObject("ingrelist",ingrelist);
		mav.addObject("ingreno",ingreno);
		mav.addObject("searchtype",searchtype);
		mav.addObject("searchcontent",searchcontent);
		return mav;
	}
	@RequestMapping("create")
	 public ModelAndView creat(@Valid Ingre ingre, BindingResult bindResult, HttpServletRequest request) {
		 ModelAndView mav = new ModelAndView();
		 mav.addObject("ingreNo",ingre.getIngreNo());
		 mav.addObject(new Ingre());
		 return mav;
	 }
	
	@RequestMapping("add")
	public ModelAndView add(@Valid Ingre ingre,BindingResult bindResult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("ingre/create");
		if(bindResult.hasErrors()) {
			mav.getModel().putAll(bindResult.getModel());
			return mav;
		}
		service.ingreInsert(ingre,request);
		mav.setViewName("redirect:/ingre/list.shop");
		return mav;
	}
	
	// ====================== �޴� ==========================
	
	@RequestMapping("menuList")
	public ModelAndView menuList (Integer pageNum, String searchtype, String searchcontent) {
		ModelAndView mav = new ModelAndView();
		if(searchtype != null && searchtype.equals("")) searchtype = null;
		if(searchcontent != null && searchcontent.equals("")) searchcontent = null;
		if(pageNum == null || pageNum.toString().equals("")) { //pageNum�� �Ķ���͸� ���� ���
			pageNum = 1;
		}
		int limit = 10; // ���������� ��µǴ� �Խù� ����
		int listcount = service.menucount(searchtype, searchcontent); // ��ϵ� ��ü �Խù� ����
		// �� �������� ��µ� �Խù� ����
		List<Menu> menulist = service.menulist(pageNum,limit,searchtype, searchcontent);
		
		// ��ü ������ ��
		int maxpage = (int)((double)listcount/limit + 0.95);
		// ȭ�鿡 ��µ� ���� ������
		int startpage = (int)((pageNum / 10.0 + 0.9) -1 ) * 10 + 1;
		// ȭ�鿡 ��µ� �� ������
		int endpage = startpage + 9;
		if(endpage>maxpage) endpage = maxpage;
		// ��µǴ� ����
		int menuno = listcount - (pageNum -1) * limit;
		mav.addObject("pageNum",pageNum);
		mav.addObject("maxpage",maxpage);
		mav.addObject("startpage",startpage);
		mav.addObject("endpage",endpage);
		mav.addObject("listcount",listcount);
		mav.addObject("menulist",menulist);
		
		mav.addObject("menuno",menuno);
		mav.addObject("searchtype",searchtype);
		mav.addObject("searchcontent",searchcontent);
		return mav;
	}
	@RequestMapping("register")
	 public ModelAndView register(@Valid Menu menu, BindingResult bindResult, HttpServletRequest request) {
		 ModelAndView mav = new ModelAndView();
		 List<Ingre> ingrelist = service.ingrelist();
		 mav.addObject("menuNo",menu.getMenuNo());
		 mav.addObject("ingrelist",ingrelist);
		 mav.addObject(new Menu());
		 return mav;
	 }
	@RequestMapping("reMenu")
	public ModelAndView madd(@Valid Menu menu,BindingResult bindResult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("ingre/register");
		int maxNo = service.maxNo();
		menu.setMenuNo(++maxNo);
		service.menuInsert(menu,request);
		mav.setViewName("redirect:/ingre/menuList.shop");
		return mav;
	}
	@RequestMapping("addMenu")
	public ModelAndView addMenu(Menu menu,BindingResult bindResult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menuName",menu.getMenuName());
		mav.addObject(new Menu());
		return mav;
	}
}
