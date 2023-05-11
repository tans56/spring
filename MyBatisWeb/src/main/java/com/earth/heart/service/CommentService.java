package com.earth.heart.service;

import java.util.List;

import com.earth.heart.domain.CommentDTO;

public interface CommentService {

	List<CommentDTO> getlist(Integer bno) throws Exception;
	int remove(Integer cno, Integer bno, String commenter) throws Exception;
	int write(CommentDTO CommentDTO) throws Exception;
	int modify(CommentDTO dto) throws Exception;
}
