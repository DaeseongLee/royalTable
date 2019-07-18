package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import logic.Cart;


@Repository
public class CartDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.CartMapper.";
	private Map<String,Object> param = new HashMap<String,Object>();
	
	public List<Cart> list() {
		return sqlSession.selectList(NS+"list");
	}
	
}
