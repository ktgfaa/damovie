package com.movie.damovie.review.reviewForm.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.movie.damovie.review.reviewForm.vo.ReviewVO;
import com.movie.damovie.review.reviewForm.vo.WriteVO;


public interface ReviewService {
	public List<ReviewVO> movieList() throws Exception;
	public ReviewVO movieInfo(String imageName) throws Exception;
	
	public List<WriteVO> reviewList(String movieName) throws Exception;
//	public WriteVO reviewInfo(String movieName) throws Exception;
	
	public int reviewWrite(WriteVO writeVO) throws DataAccessException;
	
	public int delReview(WriteVO writeVO) throws DataAccessException;
	
	public int modReview(WriteVO writeVO) throws DataAccessException;
	
	public int totalList(String movieName) throws Exception;
	
	public List<WriteVO> listAll(int start, int end, String searchOption, String keyword) throws Exception;
	
	public int countArticle(String searchOption, String keyword) throws Exception;

}
