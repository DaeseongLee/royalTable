package logic;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;


public class Menu {
	private Integer menuNo;
	@NotEmpty(message="재료명을 입력하세요.")
	private String menuName;
	@NotNull(message="가격을 입력하세요.")
	private Integer mprice;
	@NotEmpty(message="내용을 입력하세요.")
	private String content;
	@NotEmpty(message="카테고리를 입력하세요.")
	private String category;
	private String star;
	private MultipartFile img; // 파일의 내용 저장 객체 
	private String imgurl; 
	
	// ingrepermenu
	private Integer ingreNo;
	@NotNull(message="주재료 여부를 선택하세요")
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
