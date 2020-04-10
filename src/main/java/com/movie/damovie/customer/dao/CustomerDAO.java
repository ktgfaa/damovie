package com.movie.damovie.customer.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.movie.damovie.customer.vo.CustomerMovieVO;


@Repository("customerDAO")
public class CustomerDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;

	}
	
	public int addMovie(CustomerMovieVO CustomerMovieVO) {
		int movieresult = sqlSession.insert("mapper.customer.insertMovie", CustomerMovieVO);
		System.out.println(movieresult);
		return movieresult;
	}

}
