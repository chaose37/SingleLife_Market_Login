package org.single.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.single.domain.UserVO;
import org.single.dto.LoginDTO;
import org.single.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping("/user")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private UserService service;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto){
		
	}
	 
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void joinGET(@ModelAttribute("dto") LoginDTO dto){
		
	}
	
	@RequestMapping(value="/loginPostForm", method=RequestMethod.POST)
	public void loginPostForm(LoginDTO dto, HttpSession session, Model model) throws Exception{
		UserVO vo = service.login(dto);
		
		logger.warn("======================");
		logger.warn("======================");
		logger.warn("======================");
		System.out.println(vo);
		if(vo == null) {return ;}
		
		model.addAttribute("userVO", vo);
		session.setAttribute("login", vo);
		
		logger.warn("SESSION ID: "+ session.getId());
	}
	
	@CrossOrigin(origins="*", maxAge = 3600)
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void loginPost(LoginDTO dto, HttpSession session, Model model) throws Exception{
		
		logger.warn("======================");
		logger.warn(""+dto);
		logger.warn("======================");
		
		UserVO vo = service.login(dto);
		logger.warn("" + vo);
		if(vo == null)
			return;
		
		session.setAttribute("login", vo);
		if(dto.isUseCookie()){
			int amount = 60 * 60 * 24 * 7;
			Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
		}
	}	
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		
		Object obj = session.getAttribute("login");
		
		if(obj  != null){
			UserVO vo = (UserVO) obj;
			
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null){
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getEmail(), session.getId(), new Date());
			}
		}
		return "redirect:http://localhost:8000/board/list";
	}
	
	/**
	 * 이메일 중복체크
	 * @param email
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/duplCheck", method=RequestMethod.POST)
	@CrossOrigin(origins="*", maxAge = 3600)
	@ResponseBody
	public String duplCheck(String email) throws Exception{
		logger.warn("EMAIL: "+ email);
		String checkEmail = service.duplCheck(email);
		return checkEmail;
	}
}