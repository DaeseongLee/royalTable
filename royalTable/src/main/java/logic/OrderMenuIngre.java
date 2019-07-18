package logic;

public class OrderMenuIngre {
	private int no;	//주문메뉴번호
	private String menuName;	//메뉴이름
	private String ingreName;	//재료이름	
	private int amount;	//재료수량
	private int price;	//재료단가
//	private Ingre ingre;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getIngreName() {
		return ingreName;
	}
	public void setIngreName(String ingreName) {
		this.ingreName = ingreName;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
}
