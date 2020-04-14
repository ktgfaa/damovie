package com.movie.damovie.customer.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.GregorianCalendar;
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
import com.movie.damovie.customer.dao.CustomerDAO;
import com.movie.damovie.customer.service.CustomerService;
import com.movie.damovie.customer.vo.CustomerMovieVO;
import com.movie.damovie.customer.vo.CustomerSeatVO;
import com.movie.damovie.customer.vo.CustomerSeatValueVO;
import com.movie.damovie.customer.vo.CustomerTheaterVO;
import com.movie.damovie.member.vo.MemberVO;

@Controller("customerController")
public class CustomerController {
	
	@Autowired
	private BookDAO bookDAO;
	
	@Autowired
	private CustomerService customerService;
	   
	@Autowired
	private CustomerDAO customerDAO;
	
	private List<String> Alphabet = new ArrayList<String>(Arrays.asList(
			"A", "B", "C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"));
	
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
		
		String company = customerDAO.selectCompanyName_sub(memberVO.getId());
		
		/* ------------ 접근 처리 ------------ */
		try {
		if(memberVO.getUser_level().equals("customer")) {

			/* ---------------영화 포스터,이름 불러오기 ------------------*/
			movieList = bookDAO.selectMovieName();
			imageList = bookDAO.selectImageName();
			
			mav.addObject("movieList", movieList);
		  	mav.addObject("imageList", imageList);
		  	
		  	if(company != null) {
		  		mav.addObject("company", company);
		  	} else {
		  		mav.addObject("company", "no");
		  	}
			
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
	
	@RequestMapping(value ="/customer/addtheater.do", method = RequestMethod.POST)
	private ModelAndView addtheater(
			@ModelAttribute("theater_time") CustomerTheaterVO customerTheaterVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(customerTheaterVO.getTime1());
		ModelAndView mav = new ModelAndView("redirect:/customer/customer.do");
		customerService.addTheater(customerTheaterVO);
		
		return mav;
	}
	
	@RequestMapping(value ="/customer/addseat.do", method = RequestMethod.POST)
	private ModelAndView addseat(
			@ModelAttribute("theater_seat") CustomerSeatVO customerSeatVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(customerSeatVO.getSeat_state());
		ModelAndView mav = new ModelAndView("redirect:/customer/customer.do");
		customerService.addSeat(customerSeatVO);
		
		return mav;
	}
	
	@RequestMapping(value = "/customer/customerTime.do" , method = RequestMethod.GET)
	private ModelAndView customerTime(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		List<String> datatime = new ArrayList<String>();
		  
		 for(int i =1; i < 8;i++ ) {
			Calendar cal2 = new GregorianCalendar();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd"); 
			cal2.add(Calendar.DATE, i);
			datatime.add(sdf1.format(cal2.getTime()));
		 }

		
		/* ------------ 접근 처리 ------------ */
		try {
		if(memberVO.getUser_level().equals("customer")) {
			try {
					String company = customerDAO.selectCompanyName_sub(memberVO.getId());
					List<String> theater_name = customerDAO.selectTheaterName_sub(memberVO.getId());
					List<String> theater_num = customerDAO.selectTheaterNum_sub(memberVO.getId());

					if(company != null) {
						mav.addObject("company",company);
						mav.addObject("theater_name", theater_name);
						mav.addObject("theater_num", theater_num);
						mav.addObject("datatime", datatime);
					} else {
						mav.addObject("company","no");
					}
					
			} catch (NullPointerException e) {
						mav.addObject("company","null");
						mav.addObject("theater_name", "null");
						mav.addObject("theater_num", "null");
					}
			

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
	
	@RequestMapping(value = "/customer/customerSeat.do" , method = {RequestMethod.GET,RequestMethod.POST})
	private ModelAndView customerSeat(
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		

		
		
		/* ------------ 접근 처리 ------------ */
		try {
		if(memberVO.getUser_level().equals("customer")) {
			mav.addObject("member",memberVO);
			try {
				String company = customerDAO.selectCompanyName_sub(memberVO.getId());
				List<String> theater_name = customerDAO.selectTheaterName_sub(memberVO.getId());
				List<String> theater_num = customerDAO.selectTheaterNum_sub(memberVO.getId());
				
				if(company != null) {
					
					mav.addObject("company",company);
					mav.addObject("theater_name", theater_name);
					mav.addObject("theater_num", theater_num);
					mav.addObject("Alphabet", Alphabet);
				} else {
					mav.addObject("company","no");
				}
				
		} catch (NullPointerException e) {
					mav.addObject("company","no");
					mav.addObject("theater_name", "no");
					mav.addObject("theater_num", "no");
					mav.addObject("seatValue", "no");
				}
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
	
	@RequestMapping(value = "/customer/customerConfirm.do" , method = RequestMethod.GET)
	private ModelAndView customerConfirm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		
		/* ------------ 접근 처리 ------------- */
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
	
	@RequestMapping(value = "/customer/customerSeatValue.do" , method = RequestMethod.POST)
	private ModelAndView customerSeatValue(
			@ModelAttribute("seatValue") CustomerSeatValueVO customerSeatValue,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		int seatRow = Alphabet.indexOf(customerSeatValue.getSeatRow()) + 1;
		HttpSession session = request.getSession();
		session.setAttribute("seatAlphabet", customerSeatValue.getSeatRow());
		session.setAttribute("seatRow", seatRow);
		session.setAttribute("seatCol", customerSeatValue.getSeatCol());
		
		mav.setViewName("redirect:customerSeat.do");
		return mav;
	}
	
}
