package dao.mapper;

import org.apache.ibatis.annotations.Insert;

import logic.OrderMenu;

public interface orderMenuMapper {

	@Insert("insert into ordermenu (no, menuNo, buyNo, amount, toPrice) " 
			+ " values (#{no}, #{menuNo}, #{buyNo}, #{amount}, #{toPrice})")
	void insert(OrderMenu orderMenu);
	
}
