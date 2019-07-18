package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Buyerinfo;

public interface buyerinfoMapper {
	
	@Insert("insert into buyerinfo (buyNo, userId, recipientName, recipientAddress, recipientPhoneNum, "
			+ " orderDate, deliveryDate, status) " 
			+ " values (#{buyNo}, #{userId}, #{recipientName}, #{recipientAddress}, #{recipientPhoneNum}, #{orderDate}, #{delieveryDate}, #{status}")
	void insert(Buyerinfo buyerinfo);

	@Select("select ifnull(max(buyNo),0) from buyerinfo")
	int maxbuyNo();
	
}
