package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;

public interface BoardMapper {

	@Update("update board set cnt=cnt+1 where boardNo=#{boardNo}")
	void cntadd(Integer boardNo);

	@Select("select ifnull(max(boardNo),0) from board")
	int maxBoardNo();

	@Insert("insert into board (boardNo, userId, subject, content, type, reflevel, cnt, regDate) "
			+ " values(#{boardNo}, #{userId}, #{subject}, #{content}, #{type}, #{reflevel}, 0, now())")
	void insert(Board board);

	@Update("update board set reflevel=reflevel+1 where boardNo=#{boardNo}")
	void updateReflevel(Board b1);
	
	@Update("update board set userId=#{userId}, subject=#{subject}, content=#{content} where boardNo=#{boardNo}")
	void update(Board board);

	@Delete("delete from board where boardNo=#{boardNo}")
	void delete(Board board);

	


}
