package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Ingre;

public interface IngreMapper {
	@Select("select ifnull(max(ingreNo),0) from ingre")
	int maxno();
	
	@Insert("insert into ingre (ingreNo, ingreName, currentAmount, unit, price, dateReceipt) " + 
			" values ( #{ingreNo}, #{ingreName}, #{currentAmount}, #{unit}, #{price}, now())")
	void insert(Ingre ingre);

	@Update("update ingre set ingreName= #{ingreName}, currentAmount= #{currentAmount}, unit= #{unit}, price= #{price},dateReceipt= #{dateReceipt} " + 
			" where ingreNo= #{ingreNo}")
	void update(Ingre ingre);

	@Delete("delete from ingre where ingreNo= #{ingreNo}")
	void delete(Integer id);
	
}
