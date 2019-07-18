package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import dao.mapper.buyerinfoMapper;
import logic.Buyerinfo;

public class buyerinfoDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.buyerInfoMapper.";
	private Map<String, Object> param = new HashMap<String, Object>();
	
	public int getMaxbuyNo() {
		int max = sqlSession.getMapper(buyerinfoMapper.class).maxbuyNo();
		return max + 1;
	}
	
	public void insert(Buyerinfo buyerinfo) {
		sqlSession.getMapper(buyerinfoMapper.class).insert(buyerinfo);
	}
}
