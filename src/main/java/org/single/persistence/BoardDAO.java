package org.single.persistence;

import java.util.List;

import org.single.domain.BoardVO;
import org.single.domain.FileVO;
import org.single.domain.SearchCriteria;
import org.single.domain.UserVO;

public interface BoardDAO {
	public int regist(BoardVO boardVO) throws Exception;

	public BoardVO read(Integer bno) throws Exception;

	public void modify(BoardVO boardVO) throws Exception;

	public void remove(Integer bno) throws Exception;

	public List<BoardVO> listAll() throws Exception;

	public List<BoardVO> listPage(int page) throws Exception;

	public List<BoardVO> listCriteria(SearchCriteria cri) throws Exception;

	public int countPaging(SearchCriteria cri) throws Exception;

	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public void addAttach(FileVO file) throws Exception;

	public List<String> getAttach(Integer bno) throws Exception;

	public void deleteAttach(Integer bno) throws Exception;

	public void replaceAttach(String fullName, Integer bno) throws Exception;

	public void addViewCnt(Integer bno) throws Exception;

	public String readAttach(int bno) throws Exception;

	public void account(UserVO userVO) throws Exception;

	public UserVO login(UserVO userVO) throws Exception;

	public UserVO selectChk(UserVO userVO) throws Exception;

	public void changeChk(UserVO result) throws Exception;

	public UserVO selectLogin(UserVO userVO) throws Exception;

	public void updateLogin(UserVO userVO) throws Exception;
}
