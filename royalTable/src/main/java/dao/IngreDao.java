package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.IngreMapper;
import logic.Ingre;

@Repository
public class IngreDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.IngreMapper.";
	private Map<String,Object> param = new HashMap<String,Object>();
	
	public List<Ingre> list(){ //Item list만 가지고 있기 때문에 mapper를 private로 지정해놈.
		return sqlSession.selectList(NS+"list");
	}
	public Ingre selectOne(Integer id) {
		param.clear();
		param.put("id", id);
		return sqlSession.selectOne(NS+"list",param);
	}
	public void insert(Ingre ingre) {
		param.clear();
		int no = sqlSession.getMapper(IngreMapper.class).maxno();
		ingre.setIngreNo(++no); // 새로운 상품 ID 설정
		sqlSession.getMapper(IngreMapper.class).insert(ingre);
	}
	public void update(Ingre ingre) {
		sqlSession.getMapper(IngreMapper.class).update(ingre);
	}
	public void delete(Integer no) {
		param.clear();
		param.put("ingreNo", no);
		sqlSession.getMapper(IngreMapper.class).delete(no);
	}
	public int count(String searchtype, String searchcontent) {
		param.clear();
		param.put("searchtype", searchtype);
		param.put("searchcontent", searchcontent);
		return sqlSession.selectOne(NS + "count",param);
	}
	public List<Ingre> list(Integer pageNum, int limit, String searchtype, String searchcontent) {
		param.clear();
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit", limit);
		param.put("searchtype", searchtype);
		param.put("searchcontent", searchcontent);
		return sqlSession.selectList(NS+"list",param);
	}
}
