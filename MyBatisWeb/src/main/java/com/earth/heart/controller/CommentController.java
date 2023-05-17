package com.earth.heart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.earth.heart.domain.CommentDTO;
import com.earth.heart.service.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	CommentService service;
	
	@PatchMapping("/comments/{cno}")
	public ResponseEntity<String> modify(@PathVariable Integer cno, @RequestBody CommentDTO dto, HttpSession session){
		String commenter = (String) session.getAttribute("id");
		
		dto.setcommenter(commenter);
		dto.setBno(cno);
		
		try {
			if(service.modify(dto) != 1) 
				throw new Exception("Update Failed");
			return new ResponseEntity<String>("MOD_OK",HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
		}
		
		
	}
	
	//댓글 등록
	@PostMapping("/comments")
	public ResponseEntity<String> write(@RequestBody CommentDTO dto, Integer bno, HttpSession session) {
		String commenter = (String) session.getAttribute("id");
		
		dto.setcommenter(commenter);
		dto.setBno(bno);
		System.out.println("dto = " + dto);
		
		try {
			if(service.write(dto) != 1) 
				throw new Exception("write Failed");
			return new ResponseEntity<String>("WRT_OK",HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
		}
		
	}
	
	//지정된 댓글 삭제하는 메서드
	@DeleteMapping("/comments/{cno}")
	public ResponseEntity<String> remove(@PathVariable Integer cno, Integer bno, HttpSession session) {
		String commenter =  (String) session.getAttribute("id");
		
		try {
			int rowCnt = service.remove(cno, bno, commenter);
			
			if(rowCnt != 1)
				throw new Exception("Delete Failed");
			
			return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("DEL_ERR", HttpStatus.BAD_REQUEST);
		}
		
		
	}
	
	//지정된 게시물의 모든 댓글을 가져오는 메서드
	@GetMapping("/comments")
	@ResponseBody
	public ResponseEntity<List<CommentDTO>> list(Integer bno) {
		List<CommentDTO> list = null;
		
		try {
			list = service.getlist(bno);
			return new ResponseEntity<List<CommentDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<CommentDTO>>(HttpStatus.BAD_REQUEST);
		}
		
		//return list;
	}
	
	
}
