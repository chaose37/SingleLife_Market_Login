package org.single.persistence;

import java.util.List;

import org.single.domain.ReplyVO;
import org.single.domain.SearchCriteria;

public interface ReplyDAO {
	
	public List<ReplyVO> list(Integer bno) throws Exception;
	public void create(ReplyVO replyVO) throws Exception;
	public void update(ReplyVO replyVO) throws Exception;
	public void delete(Integer Bno) throws Exception;
	
	public List<ReplyVO> listPage(Integer bno, SearchCriteria cri) throws Exception;
	public int count (Integer bno) throws Exception;

}