package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import logic.User;

public interface UserMapper {

	@Insert("insert into user (userid, password, name, gender, phonenum, address, email)"
			+ " values(#{userId}, #{password}, #{name}, #{gender}, #{phoneNum}, #{address}, #{email})")
	void insert(User user);

	@Update("update user set name=#{name}, phonenum=#{phoneNum}, "
				+ "address=#{address}, email=#{email} where userid=#{userId}")
	void update(User user);
	
	@Delete("delete from user where userid=#{userId}")
	void delete(User user);
	
	
}
