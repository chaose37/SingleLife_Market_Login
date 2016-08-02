package org.single.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.single.domain.UserVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
		HttpSession session = request.getSession();
		
		logger.warn("" + session.getId());
		logger.warn("" + session.getAttribute("login"));
		
		try {
			UserVO vo = (UserVO)session.getAttribute("login");
			Cookie loginCookie = new Cookie("loginCookie", vo.getEmail());
			loginCookie.setPath("/");
			loginCookie.setDomain("http://localhost:8000");
			loginCookie.setMaxAge(60 * 60 * 24 * 7);
			response.addCookie(loginCookie);
			
			
		}catch(Exception e){
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
		logger.warn("\n\n");

	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN) != null){
			logger.warn("clear login data before");
			session.removeAttribute(LOGIN);
		}
		return true;
	}
}

