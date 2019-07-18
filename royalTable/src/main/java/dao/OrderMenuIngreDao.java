package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.orderMenuIngreMapper;
import dao.mapper.orderMenuMapper;
import logic.OrderMenu;
import logic.OrderMenuIngre;

@Repository
public class OrderMenuIngreDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.orderMenuIngreMapper.";
	private Map<String,Object> param = new HashMap<String,Object>();
	
	public void insert(OrderMenuIngre ordermenuingre) {
		sqlSession.getMapper(orderMenuIngreMapper.class).insert(ordermenuingre);
	}
}
