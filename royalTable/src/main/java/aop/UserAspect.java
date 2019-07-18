package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import exception.LoginException;
import logic.User;

@Component //��üȭ
@Aspect 
public class UserAspect {
//	@Around("execution(* controller.User*.check*(..)) && args(..,session))") //check�� �����ϰ� && �Ű������� session���� �����ϴ� ��
//	public Object userMainCheck(ProceedingJoinPoint joinPoint, HttpSession session) throws Throwable {
//		User loginUser = (User)session.getAttribute("loginUser");
//		if(loginUser == null) {
//			throw new LoginException("�α��� �� �ŷ��ϼ���","login.shop");
//		}
//		Object ret = joinPoint.proceed();
//		return ret;
//	}
	@Around("execution(* controller.User*.check*(..)) && args(id,session))")
	public Object userIdCheck(ProceedingJoinPoint joinPoint, String id, HttpSession session) throws Throwable {
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser == null) {
			throw new LoginException("�α��� �� �ŷ��ϼ���","login.shop");
		}
		if(!loginUser.getUserId().equals("admin") && !loginUser.getUserId().equals(id)) {
			throw new LoginException("���� ������ ��ȸ �����մϴ�.","main.shop");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
}
