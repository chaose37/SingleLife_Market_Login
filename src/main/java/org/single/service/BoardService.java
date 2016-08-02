package org.single.service;

import java.util.List;

import org.single.domain.BoardVO;
import org.single.domain.SearchCriteria;
import org.single.domain.UserVO;


public interface BoardService {
	public void regist(BoardVO boardVO) throws Exception;
	public BoardVO read(Integer bno) throws Exception;
	public void modify(BoardVO boardVO) throws Exception;
	public void remove(Integer bno) throws Exception;
	public List<BoardVO> listAll() throws Exception;
	public List<BoardVO> listCriteria(SearchCriteria cri) throws Exception;
	public int listCountCriteria(SearchCriteria cri) throws Exception;
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
	public List<String> getAttach(Integer bno) throws Exception;
	public void account(UserVO userVO) throws Exception;
	public UserVO login(UserVO userVO) throws Exception;
	public String changeChk(UserVO userVO) throws Exception;
	public UserVO loginAjax(UserVO userVO) throws Exception;
	public void updateAjax(UserVO userVO) throws Exception;
	
}