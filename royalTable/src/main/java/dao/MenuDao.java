package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.MenuMapper;
import logic.Ingre;
import logic.Menu;

@Repository
public class MenuDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.MenuMapper.";
	private Map<String,Object> param = new HashMap<String,Object>();
	
	public List<Menu> list(){ //Item list만 가지고 있기 때문에 mapper를 private로 지정해놈.
		return sqlSession.selectList(NS+"list");
	}
	public Menu selectOne(Integer id) {
		param.clear();
		param.put("id", id);
		return sqlSession.selectOne(NS+"list",param);
	}
	public void insert(Menu menu) {
		int no = sqlSession.getMapper(MenuMapper.class).maxno();
		menu.setMenuNo(++no); 
		sqlSession.getMapper(MenuMapper.class).insert(menu);
	}
	public void update(Menu menu) {
		sqlSession.getMapper(MenuMapper.class).update(menu);
	}
	public void delete(Integer no) {
		param.clear();
		param.put("menuNo", no);
		sqlSession.getMapper(MenuMapper.class).delete(no);
	}
	public int count(String searchtype, String searchcontent) {
		param.clear();
		param.put("searchtype", searchtype);
		param.put("searchcontent", searchcontent);
		return sqlSession.selectOne(NS + "count",param);
	}
	public List<Menu> list(Integer pageNum, int limit, String searchtype, String searchcontent) {
		param.clear();
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit", limit);
		param.put("searchtype", searchtype);
		param.put("searchcontent", searchcontent);
		return sqlSession.selectList(NS+"list",param);
	}
	public void insertIPM(Menu menu) {
		param.clear();
		sqlSession.getMapper(MenuMapper.class).insert(menu);
		sqlSession.getMapper(MenuMapper.class).insertIPM(menu);
	}
	public int maxNo() {
		return sqlSession.getMapper(MenuMapper.class).maxno();
	}
}
