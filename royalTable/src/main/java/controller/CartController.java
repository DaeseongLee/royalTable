package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("cart")
@Controller

public class CartController {
	
	@RequestMapping("cartView")
	public ModelAndView view(HttpSession session) {
		ModelAndView mav = new ModelAndView("cart/cart");
		return mav;
	}
	
	@RequestMapping("orderform")
	public ModelAndView orderform(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@RequestMapping("ordercomplete")
	public ModelAndView complete(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
}
