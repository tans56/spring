package com.earth.heart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.earth.heart.dao.BoardDao;
import com.earth.heart.dao.CommentDao;
import com.earth.heart.domain.CommentDTO;

@Service
public class CommentServiceImpl implements CommentService {
	
	// 두개의 dao가 모두 DI가 되어야 함
	//@Autowired
	BoardDao boardDao;	
	//@Autowired
	CommentDao commentDao;
	
	//@Autowired	// 생성자주입으로 하는것이 더 안전함
	public CommentServiceImpl(BoardDao boardDao, CommentDao commentDao) {
		//super();
		this.boardDao = boardDao;
		this.commentDao = commentDao;
	}

	@Override
	public List<CommentDTO> getlist(Integer bno) throws Exception {
		
		return commentDao.selectAll(bno);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int remove(Integer cno, Integer bno, String commenter) throws Exception {
		int rowCnt = boardDao.updateCommentCnt(bno, -1);
		rowCnt = commentDao.delete(cno, bno, commenter);
		return rowCnt;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int write(CommentDTO CommentDTO) throws Exception {
		boardDao.updateCommentCnt(CommentDTO.getBno(), 1);
		return commentDao.insert(CommentDTO);
	}

	@Override
	public int modify(CommentDTO CommentDTO) throws Exception {
		// TODO Auto-generated method stub
		return commentDao.update(CommentDTO);
	}

}
