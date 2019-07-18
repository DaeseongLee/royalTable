package controller;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
@RequestMapping("item")
public class ItemController {
 

 @RequestMapping("detail")
 public ModelAndView list() {
	 ModelAndView mav = new ModelAndView();
	 
	 return mav;
 }


}