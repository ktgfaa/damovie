package com.movie.damovie.customer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.movie.damovie.book.bookForm.DAO.BookDAO;
import com.movie.damovie.book.order.VO.OrderVO;
import com.movie.damovie.customer.service.CustomerService;
import com.movie.damovie.customer.vo.CustomerMovieVO;
import com.movie.damovie.member.vo.MemberVO;

@Controller("customerController")
public class CustomerController {
	
	@Autowired
	private BookDAO bookDAO;
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value = "/customer/customer.do" , method = RequestMethod.GET)
	private ModelAndView customerMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		/* ------------ 접근 처리 ------------ */
		try {
		if(memberVO.getUser_level().equals("customer")) {
			mav.addObject("member",memberVO);
			mav.setViewName(viewName);
			} else if(memberVO.getUser_level().equals("admin")) {
				mav = new ModelAndView("redirect:/admin.do");
			} else {
			mav = new ModelAndView("redirect:/main.do");
			} } catch(NullPointerException e) {
			mav = new ModelAndView("redirect:/main.do");
		}
		return mav;
	}
	
	@RequestMapping(value = "/customer/customerMovie.do" , method = {RequestMethod.GET , RequestMethod.POST})
	private ModelAndView customerMovie(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		List<String> movieList = null;
		List<String> imageList = null;
		
		/* ------------ 접근 처리 ------------ */
		try {
		if(memberVO.getUser_level().equals("customer")) {

			/* ---------------영화 포스터,이름 불러오기 ------------------*/
			movieList = bookDAO.selectMovieName();
			imageList = bookDAO.selectImageName();
			
			mav.addObject("movieList", movieList);
		  	mav.addObject("imageList", imageList);
			
			mav.setViewName(viewName);
			} else if(memberVO.getUser_level().equals("admin")) {
				mav = new ModelAndView("redirect:/admin.do");
			} else {
			mav = new ModelAndView("redirect:/main.do");
			} } catch(NullPointerException e) {
			mav = new ModelAndView("redirect:/main.do");
		}
		return mav;
	
	}
	
	@RequestMapping(value ="/customer/addmovie.do", method = RequestMethod.POST)
	private ModelAndView addmovie(
			@ModelAttribute("movie_company") CustomerMovieVO CustomerMovieVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView("redirect:/customer/customer.do");
		customerService.addMovie(CustomerMovieVO);
		
		return mav;
	}
	
	@RequestMapping(value = "/customer/customerTime.do" , method = RequestMethod.GET)
	private ModelAndView customerTime(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		/* ------------ 접근 처리 ------------ */
		try {
		if(memberVO.getUser_level().equals("customer")) {
			mav.addObject("member",memberVO);
			mav.setViewName(viewName);
			} else if(memberVO.getUser_level().equals("admin")) {
				mav = new ModelAndView("redirect:/admin.do");
			} else {
			mav = new ModelAndView("redirect:/main.do");
			} } catch(NullPointerException e) {
			mav = new ModelAndView("redirect:/main.do");
		}
		return mav;
	}
	
}
