package dao.mapper;

import org.apache.ibatis.annotations.Insert;

import logic.OrderMenuIngre;

public interface orderMenuIngreMapper {

	@Insert("insert into ordermenuingre (no, menuName, ingreName, amount, price) "
			+ "values (#{no}, #{menuName}, #{ingreName}, #{amount}, #{price})")
	void insert(OrderMenuIngre ordermenuingre);

}
