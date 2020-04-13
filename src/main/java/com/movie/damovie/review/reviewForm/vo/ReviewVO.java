package com.movie.damovie.review.reviewForm.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("reviewVO")
public class ReviewVO {
	private String movie_name;
	private String summary;
	private String actor;
	private String director;
	private String image_name;
	private String runtime;
	private String jenre;
	private Date opening_Date;
	
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getImage_name() {
		return image_name;
	}
	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}
	public String getRuntime() {
		return runtime;
	}
	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}
	public String getJenre() {
		return jenre;
	}
	public void setJenre(String jenre) {
		this.jenre = jenre;
	}
	public Date getOpening_Date() {
		return opening_Date;
	}
	public void setOpening_Date(Date opening_Date) {
		this.opening_Date = opening_Date;
	}
	
	
	
	
}
