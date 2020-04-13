package com.movie.damovie.review.reviewForm.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.movie.damovie.review.reviewForm.vo.ReviewVO;
import com.movie.damovie.review.reviewForm.vo.WriteVO;

@Repository("reviewDAO")
public class ReviewDAOImpl implements ReviewDAO{
	
	@Autowired
	private SqlSession sqlSession;

	public List<ReviewVO> movieList() throws DataAccessException {
		List<ReviewVO> listMovie = sqlSession.selectList("mapper.review.movieList");
		return listMovie;
	}
	
	public ReviewVO movieInfo(String imageName) throws DataAccessException {
		ReviewVO listMovie = sqlSession.selectOne("mapper.review.movieInfo",imageName);
		return listMovie;
	}

	@Override
	public List<WriteVO> reviewList(String movieName) throws DataAccessException {
		List<WriteVO> listReview = sqlSession.selectList("mapper.review.reviewList", movieName);
		return listReview;
	}

//	@Override
//	public WriteVO reviewInfo(String movieName) throws DataAccessException {
//		
//		 WriteVO review = sqlSession.selectOne("mapper.review.reviewInfo",movieName);
//		 return review;
//		
//	}
	public int reviewWrite(WriteVO writeVO) throws DataAccessException{
		int writeReview = sqlSession.insert("mapper.review.reviewWrite", writeVO);
		
		return writeReview;
	}

	@Override
	public int delReview(WriteVO writeVO) throws DataAccessException {
		int result = sqlSession.delete("mapper.review.delReview",writeVO);
		
		return result;
	}

	@Override
	public int modReview(WriteVO writeVO) throws DataAccessException {
		int result = sqlSession.update("mapper.review.modReview",writeVO);
		
		return result;
	}

	@Override
	public int totalList(String movieName) throws DataAccessException {
		int listTotal = sqlSession.selectOne("mapper.review.totalList", movieName);
		if(listTotal == 0) {
			return 0;
		}
		return listTotal;
	}

	@Override
	public List<WriteVO> listAll(int start, int end, String searchOption, String keyword) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		map.put("start", start);
		map.put("end",end);
		
		return sqlSession.selectList("mapper.review.listAll", map);
	}
	public int countArticle(String searchOption, String keyword) throws Exception {
		// 검색옵션, 키워드 맵에 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne("mapper.review.countArticle", map);
	}
	
	
}
