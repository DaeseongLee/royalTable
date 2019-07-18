package logic;

public class OrderMenu {
	private int no;	//주문메뉴번호
	private int menuNo;	//메뉴번호
	private int buyNo;	//주문번호
	private int amount;	//주문량
	private int toPrice;	//총주문금액
	private Menu menu;	
	
//	public orderMenu() {}
//	public orderMenu(int no, int menuNo, int buyNo) {
//		this.no = no;
//		this.menuNo = menuNo;
//		this.buyNo = buyNo;
//		//수량, 제품id, 제품
//	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public int getBuyNo() {
		return buyNo;
	}
	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getToPrice() {
		return toPrice;
	}
	public void setToPrice(int toPrice) {
		this.toPrice = toPrice;
	}
	
}
