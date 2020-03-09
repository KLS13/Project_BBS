package com.project.bbs;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.bbs.domain.CommentVo;
import com.project.bbs.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	BoardService service;
	
	@RequestMapping(value = "")
	public String home(Model model) throws Exception {

		List<CommentVo> list = service.commentList();
		model.addAttribute("list", list);
		
		return "home";
	}
	
}
