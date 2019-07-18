package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Menu;

public interface MenuMapper {
	@Select("select ifnull(max(menuNo),0) from menu")
	int maxno();
	
	@Insert("insert into menu (menuName, mprice, content, category, star, img) " + 
			" values (#{menuName}, #{mprice}, #{content}, #{category}, 0, #{imgurl})")
	void insert(Menu menu);

	@Update("update menu set menuName= #{menuName}, mprice= #{mprice}, content= #{content}, category= #{category},img= #{imgurl} " + 
			" where menuNo= #{menuNo}")
	void update(Menu menu);

	@Delete("delete from menu where menuNo= #{menuNo}")
	void delete(Integer id);

	@Insert("insert into ingrepermenu (ingreNo, ifnull(menuNo,1), ifMain, one, two, amount, three, four) " + 
			" values ( #{ingreNo}, #{menuNo}, #{ifMain}, #{one}, #{two}, #{amount}, #{three},  #{four})")
	void insertIPM(Menu menu);

}
