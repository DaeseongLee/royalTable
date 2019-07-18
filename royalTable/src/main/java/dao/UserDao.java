package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.UserMapper;
import logic.User;

@Repository
public class UserDao {
	@Autowired //현재 내 컨테이너에 SqlSessionTemplate 클래스의 객체를 찾아서 나에게 전달
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.UserMapper."; 
	private Map<String,Object> param = new HashMap<String,Object>();
	
	public void insert(User user) {
		sqlSession.getMapper(UserMapper.class).insert(user);
	}
	public User selectOne(String userId) {
		param.clear();
		param.put("userId", userId);
		return sqlSession.selectOne(NS+"list",param);
	}
	public void update(User user) {
		sqlSession.getMapper(UserMapper.class).update(user);
	}
	public void delete(User user) {
		sqlSession.getMapper(UserMapper.class).delete(user);
	}
	public List<User> list() {
		return sqlSession.selectList(NS+"list");
	}
	public List<User> list(String[] idchks) {
		param.clear();
		param.put("idchks", idchks);
		return sqlSession.selectList(NS+"list",param);
	}
}
