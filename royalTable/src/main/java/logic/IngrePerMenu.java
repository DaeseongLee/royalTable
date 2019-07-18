package logic;

import javax.validation.constraints.NotNull;

public class IngrePerMenu {
	private Integer ingreNo;
	private Integer menuNo;
	private Integer ifMain;
	@NotNull(message="1단계 양을 지정하세요.")
	private Integer one;
	@NotNull(message="2단계 양을 지정하세요.")
	private Integer two;
	@NotNull(message="기본양을 지정하세요.")
	private Integer amount;
	@NotNull(message="3단계 양을 지정하세요.")
	private Integer three;
	@NotNull(message="4단계 양을 지정하세요.")
	private Integer four;
	
	private Ingre ingre;
	public IngrePerMenu() {}
	public IngrePerMenu(int ingreNo, int menuNo,int one,int two,int three,int four, Ingre ingreSet) {
		this.ingreNo = ingreNo;
		this.menuNo = menuNo;
		this.one = one;
		this.two = two;
		this.three = three;
		this.four = four;
		this.amount = ingreSet.getCurrentAmount();
	}
	
	//getter,setter,toString
	public Integer getIngreNo() {
		return ingreNo;
	}
	public void setIngreNo(Integer ingreNo) {
		this.ingreNo = ingreNo;
	}
	public Integer getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(Integer menuNo) {
		this.menuNo = menuNo;
	}
	public Integer getIfMain() {
		return ifMain;
	}
	public void setIfMain(Integer ifMain) {
		this.ifMain = ifMain;
	}
	public Integer getOne() {
		return one;
	}
	public void setOne(Integer one) {
		this.one = one;
	}
	public Integer getTwo() {
		return two;
	}
	public void setTwo(Integer two) {
		this.two = two;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Integer getThree() {
		return three;
	}
	public void setThree(Integer three) {
		this.three = three;
	}
	public Integer getFour() {
		return four;
	}
	public void setFour(Integer four) {
		this.four = four;
	}
	
	

	public Ingre getIngre() {
		return ingre;
	}
	public void setIngre(Ingre ingre) {
		this.ingre = ingre;
	}
	@Override
	public String toString() {
		return "IngrePerMenu [ingreNo=" + ingreNo + ", menuNo=" + menuNo + ", ifMain=" + ifMain + ", one=" + one
				+ ", two=" + two + ", amount=" + amount + ", three=" + three + ", four=" + four + "]";
	}
}
