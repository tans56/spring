package com.ottt.ottt.dao.review;

public interface ReviewLikeDao {
	int reviewLikeYN(Integer review_no, Integer user_no);
	int likeCount(Integer review_no);
}
