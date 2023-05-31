package com.ottt.ottt.service.review;

import java.util.List;

import com.ottt.ottt.dto.CommentDTO;
import com.ottt.ottt.dto.ReviewDTO;

public interface ReviewService {
    int removeReview(Integer review_no, Integer user_no) throws Exception;
    int modifyReview(ReviewDTO reviewDTO) throws Exception;
    int writeReview(ReviewDTO dto) throws Exception;
    double getRatingAvg()throws Exception;
    
    
    int getCount()throws Exception;
    int getReplyCount(Integer review_no) throws Exception;
    ReviewDTO getReviewNo(Integer content_no,Integer user_no ) throws Exception; 
    ReviewDTO getReplyReview(Integer content_no, Integer review_no)throws Exception;
    List<ReviewDTO> getReview() throws Exception;
    List<CommentDTO> getreply(Integer review_no) throws Exception;
}