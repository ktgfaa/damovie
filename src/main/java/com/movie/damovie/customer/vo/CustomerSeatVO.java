package com.movie.damovie.customer.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

@Component("customerSeatVO")
public class CustomerSeatVO {
	private String company;
	private String theater_name;
	private String theater_num;
	private List seatrow = new ArrayList();
	private String seatcol;
	private String seat_state;
	private String datasolt;
	
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
	public List getSeatrow() {
		return seatrow;
	}
	public void setSeatrow(List seatrow) {
		this.seatrow = seatrow;
	}
	public String getSeatcol() {
		return seatcol;
	}
	public void setSeatcol(String seatcol) {
		this.seatcol = seatcol;
	}
	public String getSeat_state() {
		return seat_state;
	}
	public void setSeat_state(String seat_state) {
		this.seat_state = seat_state;
	}
	public String getDatasolt() {
		return datasolt;
	}
	public void setDatasolt(String datasolt) {
		this.datasolt = datasolt;
	}
	
	
	
}
