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
//	@Around("execution(* controller.Cart*.check*(..))") //advice. controller ��Ű���� Cart�� check �޼���
//	public Object cartCheck(ProceedingJoinPoint joinPoint) throws Throwable {
//		HttpSession session = (HttpSession)joinPoint.getArgs()[0]; //ù��° �޼��� HttpSession�� �Ǿ���Ѵ�.
//		Cart cart = (Cart)session.getAttribute("CART");
//		if(cart == null || cart.isEmpty()) {
//			throw new CartEmptyException("��ٱ��Ͽ� �ֹ� ��ǰ�� �����ϴ�.","../item/list.shop");
//		}
//		if(session.getAttribute("loginUser") == null) {
//			throw new LoginException("�α��� �� ���� ��ǰ �ֹ��� �����մϴ�.","../item/list.shop");
//		}
//		Object ret = joinPoint.proceed();
//		return ret;
//	}
}
