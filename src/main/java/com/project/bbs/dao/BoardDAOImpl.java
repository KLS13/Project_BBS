package com.project.bbs.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.bbs.domain.BoardVo;
import com.project.bbs.domain.CommentVo;
import com.project.bbs.domain.DiaryVo;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.project.bbs.dao.mapper.board";

	@Override
	public List<BoardVo> list() throws Exception {

		return sql.selectList(namespace + ".list");
	}

	@Override
	public void write(BoardVo vo) throws Exception {

		sql.insert(namespace + ".write", vo);

	}

	@Override
	public BoardVo view(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".view", bno);
	}

	@Override
	public void modify(BoardVo vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".modify", vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		
		sql.delete(namespace + ".delete", bno);
	}

	@Override
	public int count() throws Exception {
		 return sql.selectOne(namespace + ".count"); 
	}

	@Override
	public List<BoardVo> listPage(int displayPost, int postNum) throws Exception {
		 HashMap<String, Integer> paging = new HashMap<String, Integer>();
		  
		 paging.put("displayPost", displayPost);
		 paging.put("postNum", postNum);
		  
		 return sql.selectList(namespace + ".listPage", paging);
		}

	@Override
	public void viewCnt(int bno) throws Exception {
		sql.update(namespace + ".viewCnt", bno);
		
	}

	@Override
	public void diaryInsert(DiaryVo vo) throws Exception {
		sql.insert(namespace + ".diaryInsert" , vo);
		
	}

	@Override
	public String secretDiary(String writer) throws Exception {
		
		 return sql.selectOne(namespace + ".secretDiary" , writer);
	}

	@Override
	public void commentInsert(CommentVo vo) throws Exception {
		
		sql.insert(namespace + ".commentInsert", vo);
		
	}

	@Override
	public List<CommentVo> commentList() throws Exception {

		return sql.selectList(namespace + ".commentList");
	}

	@Override
	public void commentRemove(int cno) throws Exception {
		
		sql.delete(namespace + ".commentRemove", cno);
		
	}

}
