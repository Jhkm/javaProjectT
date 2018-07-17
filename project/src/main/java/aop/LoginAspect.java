package aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import exception.LoginException;

@Component
@Aspect
public class LoginAspect {
	@Around("execution (* controller.*.lg*(..))")
	public Object userLogincheck(ProceedingJoinPoint joinPoint) throws Throwable {
		String loginId = null;
		String userId = null;
		HttpSession session = null;
		HttpServletRequest request = null;
		session = (HttpSession)joinPoint.getArgs()[0];
		loginId = (String)session.getAttribute("loginUser");
		if(loginId == null) {
			throw new LoginException("�α��� �� �̿��� �� �ֽ��ϴ�.","../user/login.sdj");
		}
		if(joinPoint.getArgs()[1] instanceof HttpServletRequest) {
			request = (HttpServletRequest)joinPoint.getArgs()[1];
			userId = request.getParameter("id");
			if(!(loginId.equals("admin") || loginId.equals(userId))) {
				throw new LoginException("�ٸ� ��� ������ ���� �����ϴ�.","../user/mypage.sdj?id="+loginId);
			}
			
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
	@Around("execution (* controller.*.adm*(..))")
	public Object adminCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		String loginId = null;
		HttpSession session = null;
		session = (HttpSession)joinPoint.getArgs()[0];
		loginId = (String)session.getAttribute("loginUser");
		if(loginId == null) {
			throw new LoginException("�����ڸ� ��밡���� ������ �Դϴ�.","../user/login.sdj");
		}
		if(!loginId.equals("admin")) {
			throw new LoginException("�����ڸ� ��밡���� ������ �Դϴ�.","../item/main.sdj");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
	@Around("execution (* controller.*.lc*(..))")
	public Object loginCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		String loginId = null;
		HttpSession session = null;
		session = (HttpSession)joinPoint.getArgs()[0];
		loginId = (String)session.getAttribute("loginUser");
		if(loginId == null) {
			throw new LoginException("�α��� �� ��� �����մϴ�.","../user/login.sdj");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
}
