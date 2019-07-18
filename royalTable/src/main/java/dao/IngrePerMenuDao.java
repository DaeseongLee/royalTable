package dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.IngrePerMenuMapper;
import logic.IngrePerMenu;

@Repository
public class IngrePerMenuDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.IngrePerMenuMapper.";
	private Map<String,Object> param = new HashMap<String,Object>();
	
	public void insert(IngrePerMenu iPM) {
		sqlSession.getMapper(IngrePerMenuMapper.class).insert(iPM);
	}

	public List<IngrePerMenu> list() {
		return sqlSession.selectList(NS+"list",param);
	}
}
