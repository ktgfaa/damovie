package com.movie.damovie.book.bookForm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.movie.damovie.book.bookForm.DAO.BookDAO;
import com.movie.damovie.book.bookForm.VO.MovieTimeVO;
import com.movie.damovie.book.bookForm.service.MovieTimeService;
import com.movie.damovie.member.vo.MemberVO;

@Controller("bookController")
public class BookController extends MultiActionController {

	@Autowired
	private BookDAO bookDAO;

	@Autowired
	private MovieTimeService movieTimeService;

	//예매페이지 출력
	@RequestMapping(value = "/book/bookForm.do", method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		MovieTimeVO movieTime = new MovieTimeVO(); //영화관에 따른 시간표 담을 VO 선언
		String viewName = (String) request.getAttribute("viewName");

		/*--------------------------선택한 정보를 Prameter로 가져옴---------------------------------------*/
		String company = request.getParameter("company");
		String movieName = request.getParameter("movieName");
		String bmImage = request.getParameter("bmImage");
		String theater = request.getParameter("theater");
		String people = request.getParameter("people");
		String price = request.getParameter("price");
		String date = request.getParameter("date");

		/*--------------------------예매 전체 정보 담을 List 선언---------------------------------------*/
		List<String> movieList = null;
		List<String> imageList = null;
		List<String> theaterList = null;
		List<String> theaterNum = null;
		List<String> companyList = null;

		/*--------------------------선택과 상관없이 전체 불러오는 목록 먼저 DB에서 꺼내어 저장---------------------------------------*/
		movieList = bookDAO.selectMovieName();
		imageList = bookDAO.selectImageName();
		companyList = bookDAO.selectCompany();

		mav.addObject("movieList", movieList);
		mav.addObject("imageList", imageList);
		mav.addObject("companyList", companyList);

		/*--------------------------예약할 Member 정보 가져와서 저장---------------------------------------*/
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		mav.addObject("member", memberVO);

		/*--------------------------개봉 영화 표시 , 선택 영화 이미지 바뀜---------------------------------------*/
		if (movieName != null && movieName != "") {
			movieList = bookDAO.selectMovieName();

			mav.addObject("movieList", movieList);
			mav.addObject("company", company);
			mav.addObject("movieName", movieName);
			mav.addObject("bmImage", bmImage);
		}
		/*--------------------------회사에 따른 극장 불러오기---------------------------------------*/
		if (company != null && company != "") {
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
		if (theater != null && movieName != null && theater != "" && movieName != "" && date != "" && date != null) {
			theaterNum = bookDAO.selectTheaterNum(theater, movieName);
			try {
				mav.addObject("theaterNum", theaterNum.get(0));
			} catch (IndexOutOfBoundsException e) {
				mav.addObject("theaterNum", "");
			}

			mav.addObject("company", company);
			mav.addObject("movieName", movieName);
			mav.addObject("bmImage", bmImage);
			mav.addObject("theater", theater);
			mav.addObject("people", people);
			mav.addObject("price", price);
			mav.addObject("date", date);
		}

		/*--------------------------영화관에 따른 시간 불러오기---------------------------------------*/
		if (theaterNum != null && theater != null && theater != "") {
			try {
				movieTime = movieTimeService.selectMovieTime(theater, theaterNum.get(0), date);
			} catch (IndexOutOfBoundsException e) {
				movieTime = movieTimeService.selectMovieTime(theater, "", date);
			}

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
