package com.movie.damovie.customer.vo;

import org.springframework.stereotype.Component;

@Component("customerSeatValueVO")
public class CustomerSeatValueVO {
	private String seatRow;
	private String seatCol;
	
	public String getSeatRow() {
		return seatRow;
	}
	public void setSeatRow(String seatRow) {
		this.seatRow = seatRow;
	}
	public String getSeatCol() {
		return seatCol;
	}
	public void setSeatCol(String seatCol) {
		this.seatCol = seatCol;
	}
	
	
	
}
