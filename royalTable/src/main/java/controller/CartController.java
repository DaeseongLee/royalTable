package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Cart;
import logic.ShopService;
import logic.User;

@RequestMapping("cart")
@Controller

public class CartController {
	@Autowired
	private ShopService service;
	
//	@RequestMapping("cartAdd") //장바구니 추가
//	public ModelAndView add(Integer id, Integer quantity, HttpSession session) {
//		Item selectedItem = service.getItemById(id); //해당 id정보를 읽어와서 selecteItem에 등록
//		Cart cart = (Cart)session.getAttribute("CART"); //카트라는 속성의 CART 이름을 가진 것
//		if(cart == null) {
//			cart = new Cart();
//			session.setAttribute("CART", cart);
//		}
//		cart.push(new ItemSet(selectedItem, quantity)); 
//		ModelAndView mav = new ModelAndView("cart/cart");
//		mav.addObject("message", 
//				selectedItem.getName() + ":" + quantity + "개 장바구니 추가");
//		mav.addObject("cart", cart);
//		return mav;
//	}
//	@RequestMapping("cartDelete") //장바구니에서 삭제
//	public ModelAndView delete(Integer index, HttpSession session) {
//		ModelAndView mav = new ModelAndView("cart/cart");
//		Cart cart = (Cart)session.getAttribute("CART"); //세션으로부터 cart라는 이름을 가진 객체를 가져온다.
//		int idx = index;
//		ItemSet selectedItem = null;
//		try {
//			//selecteItem : ItemSetList 리스트 객체에서 삭제된 객체
//			selectedItem = cart.getItemSetList().remove(idx); //remove:삭제된..., 3번째를 삭제하면 4번째가 전달된다
//			mav.addObject("message", selectedItem.getItem().getName() + "상품 장바구니에서 삭제"); //selectedItem.getItem().getName() : 삭제된 객체 이름
//		} catch(Exception e) {
//			e.printStackTrace();
//			mav.addObject("message", selectedItem.getItem().getName() + "상품 장바구니에서 삭제 실패"); 
//		}
//		mav.addObject("cart", cart);
//		return mav;
//	}
	
	@RequestMapping("cartView") //장바구니
	public ModelAndView view(HttpSession session) {
		ModelAndView mav = new ModelAndView("cart/cart");
		Cart cart = (Cart)session.getAttribute("CART");
		List<Cart> cartlist = service.cartlist();
		mav.addObject("cartlist", cartlist);
		return mav;
	}
	
	@RequestMapping("orderform") //주문서=checkout
	public ModelAndView orderform(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@RequestMapping("ordercomplete") //주문완료
	public ModelAndView complete(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	/*
	 * 주문 확정
	 * 1. 주문테이블, 주문테이블에 내용 등록
	 * 2. 장바구니의 상품 제거
	 */
//	@RequestMapping("end")
//	public ModelAndView checkend (HttpSession session) {
//		ModelAndView mav = new ModelAndView();
//		Cart cart = (Cart)session.getAttribute("CART");
//		User loginUser = (User)session.getAttribute("loginUser");
//		Sale sale = service.checkEnd(loginUser, cart);
//		long tot = cart.getTotal();
//		cart.clearAll(session); //장바구니 상품 제거
//		mav.addObject("sale", sale);
//		mav.addObject("tot", tot);
//		return mav;
//	}
//	
	@RequestMapping("*")
	public String cart(HttpSession session) {
		return null;
	}
	
}
