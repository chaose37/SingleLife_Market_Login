package org.single.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.single.domain.BoardVO;
import org.single.domain.FileVO;
import org.single.domain.SearchCriteria;
import org.single.domain.UserVO;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Inject
	private SqlSessionTemplate session;
	private static String NAMESPACE = "org.single.mapper.BoardMapper";

	@Override
	public int regist(BoardVO boardVO) throws Exception {
		session.insert(NAMESPACE+".create", boardVO);
		return boardVO.getBno();
	}

	@Override
	public BoardVO read(Integer bno) throws Exception {
		return session.selectOne(NAMESPACE+".read", bno);
	}

	@Override
	public void modify(BoardVO boardVO) throws Exception {
		session.update(NAMESPACE+".update",boardVO);
	}

	@Override
	public void remove(Integer bno) throws Exception {
		session.delete(NAMESPACE+".delete", bno);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return session.selectList(NAMESPACE+".listAll");
	}

	@Override
	public List<BoardVO> listPage(int page) throws Exception {
		if(page <= 0){
			page = 1;
		}
		page = (page -1) * 10;
		return session.selectList(NAMESPACE+".listPage", page);
	}

	@Override
	public List<BoardVO> listCriteria(SearchCriteria cri) throws Exception {
		return session.selectList(NAMESPACE+".listCriteria", cri);
	}

	@Override
	public int countPaging(SearchCriteria cri) throws Exception {
		return session.selectOne(NAMESPACE+".countPaging", cri);
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(NAMESPACE+".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(NAMESPACE+".listSearchCount", cri);
	}

	@Override
	public void addAttach(FileVO file) throws Exception {
		session.insert(NAMESPACE+".addAttach", file);
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		return session.selectList(NAMESPACE + ".getAttach", bno);
	}

	@Override
	public void deleteAttach(Integer bno) throws Exception {
		session.delete(NAMESPACE+".deleteAttach", bno);
		
	}

	@Override
	public void replaceAttach(String fullName, Integer bno) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("bno",  bno);
		paramMap.put("fullName",  fullName);
		
		session.insert(NAMESPACE+".replaceAttach", paramMap);
		
	}
	@Override
	public void addViewCnt(Integer bno) throws Exception{
		session.update(NAMESPACE+".addViewCnt", bno);
	}

	@Override
	public String readAttach(int bno) throws Exception {
		return session.selectOne(NAMESPACE+".readAttach",bno);
	}

	@Override
	public void account(UserVO userVO) throws Exception {
		session.insert(NAMESPACE+".account", userVO);
	}

	@Override
	public UserVO login(UserVO userVO) throws Exception {
		
		UserVO result = session.selectOne(NAMESPACE+".login",userVO);
		return result;
	}

	@Override
	public UserVO selectChk(UserVO userVO) throws Exception {
		
		return session.selectOne(NAMESPACE + ".selectChk",userVO);
	}

	@Override
	public void changeChk(UserVO userVO) throws Exception {
		session.update(NAMESPACE + ".changeChk", userVO);		
	}

	@Override
	public UserVO selectLogin(UserVO userVO) throws Exception {
		return session.selectOne(NAMESPACE + ".loginAjax", userVO);
	}

	@Override
	public void updateLogin(UserVO userVO) throws Exception {
		session.update(NAMESPACE + ".updateLogin", userVO); 
	}
	
}

