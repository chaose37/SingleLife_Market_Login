package org.single.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.single.domain.ReplyVO;
import org.single.domain.SearchCriteria;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl implements ReplyDAO{

	@Inject
	private SqlSessionTemplate session;
	private static String NAMESPACE = "org.single.mapper.ReplyMapper";
	
	@Override
	public List<ReplyVO> list(Integer bno) throws Exception {
		return session.selectList(NAMESPACE+".list", bno);
	}

	@Override
	public void create(ReplyVO replyVO) throws Exception {
		session.insert(NAMESPACE+".create", replyVO);
	}

	@Override
	public void update(ReplyVO replyVO) throws Exception {
		session.update(NAMESPACE+".update", replyVO);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(NAMESPACE+".delete", bno);
	}

	@Override
	public List<ReplyVO> listPage(Integer bno, SearchCriteria cri) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("bno", bno);
		paramMap.put("cri", cri);
		
		return session.selectList(NAMESPACE+".listPage", paramMap);
	}

	@Override
	public int count(Integer bno) throws Exception {
		return session.selectOne(NAMESPACE+".count", bno);
	}

}