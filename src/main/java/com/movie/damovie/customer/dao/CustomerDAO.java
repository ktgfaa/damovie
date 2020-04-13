package com.movie.damovie.customer.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.movie.damovie.customer.vo.CustomerMovieVO;
import com.movie.damovie.customer.vo.CustomerTheaterVO;


@Repository("customerDAO")
public class CustomerDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;

	}
	
	public int addMovie(CustomerMovieVO customerMovieVO) {
		int movieResult = sqlSession.insert("mapper.customer.insertMovie", customerMovieVO);
		return movieResult;
	}
	
	public int addTheater(CustomerTheaterVO customerTheaterVO) {
		int theaterResult = sqlSession.insert("mapper.customer.insertTime", customerTheaterVO);
		System.out.println(theaterResult);
		return theaterResult;
	}
	
	public String selectCompanyName_sub(String id) throws DataAccessException {
		String company = sqlSession.selectOne("mapper.customer.selectCompanyName_sub", id);

		return company;
	}
	
	public List<String> selectTheaterName_sub(String id) throws DataAccessException {
		List<String> TheaterName = sqlSession.selectList("mapper.customer.selectTheaterName_sub", id);

		return TheaterName;
	}
	
	public List<String> selectTheaterNum_sub(String id) throws DataAccessException {
		List<String> TheaterNum = sqlSession.selectList("mapper.customer.selectTheaterNum_sub", id);

		return TheaterNum;
	}



}
