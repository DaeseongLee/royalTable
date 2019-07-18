package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.LoginException;
import logic.ShopService;
import logic.User;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private ShopService service;
	@GetMapping("*")
	public String from(Model model) {
		model.addAttribute(new User());
		return null;
	}
	@PostMapping("userEntry")
	public ModelAndView uerEntry(@Valid User user, BindingResult bindResult) {
		ModelAndView mav = new ModelAndView();
		if(bindResult.hasErrors()) {
			mav.getModel().putAll(bindResult.getModel());
			return mav;
		}
		try {
			service.userCreate(user);
			mav.setViewName("user/login");
			mav.addObject("user",user);
		} catch(DataIntegrityViolationException e) {
			bindResult.reject("error.duplicate.user"); //"�ߺ��� ���̵��Դϴ�." �޼����� �������.
		}
		return mav;
	}
	@PostMapping("login")
	public ModelAndView login(@Valid User user, BindingResult bindResult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(bindResult.hasErrors()) {
			bindResult.reject("error.input.user");
			mav.getModel().putAll(bindResult.getModel());
			return mav;
		}
			User dbUser = service.userSelect(user.getUserId());
			//���̵� ����, ��й�ȣ ���� ȭ�鿡 ���
			//�α��� ���� : ���ǿ� loginUser �̸����� dbUser ����
			//				main.shop �����̷�Ʈ
			if(dbUser == null) {
				bindResult.reject("error.login.id");
				return mav;
			}
			if(!dbUser.getPassword().equals(user.getPassword())) {
				bindResult.reject("error.login.password");
			} else {
//			String password = service.messageDigest(user.getPassword());
//			if(!dbUser.getPassword().equals(password)) {
//				bindResult.reject("error.login.password");
//			} else {
				session.setAttribute("loginUser", dbUser);
				mav.setViewName("redirect:main.shop");
			}
		return mav;
	}
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:main.shop";
	}
	@RequestMapping("main")
	public String checkmain(HttpSession session) {
		return "user/main";
	}
	@RequestMapping("mypage")
	public ModelAndView checkmypage(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//user : ����� id�� db ����
		User user = service.userSelect(id); 
		//salelist : ����� id�� �ֹ����� ��� ����
//		List<Sale> salelist = service.salelist(id); //�� id�� �ֹ������� ������ ���� ���� �����ϱ� list�� �޾ƾ� �Ѵ�.
//		for(Sale sa : salelist) {
//			List<SaleItem> saleitemlist = service.saleItemList(sa.getSaleId());
//			for(SaleItem si : saleitemlist) {
//				Item item = service.getItemById(si.getItemId());
//				si.setItem(item);
//			}
//			sa.setItemList(saleitemlist);
//		}
		mav.addObject("user",user);
//		mav.addObject("salelist",salelist);
		return mav;
	}
	@GetMapping(value= {"update","delete"})
	public ModelAndView checkupdateForm(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = service.userSelect(id);
		mav.addObject("user",user);
		return mav;
	}
	@PostMapping("update")
	public ModelAndView update(@Valid User user, BindingResult bindResult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(bindResult.hasErrors()) {
			bindResult.reject("error.input.user");
			mav.getModel().putAll(bindResult.getModel());
			return mav;
		}
		User loginUser = (User)session.getAttribute("loginUser");
		User dbUser = service.userSelect(user.getUserId());
		
		if(!dbUser.getPassword().equals(user.getPassword())) {
			bindResult.reject("error.login.password");
			return mav;
		}
		
//		String password = service.messageDigest(user.getPassword());
//		if(!dbUser.getPassword().equals(password)) {
//			bindResult.reject("error.login.password");
//			return mav;
//		}
		
		try {
//			user.setPassword(password);
			service.update(user);
			mav.setViewName("redirect:mypage.shop?id="+user.getUserId());
			
			if(!loginUser.getUserId().equals("admin")) {
				session.setAttribute("loginUser", user);
			
//			if(!loginUser.getUserId().equals("admin")) {
//				password = service.messageDigest(user.getPassword());
//				user.setPassword(password);
				session.setAttribute("loginUser", user);
			}
		} catch(Exception e) {
			e.printStackTrace();
			bindResult.reject("error.user.update");
		}
		return mav;
	}
	/*
	 * 1. ������ ���� Ż��
	 * 	- ��й�ȣ�� ������ ��й�ȣ �Է��ϱ�
	 *  - �����ں�й�ȣ�� �´� ��� �ش� ȸ������ db���� ����
	 *  - ���� ���� : mypage.shop���� ������ �̵�
	 *  - ���� ���� : delete.shop���� ������ �̵�
	 *  
	 *  2. ���� Ż��
	 *  -��й�ȣ�� ���� ��й�ȣ �Է��ϱ�
	 *  - ��й�ȣ�� �´� ��� ȸ������ ����
	 *  - ���� ���� : �α׾ƿ� �� login.shop���� ������ �̵�
	 *  - ���� ���� : delete.shop���� ������ �̵�
	 */
	@PostMapping("delete")
	public ModelAndView delete(User user, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User loginUser = (User)session.getAttribute("loginUser");
//		String password = service.messageDigest(user.getPassword());
//		if(!loginUser.getPassword().equals(password)) {
//			throw new LoginException("��й�ȣ Ʋ������ ����", "delete.shop?id="+user.getUserId());
//		}
		if(!loginUser.getPassword().equals(user.getPassword())) {
			throw new LoginException("��й�ȣ Ʋ������ ����", "delete.shop?id="+user.getUserId());
		}
		
		try {
			service.delete(user);
			if(loginUser.getUserId().equals("admin")) {
				mav.setViewName("redirect:/admin/list.shop");
			} else {
				session.invalidate();
				mav.addObject("msg","Ż��Ǿ����ϴ�. �ȴ�~~");
				mav.addObject("url","login.shop");
				mav.setViewName("alert");
			}
		} catch(Exception e) {
			e.printStackTrace();
			throw new LoginException("ȸ��Ż�� ���� ����","delete.shop?id="+loginUser.getUserId());
		}
		return mav;
	}
	
	
}
