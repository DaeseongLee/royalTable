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
	
//	@RequestMapping("cartAdd") //��ٱ��� �߰�
//	public ModelAndView add(Integer id, Integer quantity, HttpSession session) {
//		Item selectedItem = service.getItemById(id); //�ش� id������ �о�ͼ� selecteItem�� ���
//		Cart cart = (Cart)session.getAttribute("CART"); //īƮ��� �Ӽ��� CART �̸��� ���� ��
//		if(cart == null) {
//			cart = new Cart();
//			session.setAttribute("CART", cart);
//		}
//		cart.push(new ItemSet(selectedItem, quantity)); 
//		ModelAndView mav = new ModelAndView("cart/cart");
//		mav.addObject("message", 
//				selectedItem.getName() + ":" + quantity + "�� ��ٱ��� �߰�");
//		mav.addObject("cart", cart);
//		return mav;
//	}
//	@RequestMapping("cartDelete") //��ٱ��Ͽ��� ����
//	public ModelAndView delete(Integer index, HttpSession session) {
//		ModelAndView mav = new ModelAndView("cart/cart");
//		Cart cart = (Cart)session.getAttribute("CART"); //�������κ��� cart��� �̸��� ���� ��ü�� �����´�.
//		int idx = index;
//		ItemSet selectedItem = null;
//		try {
//			//selecteItem : ItemSetList ����Ʈ ��ü���� ������ ��ü
//			selectedItem = cart.getItemSetList().remove(idx); //remove:������..., 3��°�� �����ϸ� 4��°�� ���޵ȴ�
//			mav.addObject("message", selectedItem.getItem().getName() + "��ǰ ��ٱ��Ͽ��� ����"); //selectedItem.getItem().getName() : ������ ��ü �̸�
//		} catch(Exception e) {
//			e.printStackTrace();
//			mav.addObject("message", selectedItem.getItem().getName() + "��ǰ ��ٱ��Ͽ��� ���� ����"); 
//		}
//		mav.addObject("cart", cart);
//		return mav;
//	}
	
	@RequestMapping("cartView") //��ٱ���
	public ModelAndView view(HttpSession session) {
		ModelAndView mav = new ModelAndView("cart/cart");
		Cart cart = (Cart)session.getAttribute("CART");
		List<Cart> cartlist = service.cartlist();
		mav.addObject("cartlist", cartlist);
		return mav;
	}
	
	@RequestMapping("orderform") //�ֹ���=checkout
	public ModelAndView orderform(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@RequestMapping("ordercomplete") //�ֹ��Ϸ�
	public ModelAndView complete(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	/*
	 * �ֹ� Ȯ��
	 * 1. �ֹ����̺�, �ֹ����̺� ���� ���
	 * 2. ��ٱ����� ��ǰ ����
	 */
//	@RequestMapping("end")
//	public ModelAndView checkend (HttpSession session) {
//		ModelAndView mav = new ModelAndView();
//		Cart cart = (Cart)session.getAttribute("CART");
//		User loginUser = (User)session.getAttribute("loginUser");
//		Sale sale = service.checkEnd(loginUser, cart);
//		long tot = cart.getTotal();
//		cart.clearAll(session); //��ٱ��� ��ǰ ����
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
