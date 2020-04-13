package com.movie.damovie.review.reviewForm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.movie.damovie.review.reviewForm.dao.ReviewDAO;
import com.movie.damovie.review.reviewForm.vo.ReviewVO;
import com.movie.damovie.review.reviewForm.vo.WriteVO;



@Service("reviewService")
@Transactional(propagation=Propagation.REQUIRED)
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public List<ReviewVO> movieList() throws Exception {
		List<ReviewVO> listMovie = reviewDAO.movieList();
		return listMovie;
	}
	
	public ReviewVO movieInfo(String imageName) throws Exception {
		ReviewVO listMovie = reviewDAO.movieInfo(imageName);
		return listMovie;
	}

	@Override
	public List<WriteVO> reviewList(String movieName) throws Exception {
		List<WriteVO> listReview = reviewDAO.reviewList(movieName);
		return listReview;
	}

//	@Override
//	public WriteVO reviewInfo(String movieName) throws Exception {
//		WriteVO review = reviewDAO.reviewInfo(movieName);
//		return review;
//	}
	
	public int reviewWrite(WriteVO writeVO) throws DataAccessException{
		int writeReview = reviewDAO.reviewWrite(writeVO); 
		
		return writeReview;
		
	}

	@Override
	public int delReview(WriteVO writeVO) throws DataAccessException {
		
		return reviewDAO.delReview(writeVO);
	}

	@Override
	public int modReview(WriteVO writeVO) throws DataAccessException {

		return reviewDAO.modReview(writeVO);
	}

	@Override
	public int totalList(String movieName) throws Exception {
		int listTotal = reviewDAO.totalList(movieName);
		return listTotal;
	}

	@Override
	public List<WriteVO> listAll(int start, int end, String searchOption, String keyword) throws Exception {
		
		return reviewDAO.listAll(start, end, searchOption, keyword);
	}
	public int countArticle(String searchOption, String keyword) throws Exception {
		return reviewDAO.countArticle(searchOption, keyword);
	}
	
	
}
