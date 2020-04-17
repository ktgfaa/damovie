package com.movie.damovie.customer.vo;

import org.springframework.stereotype.Component;

@Component("customerTimeValueVO")
public class CustomerTimeValueVO {
	private String company;
	private String theater_name;
	
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
	
	

}
