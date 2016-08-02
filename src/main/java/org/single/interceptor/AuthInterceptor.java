package org.single.interceptor;

import java.util.Enumeration;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.single.domain.UserVO;
import org.single.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

public class AuthInterceptor extends HandlerInterceptorAdapter{
private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Inject
	private UserService service;
	
	private void saveDest(HttpServletRequest req){
		String uri = req.getRequestURI();
		String query = req.getQueryString();
		if(query == null || query.equals("null")){
			query = "";
		} else{
			query = "?"+query;
		}
		
		if(req.getMethod().equals("GET")){
			logger.warn("dest: " + (uri + query));
			req.getSession().setAttribute("dest", uri + query);
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		HttpSession session = request.getSession();
		
		logger.warn(session.getId());
		Enumeration<String> en = session.getAttributeNames();
		
		while(en.hasMoreElements()){
			String name = en.nextElement();
			logger.warn(": " + name);
			logger.warn(": " + session.getAttribute(name));
		}
		
		if(session.getAttribute("login")==null){
			logger.warn("current user is not logined");
			
			saveDest(request);
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null){
				UserVO userVO = service.checkLoginBefore(loginCookie.getValue());
				
				logger.warn("USERVO : " + userVO);
				
				if(userVO != null){
					session.setAttribute("login", userVO);
					return true;
				}
			}
			
			response.sendRedirect("/user/login");
		}
		
		return true;
		
	}
	
}

