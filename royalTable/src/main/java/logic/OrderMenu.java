package logic;

public class OrderMenu {
	private int no;	//�ֹ��޴���ȣ
	private int menuNo;	//�޴���ȣ
	private int buyNo;	//�ֹ���ȣ
	private int amount;	//�ֹ���
	private int toPrice;	//���ֹ��ݾ�
	private Menu menu;	
	
//	public orderMenu() {}
//	public orderMenu(int no, int menuNo, int buyNo) {
//		this.no = no;
//		this.menuNo = menuNo;
//		this.buyNo = buyNo;
//		//����, ��ǰid, ��ǰ
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
