package com.ottt.ottt.controller.workDetailPage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ottt.ottt.dto.CommentDTO;
import com.ottt.ottt.dto.ReviewDTO;
import com.ottt.ottt.service.review.ReviewService;

@Controller
public class DetailReplyController {
	
	@Autowired
	ReviewService reviewService;
	
	@GetMapping(value = "/detailPage/reply")
	public String reviewReply(Model m, HttpServletRequest request, HttpSession session,
			@RequestParam("content_no") int content_no, @RequestParam("review_no") int review_no) {
		Integer user_no = (Integer) session.getAttribute("user_no");
		
		try {
			ReviewDTO Review = reviewService.getReplyReview(content_no, review_no);
			List<CommentDTO> list = reviewService.getreply(review_no);
			int count = reviewService.getReplyCount(review_no);
			System.out.println(review_no);
			System.out.println(content_no);
			System.out.println(user_no);
			 Double rating = reviewService.getRatingAvg();
			m.addAttribute("rating", rating);
			m.addAttribute("Review", Review);
			m.addAttribute("list", list);
			m.addAttribute("count", count);
			request.setAttribute("rating", rating);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return "/workDetailPage/reply";		
	}
	
}
