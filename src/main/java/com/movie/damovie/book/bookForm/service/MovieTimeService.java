package com.movie.damovie.book.bookForm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.movie.damovie.book.bookForm.DAO.BookDAO;
import com.movie.damovie.book.bookForm.VO.MovieTimeVO;



@Service("movieTimeService")
@Transactional(propagation=Propagation.REQUIRED)
public class MovieTimeService {
	
	@Autowired
	BookDAO bookDAO;
	
	public MovieTimeVO selectMovieTime(String theaterName,String theaterNum, String date) throws Exception{
		return bookDAO.selectMovieTime(theaterName, theaterNum,date);
	}

}
