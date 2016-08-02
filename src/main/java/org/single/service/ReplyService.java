package org.single.service;

import java.util.List;

import org.single.domain.ReplyVO;
import org.single.domain.SearchCriteria;

public interface ReplyService {
	public void addReply(ReplyVO replyVO) throws Exception;
	public List<ReplyVO> listReply(Integer bno) throws Exception;
	public void modifyReply(ReplyVO replyVO) throws Exception;
	public void removeReply(Integer bno) throws Exception;
	
	public List<ReplyVO> listReplyPage(Integer bno, SearchCriteria Cri) throws Exception;
	public int count(Integer bno) throws Exception;
}

