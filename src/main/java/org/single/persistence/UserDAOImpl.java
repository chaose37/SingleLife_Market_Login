package org.single.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.single.domain.UserVO;
import org.single.dto.LoginDTO;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO{
	@Inject
	private SqlSession session;
	
	private static String NAMESPACE="org.single.mapper.UserMapper";

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return session.selectOne(NAMESPACE+".login", dto);
	}

	@Override
	public void keepLogin(String email, String sessionEmail, Date next) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("email", email);
		paramMap.put("sessionEmail", sessionEmail);
		paramMap.put("next", next);
		
		session.update(NAMESPACE+".keepLogin", paramMap);
	}

	@Override
	public UserVO checkUserWithSessionKey(String value) {
		return session.selectOne(NAMESPACE+".checkUserWithSessionKey", value);
	}

	@Override
	public String duplCheck(String email) {
		return session.selectOne(NAMESPACE+".checkEmail", email);
	}
}