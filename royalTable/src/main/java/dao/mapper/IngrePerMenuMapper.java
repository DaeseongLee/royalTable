package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.IngrePerMenu;

public interface IngrePerMenuMapper {

	@Insert("insert into ingrepermenu (ingreNo, menuNo, ifMain, one, two, amount, three, four) " + 
			" values ( #{ingreNo}, #{menuNo}, #{ifMain}, #{one}, #{two}, #{amount}, #{three}, #{four})")
	void insert(IngrePerMenu iPM);

	@Select("")
	void listOne(Integer ingreNo);

}
