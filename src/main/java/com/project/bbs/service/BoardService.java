package com.project.bbs.service;

import java.util.List;

import com.project.bbs.domain.BoardVo;
import com.project.bbs.domain.CommentVo;
import com.project.bbs.domain.DiaryVo;

public interface BoardService {
	
	public void commentRemove(int cno) throws Exception;
	
	public List<CommentVo> commentList() throws Exception;
	
	public void commentInsert(CommentVo vo) throws Exception;
	
	public String secretDiary(String writer) throws Exception;
	
	public void diaryInsert(DiaryVo vo) throws Exception;

	 public List<BoardVo>list() throws Exception; 
	 
	 public void write(BoardVo vo) throws Exception;
	 
	// 게시물 조회
	 public BoardVo view(int bno) throws Exception;
	 
	 public void viewCnt(int bno) throws Exception;
	 
	// 게시물 수정
	 public void modify(BoardVo vo) throws Exception;
	 
	// 게시물 삭제
	 public void delete(int bno) throws Exception;
	 	 
	// 게시물 총 갯수
	 public int count() throws Exception;
	 
	// 게시물 목록 + 페이징
	 public List<BoardVo> listPage(int displayPost, int postNum) throws Exception;

}
