package logic;

public class Cart {
	
	private int no;
	private User user;
	private int menuNo;
	private String menuName;
	private int quantity;
	private int price;
	private String content;
	private String imgurl;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	
	@Override
	public String toString() {
		return "Cart [no=" + no + ", user=" + user + ", menuNo=" + menuNo + ", menuName=" + menuName + ", quantity="
				+ quantity + ", price=" + price + ", content=" + content + ", imgurl=" + imgurl + "]";
	}
	
}
