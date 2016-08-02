package org.single.service;

import java.util.Date;

import org.single.domain.UserVO;
import org.single.dto.LoginDTO;

public interface UserService {
	
	public UserVO login(LoginDTO dto) throws Exception;
	
	public void keepLogin(String email, String sessionEmail, Date next) throws Exception;
	
	public UserVO checkLoginBefore(String value);
	
	public String duplCheck(String email) throws Exception;

}
