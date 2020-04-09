package com.movie.damovie.main.dao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("mainDAO")
public class MainDAO {
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		
	}

	public List selectRanking() throws DataAccessException {
		List movieRanking = null;

		
	  movieRanking = sqlSession.selectList("mapper.main.selectMovieName");
	 
	  for(int i=0 ; i<5 ; i++) {
		  movieRanking.add(sqlSession.selectList("mapper.main.selectImageName").get(i)); 
		  }
	 

		
		return movieRanking;
	}
}
