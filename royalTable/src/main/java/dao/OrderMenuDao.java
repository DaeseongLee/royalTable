package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.orderMenuMapper;
import logic.OrderMenu;

@Repository
public class OrderMenuDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.OrderMenuMapper.";
	private Map<String,Object> param = new HashMap<String,Object>();
	
	public void insert(OrderMenu orderMenu) {
		sqlSession.getMapper(orderMenuMapper.class).insert(orderMenu);
	}
	
}