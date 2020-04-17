package com.movie.damovie.customer.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("customerTheaterVO")
public class CustomerTheaterVO {
	private String id;
	private String company;
	private String theater_name;
	private String theater_num;
	private String movie_date;
	private String time1;
	private String time2;
	private String time3;
	private String time4;
	private String time5;
	private String time6;
	private String time7;
	private String time8;
	private String time9;
	private String time10;
	private Date putdate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getMovie_date() {
		return movie_date;
	}
	public void setMovie_date(String movie_date) {
		this.movie_date = movie_date;
	}
	public String getTime1() {
		return time1;
	}
	public void setTime1(String time1) {
		this.time1 = time1;
	}
	public String getTime2() {
		return time2;
	}
	public void setTime2(String time2) {
		this.time2 = time2;
	}
	public String getTime3() {
		return time3;
	}
	public void setTime3(String time3) {
		this.time3 = time3;
	}
	public String getTime4() {
		return time4;
	}
	public void setTime4(String time4) {
		this.time4 = time4;
	}
	public String getTime5() {
		return time5;
	}
	public void setTime5(String time5) {
		this.time5 = time5;
	}
	public String getTime6() {
		return time6;
	}
	public void setTime6(String time6) {
		this.time6 = time6;
	}
	public String getTime7() {
		return time7;
	}
	public void setTime7(String time7) {
		this.time7 = time7;
	}
	public String getTime8() {
		return time8;
	}
	public void setTime8(String time8) {
		this.time8 = time8;
	}
	public String getTime9() {
		return time9;
	}
	public void setTime9(String time9) {
		this.time9 = time9;
	}
	public String getTime10() {
		return time10;
	}
	public void setTime10(String time10) {
		this.time10 = time10;
	}
	public Date getPutdate() {
		return putdate;
	}
	public void setPutDate(Date putdate) {
		this.putdate = putdate;
	}
	

}
