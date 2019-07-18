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
			bindResult.reject("error.duplicate.user"); //"중복된 아이디입니다." 메세지를 출력해줌.
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
			//아이디 없음, 비밀번호 오류 화면에 출력
			//로그인 성공 : 세션에 loginUser 이름으로 dbUser 저장
			//				main.shop 리다이렉트
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
		//user : 사용자 id의 db 정보
		User user = service.userSelect(id); 
		//salelist : 사용자 id의 주문정보 목록 저장
//		List<Sale> salelist = service.salelist(id); //한 id에 주문정보가 여러개 있을 수도 있으니까 list로 받아야 한다.
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
	 * 1. 관리자 강제 탈퇴
	 * 	- 비밀번호에 관리자 비밀번호 입력하기
	 *  - 관리자비밀번호가 맞는 경우 해당 회원정보 db에서 삭제
	 *  - 삭제 성공 : mypage.shop으로 페이지 이동
	 *  - 삭제 실패 : delete.shop으로 페이지 이동
	 *  
	 *  2. 본인 탈퇴
	 *  -비밀번호에 본인 비밀번호 입력하기
	 *  - 비밀번호가 맞는 경우 회원정보 삭제
	 *  - 삭제 성공 : 로그아웃 후 login.shop으로 페이지 이동
	 *  - 삭제 실패 : delete.shop으로 페이지 이동
	 */
	@PostMapping("delete")
	public ModelAndView delete(User user, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User loginUser = (User)session.getAttribute("loginUser");
//		String password = service.messageDigest(user.getPassword());
//		if(!loginUser.getPassword().equals(password)) {
//			throw new LoginException("비밀번호 틀렸지롱 ㅋㅋ", "delete.shop?id="+user.getUserId());
//		}
		if(!loginUser.getPassword().equals(user.getPassword())) {
			throw new LoginException("비밀번호 틀렸지롱 ㅋㅋ", "delete.shop?id="+user.getUserId());
		}
		
		try {
			service.delete(user);
			if(loginUser.getUserId().equals("admin")) {
				mav.setViewName("redirect:/admin/list.shop");
			} else {
				session.invalidate();
				mav.addObject("msg","탈퇴되었습니다. 안뇽~~");
				mav.addObject("url","login.shop");
				mav.setViewName("alert");
			}
		} catch(Exception e) {
			e.printStackTrace();
			throw new LoginException("회원탈퇴 못해 ㅋㅋ","delete.shop?id="+loginUser.getUserId());
		}
		return mav;
	}
	
	
}
