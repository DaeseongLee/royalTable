package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import exception.CartEmptyException;
import exception.LoginException;

@Component
@Aspect
public class CartAspect {
//	@Around("execution(* controller.Cart*.check*(..))") //advice. controller 패키지의 Cart의 check 메서드
//	public Object cartCheck(ProceedingJoinPoint joinPoint) throws Throwable {
//		HttpSession session = (HttpSession)joinPoint.getArgs()[0]; //첫번째 메서드 HttpSession이 되어야한다.
//		Cart cart = (Cart)session.getAttribute("CART");
//		if(cart == null || cart.isEmpty()) {
//			throw new CartEmptyException("장바구니에 주문 상품이 없습니다.","../item/list.shop");
//		}
//		if(session.getAttribute("loginUser") == null) {
//			throw new LoginException("로그인 한 고객만 상품 주문이 가능합니다.","../item/list.shop");
//		}
//		Object ret = joinPoint.proceed();
//		return ret;
//	}
}
