package org.single.service;

import java.util.List;

import javax.inject.Inject;

import org.single.domain.ReplyVO;
import org.single.domain.SearchCriteria;
import org.single.persistence.ReplyDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReplyServiceImpl implements ReplyService{
	@Inject
	private ReplyDAO dao;
	@Override
	public void addReply(ReplyVO replyVO) throws Exception {
		System.out.println(replyVO.toString());
		dao.create(replyVO);
	}
	
	@Override
	public List<ReplyVO> listReply(Integer bno) throws Exception {
		return dao.list(bno);
	}

	@Override
	public void modifyReply(ReplyVO replyVO) throws Exception {
		dao.update(replyVO);
	}

	@Override
	public void removeReply(Integer rno) throws Exception {
		dao.delete(rno);
	}

	@Override
	public List<ReplyVO> listReplyPage(Integer bno, SearchCriteria cri) throws Exception {
		return dao.listPage(bno, cri);
	}

	@Override
	public int count(Integer bno) throws Exception {
		return dao.count(bno);
	}
}
