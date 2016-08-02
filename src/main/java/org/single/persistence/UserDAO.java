package org.single.persistence;

import java.util.Date;

import org.single.domain.UserVO;
import org.single.dto.LoginDTO;

public interface UserDAO {
	
	public UserVO login(LoginDTO dto) throws Exception;
	
	public void keepLogin(String email, String sessionEmail, Date next);
	
	public UserVO checkUserWithSessionKey(String value);
	
	public String duplCheck(String email);

}