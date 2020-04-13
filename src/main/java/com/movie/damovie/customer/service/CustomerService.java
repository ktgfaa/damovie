package com.movie.damovie.customer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.movie.damovie.customer.dao.CustomerDAO;
import com.movie.damovie.customer.vo.CustomerMovieVO;
import com.movie.damovie.customer.vo.CustomerTheaterVO;


@Service("customerService")
@Transactional(propagation = Propagation.REQUIRED)
public class CustomerService {
	
	@Autowired
	CustomerDAO CustomerDAO;

	public int addMovie(CustomerMovieVO customerMovieVO) throws DataAccessException {
		return CustomerDAO.addMovie(customerMovieVO);
	}
	
	public int addTheater(CustomerTheaterVO customerTheaterVO) throws DataAccessException {
		return CustomerDAO.addTheater(customerTheaterVO);
	}

}
