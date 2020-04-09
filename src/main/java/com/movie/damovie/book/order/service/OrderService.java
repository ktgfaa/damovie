package com.movie.damovie.book.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.movie.damovie.book.order.DAO.OrderDAO;
import com.movie.damovie.book.order.VO.OrderVO;

@Service("orderService")
@Transactional(propagation = Propagation.REQUIRED)
public class OrderService {
	
	@Autowired
	OrderDAO orderDAO;

	public int addBook(OrderVO orderVO) throws DataAccessException {
		return orderDAO.addBook(orderVO);
	}
	
}
