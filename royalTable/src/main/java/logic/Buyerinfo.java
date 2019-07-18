package logic;

import java.util.Date;
import java.util.ArrayList;
import java.util.List;

public class Buyerinfo {
	private int buyNo; //�ֹ���ȣ
	private User user;	//�����
	private String recipientName;	//�޴»��
	private String recipientAddress;	//�޴��ּ�
	private int recipientPhoneNum;	//�޴»����ȣ
	private Date orderDate;		//�ֹ�����
	private Date deliveryDate;	//�������
	private String status; //��������
//	private List<orderMenu> menuList = new ArrayList<orderMenu>();
//	private List<orderMenuIngre> menuingreList = new ArrayList<orderMenuIngre>();
	
	public int getBuyNo() {
		return buyNo;
	}
	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getRecipientName() {
		return recipientName;
	}
	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}
	public String getRecipientAddress() {
		return recipientAddress;
	}
	public void setRecipientAddress(String recipientAddress) {
		this.recipientAddress = recipientAddress;
	}
	public int getRecipientPhoneNum() {
		return recipientPhoneNum;
	}
	public void setRecipientPhoneNum(int recipientPhoneNum) {
		this.recipientPhoneNum = recipientPhoneNum;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Date getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
