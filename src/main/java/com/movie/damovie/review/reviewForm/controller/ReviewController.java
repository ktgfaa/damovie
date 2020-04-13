package com.movie.damovie.review.reviewForm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.movie.damovie.review.reviewForm.vo.WriteVO;

public interface ReviewController {
	public ModelAndView review(@RequestParam(defaultValue="1") int curPage, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView reviewWrite(@ModelAttribute("write") WriteVO writeVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modReview(@ModelAttribute("write") WriteVO writeVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView delReview(@ModelAttribute("write") WriteVO writeVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView list(@RequestParam(defaultValue="title") String searchOption,
							@RequestParam(defaultValue="") String keyword,
							@RequestParam(defaultValue="1") int curPage) throws Exception;
}
