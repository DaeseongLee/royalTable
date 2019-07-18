package logic;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;


public class Ingre {
	private Integer ingreNo;
	@NotEmpty(message="������ �Է��ϼ���.")
	private String ingreName;
	@NotNull(message="������ �Է��ϼ���.")
	@Min(value=1,message="������ 1�̻� �����մϴ�.")
	private Integer currentAmount;
	@NotEmpty(message="(gram,ml,��)������ �Է��ϼ���.")
	private String unit;
	@NotNull(message="������ �Է��ϼ���.")
	private Integer price;
	private Date dateReceipt;
	
	private List<IngrePerMenu> IPMlist = new ArrayList<IngrePerMenu>();
	
	//getter,setter,toString
	public Integer getIngreNo() {
		return ingreNo;
	}
	public void setIngreNo(Integer ingreNo) {
		this.ingreNo = ingreNo;
	}
	public String getIngreName() {
		return ingreName;
	}
	public void setIngreName(String ingreName) {
		this.ingreName = ingreName;
	}
	public Integer getCurrentAmount() {
		return currentAmount;
	}
	public void setCurrentAmount(Integer currentAmount) {
		this.currentAmount = currentAmount;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Date getDateReceipt() {
		return dateReceipt;
	}
	public void setDateReceipt(Date dateReceipt) {
		this.dateReceipt = dateReceipt;
	}
	
	public List<IngrePerMenu> getIPMlist() {
		return IPMlist;
	}
	public void setIPMlist(List<IngrePerMenu> iPMlist) {
		IPMlist = iPMlist;
	}

	
	@Override
	public String toString() {
		return "Ingre [ingreNo=" + ingreNo + ", ingreName=" + ingreName + ", currentAmount=" + currentAmount + ", unit="
				+ unit + ", price=" + price + ", dateReceipt=" + dateReceipt + "]";
	}

	
}
