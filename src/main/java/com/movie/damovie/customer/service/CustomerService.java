package com.movie.damovie.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.movie.damovie.customer.dao.CustomerDAO;
import com.movie.damovie.customer.vo.CustomerMovieVO;
import com.movie.damovie.customer.vo.CustomerTheaterVO;
import com.movie.damovie.member.vo.MemberVO;


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

	public List<CustomerMovieVO> movieList() {
		return CustomerDAO.movieList();
	}

	public void movieDelete(CustomerMovieVO vo) {
		CustomerDAO.movieDelete(vo);
	}
}
