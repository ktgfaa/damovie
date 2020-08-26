package com.movie.damovie.book.bookForm.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.movie.damovie.book.bookForm.VO.MovieTimeVO;

@Repository("bookDAO")
public class BookDAO {
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;

	}

//	극장이름 꺼내기
	public List<String> selectTheaterName(String company) throws DataAccessException {
		List<String> TheaterName = sqlSession.selectList("mapper.bookForm.selectTheaterName", company);

		return TheaterName;
	}

// 회사 이름 꺼내기

	public List<String> selectCompany() throws DataAccessException {
		List<String> company = sqlSession.selectList("mapper.bookForm.selectCompany");

		return company;
	}

//  영화관 꺼내기
	public List<String> selectTheaterNum(String theaterName, String movieName) throws DataAccessException {
		Map<String, String> TheaterName = new HashMap<String, String>();
		TheaterName.put("theaterName", theaterName);
		TheaterName.put("movieName", movieName);
		List<String> theaterNum = sqlSession.selectList("mapper.bookForm.selectTheaterNum", TheaterName);
		return theaterNum;
	}

//  영화 꺼내기
	public List<String> selectMovieName() throws DataAccessException {
		List<String> movieName = sqlSession.selectList("mapper.bookForm.selectMovieName");
		return movieName;
	}

//  이미지 이름 꺼내기
	public List<String> selectImageName() throws DataAccessException {
		List<String> imageName = sqlSession.selectList("mapper.bookForm.selectImageName");
		return imageName;
	}

// 영화관 시간 꺼내기
	public MovieTimeVO selectMovieTime(String theaterName, String theaterNum, String date) throws DataAccessException {
		Map<String, String> Theaterinfo = new HashMap<String, String>();
		Theaterinfo.put("theaterName", theaterName);
		Theaterinfo.put("theaterNum", theaterNum);
		Theaterinfo.put("date", date);

		MovieTimeVO movieTime = (MovieTimeVO) sqlSession.selectOne("mapper.bookForm.selectMovieTime", Theaterinfo);

		return movieTime;
	}

// 극장 날짜 꺼내기
	public MovieTimeVO selectdate(String theaterName, String theaterNum) throws DataAccessException {
		Map<String, String> Theaterinfo = new HashMap<String, String>();
		Theaterinfo.put("theaterName", theaterName);
		Theaterinfo.put("theaterNum", theaterNum);
		MovieTimeVO movieTime = (MovieTimeVO) sqlSession.selectOne("mapper.bookForm.selectMovieTime", Theaterinfo);
		System.out.println(movieTime.getTime1());
		return movieTime;
	}
}
