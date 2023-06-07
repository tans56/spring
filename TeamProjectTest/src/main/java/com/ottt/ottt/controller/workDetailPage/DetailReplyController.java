package com.ottt.ottt.controller.workDetailPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ottt.ottt.dao.login.LoginUserDao;
import com.ottt.ottt.dao.review.ReviewDao;
import com.ottt.ottt.dto.CommentDTO;
import com.ottt.ottt.dto.ReviewDTO;
import com.ottt.ottt.dto.UserDTO;
import com.ottt.ottt.service.review.ReviewService;

@Controller
public class DetailReplyController {
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	LoginUserDao loginUserDao;
	
	@Autowired
	ReviewDao reviewDao;
	
	@GetMapping(value = "/detailPage/reply")
	public String reviewReply(Model m, HttpServletRequest request, HttpSession session,
			@RequestParam("content_no") int content_no, @RequestParam("review_no") int review_no) {
		Integer user_no = (Integer) session.getAttribute("user_no");
		UserDTO userDTO = loginUserDao.select((String)session.getAttribute("id"));
		m.addAttribute("content_no", content_no);
		try {
			ReviewDTO Review = reviewService.getReplyReview(content_no, review_no);
			List<CommentDTO> list = reviewService.getallreply(review_no);
			int count = reviewService.getReplyCount(review_no);
			System.out.println(review_no);
			System.out.println(content_no);
			 Double rating = reviewService.getRatingAvg();
			m.addAttribute("rating", rating);
			m.addAttribute("Review", Review);
			m.addAttribute("list", list);
			m.addAttribute("count", count);
			m.addAttribute(userDTO);
			request.setAttribute("rating", rating);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return "/workDetailPage/reply";		
	}
	
	   @PostMapping("/detailPage/reply/write")
	   public String writeReply(CommentDTO commentDTO, RedirectAttributes attr,
	                     Model m, HttpSession session, ReviewDTO reviewDTO) {
		   
	      try {
	         if(reviewService.writeReply(commentDTO) != 1) {
	            throw new Exception("Write failed");
	            
	         }
	         attr.addFlashAttribute("msg", "fail");
	         return "redirect:/detailPage/reply?content_no=" + reviewDTO.getContent_no() + "&review_no=" + commentDTO.getReview_no();
	      } catch (Exception e) {
	         e.printStackTrace();
	         m.addAttribute("msg", "ok");
	         return "redirect:/detailPage/reply?content_no="+ reviewDTO.getContent_no() + "&review_no=" + commentDTO.getReview_no();
	      }	   
	   }
	   
	   @PostMapping("/detailPage/reply/reviewremove")
	   public String replyreviewremove(RedirectAttributes rattr, HttpSession session, Model m,ReviewDTO reviewDTO,
			   @RequestParam("content_no") int content_no, @RequestParam("review_no") int review_no) {
	      Integer user_no = (Integer) session.getAttribute("user_no");
	      
	      String msg = "DEL_OK";
	      
	      try {
	    	
	         if(reviewService.removeReplyReview(review_no, user_no) !=1)
	         throw new Exception("Delete failed.");
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         msg = "DEL_ERR";
	      }

	      rattr.addFlashAttribute("msg", msg);
	      
	      
	      
	      return "redirect:/detailPage/review?content_no=" + content_no;
	   }
	   
	   @PostMapping("/detailPage/reply/replyremove")
	   public String replyremove(RedirectAttributes rattr, HttpSession session, Model m,ReviewDTO reviewDTO,
			   @RequestParam("content_no") int content_no, @RequestParam("review_no") int review_no, @RequestParam("cmt_no") Integer cmt_no) {
	      Integer user_no = (Integer) session.getAttribute("user_no");
	      
	      String msg = "DEL_OK";
	      System.out.println("컨트롤러 진입");
	      
	      try {
	    	
	         if(reviewService.removeReply(cmt_no, user_no) !=1) {
	        	 System.out.println("service문 실행");
	        	 System.out.println("cmt_no + " + cmt_no + "===================================================================================");
	        	 System.out.println("user_no + " + user_no + "===================================================================================");
	        	 throw new Exception("Delete failed.");
	         }
	         
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         msg = "DEL_ERR";
	      }

	      rattr.addFlashAttribute("msg", msg);
	      
	      
	      
	      return "redirect:/detailPage/reply?content_no="+ reviewDTO.getContent_no() + "&review_no=" + review_no;
	   }
	   
	   @PostMapping("/detailPage/reply/reviewmodify")
	   public String modifyReview(ReviewDTO reviewDTO, RedirectAttributes rattr, Model m, HttpSession session,
			   						@RequestParam("content_no") int content_no) {
	      Integer user_no = (Integer) session.getAttribute("user_no");
	      
	      
	      
	      
	      try {
	         Integer review_no = reviewDTO.getReview_no();
	               //reviewService.getReviewNo(reviewDTO);
	         //Integer review_no = reviewno.getReview_no();
	         m.addAttribute("review_no", review_no);
	         m.addAttribute("user_no",user_no);
	         if(reviewService.modifyReplyReview(reviewDTO) != 1)
	            throw new Exception("Modify failed");
	         
	         
	         rattr.addFlashAttribute("msg", "MOD_OK");
	         return "redirect:/detailPage/reply?content_no=" + content_no+ "&review_no=" + reviewDTO.getReview_no();
	      } catch (Exception e) {
	         e.printStackTrace();
	         m.addAttribute("reviewDTO", reviewDTO);
	         m.addAttribute("msg", "MOD_ERR");
	         return "redirect:/detailPage/reply?content_no=" + content_no+ "&review_no=" + reviewDTO.getReview_no();
	      }
	   }
	   
	   
	   @PostMapping("/detailPage/reply/replymodify")
	   @ResponseBody
	   public ResponseEntity<Map<String, Object>> modifyReply(CommentDTO commentDTO, RedirectAttributes rattr, Model m, HttpSession session,
	                                                           @RequestParam("content_no") int content_no, @RequestParam("review_no") int review_no) {
	       Integer user_no = (Integer) session.getAttribute("user_no");
	       Map<String, Object> response = new HashMap<>();

	       try {
	           CommentDTO cmt_no = reviewService.getReply(commentDTO.getCmt_no());
	           m.addAttribute("cmt_no", cmt_no);
	           m.addAttribute("user_no", user_no);
	           if (reviewService.modifyReply(commentDTO) != 1)
	               throw new Exception("Modify failed");

	           response.put("success", true);
	           response.put("message", "수정이 정상적으로 완료되었습니다.");
	       } catch (Exception e) {
	           e.printStackTrace();
	           m.addAttribute("commentDTO", commentDTO);
	           response.put("success", false);
	           response.put("message", "수정 중 오류가 발생했습니다.");
	       }

	       return ResponseEntity.ok(response);
	   }
}
