package com.ottt.ottt.service.review;

public interface ReviewLikeService {
	int getReviewLikeYN(Integer review_no, Integer user_no);
	int getReviewCount(Integer review_no);
}
