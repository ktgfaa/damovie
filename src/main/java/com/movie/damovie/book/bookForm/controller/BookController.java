package com.movie.damovie.book.bookForm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.movie.damovie.book.bookForm.DAO.BookDAO;
import com.movie.damovie.book.bookForm.VO.MovieTimeVO;
import com.movie.damovie.book.bookForm.service.MovieTimeService;
import com.movie.damovie.book.order.VO.OrderVO;
import com.movie.damovie.member.vo.MemberVO;


@Controller("bookController")
public class BookController extends MultiActionController {
	
	@Autowired
	private BookDAO bookDAO;
	
	@Autowired
	private OrderVO orderVO;
	
	@Autowired
	private MovieTimeService movieTimeService;
	
	@RequestMapping(value ="/book/bookForm.do", method = {RequestMethod.POST , RequestMethod.GET})
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		String company = request.getParameter("company");
		String movieName = request.getParameter("movieName");
		String bmImage = request.getParameter("bmImage");
		String theater = request.getParameter("theater");
		String people = request.getParameter("people");
		String price = request.getParameter("price");
		String date = request.getParameter("date");
		List<String> movieList = null;
		List<String> imageList = null;
		List<String> theaterList = null;
		List<String> theaterNum = null;
		MovieTimeVO movieTime = new MovieTimeVO();
		movieList = bookDAO.selectMovieName();
		mav.addObject("movieList", movieList);
		imageList = bookDAO.selectImageName();
	  	mav.addObject("imageList", imageList);
	  	
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		mav.addObject("member",memberVO);

		/*--------------------------개봉 영화 표시 , 선택 영화 이미지 바뀜---------------------------------------*/
		 if(movieName != null && movieName != "") { 
			  	System.out.println("movieName 실행");
			  	movieList = bookDAO.selectMovieName();

			  	mav.addObject("movieList", movieList);
			  	mav.addObject("company", company);
				mav.addObject("movieName", movieName);
				mav.addObject("bmImage", bmImage);
			} 
		/*--------------------------회사에 따른 극장 불러오기---------------------------------------*/
		 if(company != null && company != "") { 
			 System.out.println("company 실행");
				theaterList = bookDAO.selectTheaterName(company);
				
				mav.addObject("theaterList", theaterList);
				mav.addObject("company", company);
				mav.addObject("movieName", movieName);
				mav.addObject("bmImage", bmImage);
				mav.addObject("theater", "");
				mav.addObject("people", people);
				mav.addObject("price", price);
				mav.addObject("date", date);
			} 
		 /*--------------------------극장 , 영화에 따라 영화관 불러오기---------------------------------------*/
		 if(theater != null && movieName != null && theater != "" && movieName != "" && date != "" && date != null ) {
			System.out.println("movieNum 실행");
	  		theaterNum = bookDAO.selectTheaterNum(theater, movieName);
	  		
			mav.addObject("theaterNum", theaterNum.get(0));
			mav.addObject("company", company);
			mav.addObject("movieName", movieName);
			mav.addObject("bmImage", bmImage);
			mav.addObject("theater", theater);
			mav.addObject("people", people);
			mav.addObject("price", price);
			mav.addObject("date", date);
		}
		
		 /*--------------------------영화관에 따른 시간 불러오기---------------------------------------*/
		 	if(theaterNum != null && theater != null && theater != "" ) {
			System.out.println("moiveTime 실행");
	  		movieTime = movieTimeService.selectMovieTime(theater, theaterNum.get(0),date);
	  		
			mav.addObject("movieTime", movieTime);
			mav.addObject("company", company);
			mav.addObject("movieName", movieName);
			mav.addObject("bmImage", bmImage);
			mav.addObject("theater", theater);
			mav.addObject("people", people);
			mav.addObject("price", price);
			mav.addObject("date", date);
		} 
		
		
		
			mav.setViewName(viewName);
			return mav;
		  
	}
	
	

	

}
