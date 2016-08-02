package org.single.service;

import java.util.List;

import javax.inject.Inject;

import org.single.domain.BoardVO;
import org.single.domain.FileVO;
import org.single.domain.SearchCriteria;
import org.single.domain.UserVO;
import org.single.persistence.BoardDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BoardServiceImpl implements BoardService{
	@Inject
	private BoardDAO dao;
	@Transactional
	@Override
	public void regist(BoardVO boardVO) throws Exception {
		int bno = dao.regist(boardVO);
		System.out.println(boardVO.toString());
  		String[] files = boardVO.getFiles();
		if(files == null) { return;}
		for(String fileName : files){
			FileVO file = new FileVO();
			file.setBno(bno);
			file.setFullname(fileName);
			dao.addAttach(file);
			System.out.println(fileName);
		}
	}

	@Override
	public BoardVO read(Integer bno) throws Exception {
		dao.addViewCnt(bno);
		BoardVO vo = dao.read(bno);
		return vo;
	}

	@Override
	public void modify(BoardVO boardVO) throws Exception {
		dao.modify(boardVO);
		
		Integer bno = boardVO.getBno();
		
		dao.deleteAttach(bno);
		
		String[] files = boardVO.getFiles();
		
		if(files == null){ return;}
		
		for(String fileName : files){
			dao.replaceAttach(fileName, bno);
		}
	}
	
	@Transactional
	@Override
	public void remove(Integer bno) throws Exception {
		dao.deleteAttach(bno);
		dao.remove(bno);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<BoardVO> listCriteria(SearchCriteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(SearchCriteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		
		List<BoardVO> list = dao.listSearch(cri);
		for(int i=0; i<list.size(); i++)
		{
			int bno = list.get(i).getBno();
			List<String> fList = dao.getAttach(bno);
			String[] files = fList.toArray(new String[fList.size()]);
			list.get(i).setFiles(files);
		}
		return list;
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		return dao.getAttach(bno);
	}

	@Override
	public void account(UserVO userVO) throws Exception {
		dao.account(userVO);
		
	}

	@Override
	public UserVO login(UserVO userVO) throws Exception {
		UserVO result = dao.login(userVO);
		return result;
	}

	@Override
	public String changeChk(UserVO userVO) throws Exception {
		System.out.println(1);
		UserVO result = dao.selectChk(userVO);
		System.out.println(result);
		if(result == null) {
			return "fail";
		} else {
			result.setChk("ok");
			System.out.println("result : " + result);
			dao.changeChk(result);
			return "success";
		}
	}

	@Override
	public UserVO loginAjax(UserVO userVO) throws Exception {
		UserVO result = dao.selectLogin(userVO);
		System.out.println("result : " + result);
		return result;
	}

	@Override
	public void updateAjax(UserVO userVO) throws Exception {
		System.out.println("result : " + userVO.toString());
		dao.updateLogin(userVO);
	}

}
