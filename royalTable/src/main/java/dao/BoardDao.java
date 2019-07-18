package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import logic.Board;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.BoardMapper."; 
	private Map<String,Object> param = new HashMap<String,Object>();
	
	public int count(String searchtype, String searchcontent) {
		String col1 = searchtype;
		String col2 = null;
		if(searchtype != null) {
			String[] cols = searchtype.split(",");
			col1=cols[0];
			if(cols.length == 2) {
				col2 = cols[1];
			}
		}
		param.clear();
		param.put("searchtype", col1);
		param.put("searchcontent", searchcontent);
		param.put("col2", col2);
		return sqlSession.selectOne(NS+"count",param);
	}

	public List<Board> list(int pageNum, int limit, String searchtype, String searchcontent) {
		String col1 = searchtype;
		String col2 = null;
		if(searchtype != null) {
			String[] cols = searchtype.split(",");
			col1=cols[0];
			if(cols.length == 2) {
				col2 = cols[1];
			}
		}
		param.clear();
		param.put("startrow", (pageNum-1) * limit);
		param.put("limit", limit);
		param.put("searchtype", col1);
		param.put("searchcontent", searchcontent);
		param.put("col2", col2);
		return sqlSession.selectList(NS+"list",param);
	}

	public void cntadd(Integer boardNo) {
		sqlSession.getMapper(BoardMapper.class).cntadd(boardNo);
	}

	public Board selectone(Integer boardNo) {
		param.clear();
		param.put("boardNo", boardNo);
		return sqlSession.selectOne(NS+"list2",param);
	}

	public int maxBoardNo() {
		return sqlSession.getMapper(BoardMapper.class).maxBoardNo();
	}

	public void insert(Board board) {
		sqlSession.getMapper(BoardMapper.class).insert(board);
	}

	public void updateReflevel(Board b1) {
		sqlSession.getMapper(BoardMapper.class).updateReflevel(b1);
	}
	
	public void update(Board board) {
		sqlSession.getMapper(BoardMapper.class).update(board);
	}

	public void delete(Board board) {
		sqlSession.getMapper(BoardMapper.class).delete(board);
	}

}
