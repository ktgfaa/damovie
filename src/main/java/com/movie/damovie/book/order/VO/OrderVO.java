package com.movie.damovie.book.order.VO;

import org.springframework.stereotype.Component;

@Component("orderVO")
public class OrderVO {
	private String id;
	private String movie_name;
	private String bmimage;
	private String company;
	private String theater_name;
	private String theater_num;
	private String time;
	private String movie_date;
	private String price;
	private String adult;
	private String student;
	private String seatcol;
	private String seatrow;

	public String getAdult() {
		return adult;
	}

	public void setAdult(String adult) {
		this.adult = adult;
	}

	public String getStudent() {
		return student;
	}

	public void setStudent(String student) {
		this.student = student;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMovie_name() {
		return movie_name;
	}

	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}

	public String getBmimage() {
		return bmimage;
	}

	public void setBmimage(String bmimage) {
		this.bmimage = bmimage;
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

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getMovie_date() {
		return movie_date;
	}

	public void setMovie_date(String movie_date) {
		this.movie_date = movie_date;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getSeatrow() {
		return seatrow;
	}

	public void setSeatrow(String seatrow) {
		this.seatrow = seatrow;
	}

	public String getSeatcol() {
		return seatcol;
	}

	public void setSeatcol(String seatcol) {
		this.seatcol = seatcol;
	}

}
