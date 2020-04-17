package com.movie.damovie.customer.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

@Component("customerSeatUpdateVO")
public class CustomerSeatUpdateVO {
	private List<String> seat_state = new ArrayList<String>();
	private String company;
	private String theater_name;
	private String theater_num;
	private List<String> seatrow = new ArrayList<String>();
	private List<String> seatcol = new ArrayList<String>();
	
	public List<String> getSeat_state() {
		return seat_state;
	}
	public void setSeat_state(List<String> seat_state) {
		this.seat_state = seat_state;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public String getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(String theater_num) {
		this.theater_num = theater_num;
	}
	public List<String> getSeatrow() {
		return seatrow;
	}
	public void setSeatrow(List<String> seatrow) {
		this.seatrow = seatrow;
	}
	public List<String> getSeatcol() {
		return seatcol;
	}
	public void setSeatcol(List<String> seatcol) {
		this.seatcol = seatcol;
	}
	
	
	
}

