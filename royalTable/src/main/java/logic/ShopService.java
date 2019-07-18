package logic;

import java.io.File;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardDao;
import dao.IngreDao;
import dao.MenuDao;
import dao.UserDao;

@Service
public class ShopService {
	@Autowired
	private IngreDao ingreDao;
	@Autowired
	private MenuDao menuDao;
	@Autowired
	private BoardDao boardDao;

	public List<Ingre> getIngreList() {
		return ingreDao.list();
	}

	public Ingre getIngreById(Integer no) {
		return ingreDao.selectOne(no);
	}

//	public void itemCreate(Ingre item, HttpServletRequest request) {
//		if(item.getPicture() != null && !item.getPicture().isEmpty()) {
//			uploadFileCreate(item.getPicture(),request,"item/img/");
//			item.setPictureUrl(item.getPicture().getOriginalFilename());
//		}
//		itemDao.insert(item);
//	}
	private void uploadFileCreate(MultipartFile picture, HttpServletRequest request, String path) {
		// 업로드된 실제 파일의 이름
		String orgFile = picture.getOriginalFilename();
		// D:\20190211\spring\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\shop3\item\img
		// 위치에 이미지파일 저장
		System.out.println(path);
		//path: ingre/img/
		String uploadPath = request.getServletContext().getRealPath("/") + path;
		File fpath = new File(uploadPath);
		if (!fpath.exists())
			fpath.mkdirs();
		try {
			// 업로드 파일 생성하기
			picture.transferTo(new File(uploadPath + orgFile));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void ingreInsert(Ingre ingre, HttpServletRequest request) {
		ingreDao.insert(ingre);
	}
	
	public void ingreUpdate(Ingre ingre, HttpServletRequest request) {
		ingreDao.update(ingre);
	}

	public void ingredelete(Integer no) {
		ingreDao.delete(no);
	}

	public int ingrecount(String searchtype, String searchcontent) {
		return ingreDao.count(searchtype, searchcontent);
	}

	public List<Ingre> ingrelist(Integer pageNum, int limit, String searchtype, String searchcontent) {
		return ingreDao.list(pageNum,limit,searchtype,searchcontent);
	}
	
	//===========================메뉴 =================================
	public List<Menu> getMenuList() {
		return menuDao.list();
	}
	
	public Menu getMenuById(Integer no) {
		return menuDao.selectOne(no);
	}
	
	public int menucount(String searchtype, String searchcontent) {
		return menuDao.count(searchtype, searchcontent);
	}

	public List<Menu> menulist(Integer pageNum, int limit, String searchtype, String searchcontent) {
		return menuDao.list(pageNum,limit,searchtype,searchcontent);
	}

	public void menuInsert(Menu menu, HttpServletRequest request) {
		System.out.println(menu);
		if(menu.getImg() != null && !menu.getImg().isEmpty()) {
			uploadFileCreate(menu.getImg(),request,"ingre/img/");
			menu.setImgurl(menu.getImg().getOriginalFilename());
		}
		menuDao.insert(menu);		
	}

	public List<Ingre> ingrelist() {
		return ingreDao.list();
	}

	public int maxNo() {
		return menuDao.maxNo();
	}

	//=========================== user =================================
	@Autowired //자료형을 기준으로 가져옴
	private UserDao userDao;
	
	public void userCreate(User user) {
		userDao.insert(user);
	}
	public User userSelect(String userId) {
		User user = userDao.selectOne(userId);
		return user;
	}
		
	public void update(User user) {
		userDao.update(user);
	}
	public void delete(User user) {
		userDao.delete(user);
	}
	public List<User> userList() {
		List<User> list = userDao.list();
		return list;
	}
	public List<User> userList(String[] idchks) {
		List<User> list = userDao.list(idchks);
		return list;
	}
	
	public int boardcount(String searchtype, String searchcontent) {
		return boardDao.count(searchtype, searchcontent);
	}
	
	public List<Board> boardlist(int pageNum, int limit, String searchtype, String searchcontent) {
		return boardDao.list(pageNum,limit,searchtype,searchcontent);
	}

	public Board getBoard(Integer boardNo, HttpServletRequest request) {
		if(request.getRequestURI().contains("detail")) {
			boardDao.cntadd(boardNo);
		}
		return boardDao.selectone(boardNo);
	}

	public void boardWrite(Board board) {
		int max = boardDao.maxBoardNo();
		board.setBoardNo(++max);
		boardDao.insert(board);
	}
	
	public void boardReply(Board board) {
		boardDao.updateReflevel(board);
		int max = boardDao.maxBoardNo();
		board.setBoardNo(++max);
		boardDao.insert(board);
	}
	
	public void boardUpdate(Board board) {
		boardDao.update(board);
	}

	public void boardDelete(Board board) {
		boardDao.delete(board);
	}

	
}