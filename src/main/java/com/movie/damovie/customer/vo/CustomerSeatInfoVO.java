package com.movie.damovie.customer.vo;

import org.springframework.stereotype.Component;

@Component("customerSeatInfoVO")
public class CustomerSeatInfoVO {
	private String company;
	private String theater_name;
	private String theater_num;
	
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
	
	
	
}
