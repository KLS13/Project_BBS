package com.project.bbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bbs.domain.BoardVo;
import com.project.bbs.domain.CommentVo;
import com.project.bbs.domain.DiaryVo;
import com.project.bbs.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Inject
	BoardService service;

	
	@RequestMapping(value="/secretDiary")
	public void getsecretDiary( )throws Exception{

		
	}
	

	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWirte() throws Exception {

	}

	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWirte(BoardVo vo) throws Exception {
		
		service.write(vo);

		return "redirect:/board/listPage?num=1";
	}
	
	// 게시물 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {
		
		BoardVo vo = service.view(bno);
		service.viewCnt(bno);
		model.addAttribute("view",vo);
	}
	
	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {

	 BoardVo vo = service.view(bno);
	   
	 model.addAttribute("view", vo);
	}
	
	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(BoardVo vo) throws Exception {

	 service.modify(vo);
	   
	 return "redirect:/board/view?bno=" + vo.getBno();
	}
	
	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("bno") int bno) throws Exception {
	  
	 service.delete(bno);  

	 return "redirect:/board/listPage?num=1";
	}

	
	@RequestMapping(value="/diaryList")
    @ResponseBody
    public String diaryList(HttpServletRequest request, Model model)throws Exception{
		
		String writer = request.getParameter("writer");
		return service.secretDiary(writer);
		
	}
	
	@RequestMapping(value="/diaryInsert")
	@ResponseBody
	public String diaryInsert(@ModelAttribute("DiaryVo") DiaryVo vo) throws Exception{
		
		try {
			service.diaryInsert(vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return "YES";
		
	}
	
	@RequestMapping(value="/commentInsert")
	@ResponseBody
	public String commentInsert(@ModelAttribute("CommentVo") CommentVo vo) throws Exception{
		
		try {
			service.commentInsert(vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "YES";
	}
	
	@RequestMapping(value="/commentRemove")
	@ResponseBody
	public String commentList(HttpServletRequest request, @RequestParam("cno") int cno) throws Exception{
		
		try {
			service.commentRemove(cno);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "YES";
		
	}
	
	
	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {
	 
	 // 게시물 총 갯수
	 int count = service.count();
	  
	 // 한 페이지에 출력할 게시물 갯수
	 int postNum = 10;
	  
	 // 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
	 int pageNum = (int)Math.ceil((double)count/postNum);
	  
	 // 출력할 게시물
	 int displayPost = (num - 1) * postNum;
	    
	// 한번에 표시할 페이징 번호의 갯수
	 int pageNum_cnt = 10;

	 // 표시되는 페이지 번호 중 마지막 번호
	 int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);

	 // 표시되는 페이지 번호 중 첫번째 번호
	 int startPageNum = endPageNum - (pageNum_cnt - 1);
	 
	// 마지막 번호 재계산
	 int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));
	  
	 if(endPageNum > endPageNum_tmp) {
	  endPageNum = endPageNum_tmp;
	 }
	 
	 boolean prev = startPageNum == 1 ? false : true;
	 boolean next = endPageNum * pageNum_cnt >= count ? false : true;
	 
	 List<BoardVo> list = null; 
	 list = service.listPage(displayPost, postNum);
	 model.addAttribute("list", list);   
	 model.addAttribute("pageNum", pageNum);
	 
	// 시작 및 끝 번호
	 model.addAttribute("startPageNum", startPageNum);
	 model.addAttribute("endPageNum", endPageNum);

	 // 이전 및 다음 
	 model.addAttribute("prev", prev);
	 model.addAttribute("next", next);
	 
	// 현재 페이지
	 model.addAttribute("select", num);
	}
}