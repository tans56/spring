package com.ottt.ottt.controller.workDetailPage;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ottt.ottt.dto.ReviewDTO;
import com.ottt.ottt.dto.ReviewLikeDTO;
import com.ottt.ottt.dto.UserDTO;
import com.ottt.ottt.service.review.ReviewLikeService;
import com.ottt.ottt.service.review.ReviewService;

@Controller
public class DetailController {
	@Autowired
	private ReviewService reviewService;
	private ReviewLikeService reviewLikeService;
	
	
	@GetMapping(value = "/detailPage")
	public String workDetailPage(Model m, HttpServletRequest request, HttpSession session) {         //, Integer content_no) 

		
		
		
		Integer user_no = (Integer) session.getAttribute("user_no");
			
		try {
			
			List<ReviewDTO> list = reviewService.getReview();

			int count = reviewService.getCount();
			
			
			
			
			m.addAttribute("list", list);
			m.addAttribute("count", count);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		
		return "/workDetailPage/workdetailpage";
	}
	
//	@GetMapping(value = "/detailPage/review")
//	public String workReview() {
//			return "/workDetailPage/review";		
//	}
//	

	@PostMapping(value = "/detailPage")
	public String write(ReviewDTO reviewDTO, Model m, RedirectAttributes attr, HttpSession session) {
	    
		try {
			
			if(reviewService.writeReview(reviewDTO)!=1) {
				throw new Exception("error");
			}
			attr.addFlashAttribute("msg", "fail");
			
			return "redirect:/detailPage"; 
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "ok");
			
			
			return "/workDetailPage/workdetailpage";
			
			
		}
		
		
	}
	
	
	@PostMapping("/remove")
	public String remove(Integer review_no,RedirectAttributes rattr, HttpSession session, Model m) {
		int user_no = (int) session.getAttribute("user_no");
		
		
		String msg = "DEL_OK";
		
		try {
			if(reviewService.removeReview(review_no, user_no) !=1)
			throw new Exception("Delete failed.");
		} catch (Exception e) {
			e.printStackTrace();
			msg = "DEL_ERR";
		}

		rattr.addFlashAttribute("msg", msg);
		
		
		
		return "redirect:/detailPage";
	}
	
	
	@GetMapping("/detailPage/like")
	public String getReviewLikeCnt(Integer review_no, Integer user_no, Model m) {
		int reviewYN = reviewLikeService.getReviewLikeYN(review_no, user_no);
		
		
		m.addAttribute("Detail", reviewLikeService.getReviewLikeYN(review_no, user_no));
		m.addAttribute("getLike", reviewLikeService.getReviewCount(review_no));
		
		ReviewLikeDTO like = new ReviewLikeDTO();
		like.setUser_no(user_no);
		like.setReview_no(review_no);
		
	        
	        m.addAttribute("review_no", review_no);
	        m.addAttribute("user_no", user_no);

		return "/detailPage";
	}
	
	
	
	
	
	
	

	
	
}
