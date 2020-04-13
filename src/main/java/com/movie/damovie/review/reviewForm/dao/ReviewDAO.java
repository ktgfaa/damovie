package com.movie.damovie.review.reviewForm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;

import com.movie.damovie.review.reviewForm.vo.ReviewVO;
import com.movie.damovie.review.reviewForm.vo.WriteVO;

public interface ReviewDAO {
	public List<ReviewVO> movieList() throws DataAccessException;
	public ReviewVO movieInfo(String imageName) throws DataAccessException;
	
	public List<WriteVO> reviewList(String movieName) throws DataAccessException;
//	public WriteVO reviewInfo(String movieName) throws DataAccessException;
	
	public int reviewWrite(WriteVO writeVO) throws DataAccessException;
	public int delReview(WriteVO writeVO) throws DataAccessException;
	public int modReview(WriteVO writeVO) throws DataAccessException;
	public int totalList(String movieName) throws DataAccessException;
	
	public List<WriteVO> listAll(int start, int end, String searchOption, String keyword) throws Exception;
	public int countArticle(String searchOption, String keyword) throws Exception;
}
