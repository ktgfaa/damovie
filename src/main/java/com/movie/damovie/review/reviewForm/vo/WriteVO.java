package com.movie.damovie.review.reviewForm.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("writeVO")
public class WriteVO {
	private String user_id;
	private String des;
	private String score;
	private Date review_date;
	private String movie_name;
	
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	
	
}
