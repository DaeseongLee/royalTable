package logic;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;


public class Menu {
	private Integer menuNo;
	@NotEmpty(message="������ �Է��ϼ���.")
	private String menuName;
	@NotNull(message="������ �Է��ϼ���.")
	private Integer mprice;
	@NotEmpty(message="������ �Է��ϼ���.")
	private String content;
	@NotEmpty(message="ī�װ��� �Է��ϼ���.")
	private String category;
	private String star;
	private MultipartFile img; // ������ ���� ���� ��ü 
	private String imgurl; 
	
	// ingrepermenu
	private Integer ingreNo;
	@NotNull(message="����� ���θ� �����ϼ���")
	private Integer ifMain;
	@NotNull(message="1�ܰ� ���� �����ϼ���.")
	private Integer one;
	@NotNull(message="2�ܰ� ���� �����ϼ���.")
	private Integer two;
	@NotNull(message="�⺻���� �����ϼ���.")
	private Integer amount;
	@NotNull(message="3�ܰ� ���� �����ϼ���.")
	private Integer three;
	@NotNull(message="4�ܰ� ���� �����ϼ���.")
	private Integer four;
	
	private List<Ingre> ingrelist = new ArrayList<Ingre>();
	
	//getter,setter,toString

	public Integer getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(Integer menuNo) {
		this.menuNo = menuNo;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public Integer getMprice() {
		return mprice;
	}
	public void setMprice(Integer mprice) {
		this.mprice = mprice;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public MultipartFile getImg() {
		return img;
	}
	public void setImg(MultipartFile img) {
		this.img = img;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	
	// ingrepermenu 
	public Integer getIngreNo() {
		return ingreNo;
	}
	public void setIngreNo(Integer ingreNo) {
		this.ingreNo = ingreNo;
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
	public List<Ingre> getIngrelist() {
		return ingrelist;
	}
	public void setIngrelist(List<Ingre> ingrelist) {
		this.ingrelist = ingrelist;
	}
	
	@Override
	public String toString() {
		return "Menu [menuNo=" + menuNo + ", menuName=" + menuName + ", mprice=" + mprice + ", content=" + content
				+ ", category=" + category + ", star=" + star + ", img=" + img + ", imgurl=" + imgurl + ", ingreNo="
				+ ingreNo + ", ifMain=" + ifMain + ", one=" + one + ", two=" + two + ", amount=" + amount + ", three="
				+ three + ", four=" + four + ", ingrelist=" + ingrelist + "]";
	}
}
