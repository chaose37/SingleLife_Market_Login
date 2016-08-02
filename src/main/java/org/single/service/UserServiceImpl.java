package org.single.service;

import java.util.Date;

import javax.inject.Inject;

import org.single.domain.UserVO;
import org.single.dto.LoginDTO;
import org.single.persistence.UserDAO;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
	
	@Inject
	private UserDAO dao;

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public void keepLogin(String email, String sessionEmail, Date next) throws Exception {
		dao.keepLogin(email, sessionEmail, next);
	}

	@Override
	public UserVO checkLoginBefore(String value) {
		return dao.checkUserWithSessionKey(value);
	}

	@Override
	public String duplCheck(String email) throws Exception {
		return dao.duplCheck(email);
	}
}
