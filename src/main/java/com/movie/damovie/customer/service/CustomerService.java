package com.movie.damovie.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.movie.damovie.customer.dao.CustomerDAO;
import com.movie.damovie.customer.vo.CustomerMovieVO;
import com.movie.damovie.customer.vo.CustomerSeatVO;
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
	
	public int addSeat(String company,String theater_name,String theater_num,String seatrow,String seatcol, String seat_state,String datasolt) throws DataAccessException {
		return CustomerDAO.addSeat(company,theater_name,theater_num,seatrow,seatcol,seat_state,datasolt);
	}
	
	public List<CustomerMovieVO> movieList(String id, int start, int end, String searchOption, String keyword) {
		return CustomerDAO.listALL(id, start, end, searchOption, keyword);
	}

	public int countArticle(String id,String searchOption, String keyword) {
		return CustomerDAO.countArticle(id, searchOption, keyword);
	}

	public void movieDelete(CustomerMovieVO vo) {
		CustomerDAO.movieDelete(vo);
	}
	
	public List<String> movieList(String id){
		return CustomerDAO.movieList(id);
	}

	public void movieUpdate(CustomerMovieVO vo) {
		CustomerDAO.movieUpdate(vo);
		
	}
	
	public void seatUpdate(String seat_state,String company,String theater_name,String theater_num,String seatrow,String seatcol) {
		CustomerDAO.seatUpdate(seat_state,company,theater_name,theater_num,seatrow,seatcol);
		
	}
}
