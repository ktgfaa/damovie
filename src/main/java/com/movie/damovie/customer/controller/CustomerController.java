package com.movie.damovie.customer.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.movie.damovie.admin.service.MemberPage;
import com.movie.damovie.book.bookForm.DAO.BookDAO;
import com.movie.damovie.customer.dao.CustomerDAO;
import com.movie.damovie.customer.service.CustomerService;
import com.movie.damovie.customer.vo.CustomerMovieVO;
import com.movie.damovie.customer.vo.CustomerSeatInfoVO;
import com.movie.damovie.customer.vo.CustomerSeatUpdateVO;
import com.movie.damovie.customer.vo.CustomerSeatVO;
import com.movie.damovie.customer.vo.CustomerSeatValueVO;
import com.movie.damovie.customer.vo.CustomerTheaterVO;
import com.movie.damovie.customer.vo.CustomerTimeValueVO;
import com.movie.damovie.member.vo.MemberVO;

@Controller("customerController")
public class CustomerController {

	@Autowired
	private BookDAO bookDAO;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private CustomerDAO customerDAO;

	private List<String> Alphabet = new ArrayList<String>(Arrays.asList("A", "B", "C", "D", "E", "F", "G", "H", "I",
			"J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"));

	int count = 0;

	// 서브관리자 메인페이지
	@RequestMapping(value = "/customer/customer.do", method = RequestMethod.GET)
	private ModelAndView customerMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		session.removeAttribute("seatRow_confirm");
		session.removeAttribute("seatRowSize");
		session.removeAttribute("seatCol_confirm");
		session.removeAttribute("seat_state_confirm");

		/* ------------ 접근 처리 ------------ */
		try {
			if (memberVO.getUser_level().equals("customer")) {
				mav.addObject("member", memberVO);
				mav.setViewName(viewName);
			} else if (memberVO.getUser_level().equals("admin")) {
				mav = new ModelAndView("redirect:/admin.do");
			} else {
				mav = new ModelAndView("redirect:/main.do");
			}
		} catch (NullPointerException e) {
			mav = new ModelAndView("redirect:/main.do");
		}
		return mav;
	}

	// 서브관리자 데이터 업데이트 페이지
	@RequestMapping(value = "/customer/customerUpdate.do", method = RequestMethod.GET)
	private ModelAndView customerUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		session.removeAttribute("seatRow_confirm");
		session.removeAttribute("seatRowSize");
		session.removeAttribute("seatCol_confirm");
		session.removeAttribute("seat_state_confirm");

		/* ------------ 접근 처리 ------------ */
		try {
			if (memberVO.getUser_level().equals("customer")) {
				mav.addObject("member", memberVO);
				mav.setViewName(viewName);
			} else if (memberVO.getUser_level().equals("admin")) {
				mav = new ModelAndView("redirect:/admin.do");
			} else {
				mav = new ModelAndView("redirect:/main.do");
			}
		} catch (NullPointerException e) {
			mav = new ModelAndView("redirect:/main.do");
		}
		return mav;
	}

	// 영화 업데이트 페이지
	@RequestMapping(value = "/customer/customerMovie.do", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView customerMovie(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		List<String> movieList = null;
		List<String> imageList = null;

		/* ------------ 접근 처리 ------------ */
		try {
			if (memberVO.getUser_level().equals("customer")) {
				String company = customerDAO.selectCompanyName_sub(memberVO.getId());
				/* ---------------영화 포스터,이름 불러오기 ------------------ */
				movieList = bookDAO.selectMovieName();
				imageList = bookDAO.selectImageName();

				System.out.println(imageList);

				mav.addObject("movieList", movieList);
				mav.addObject("imageList", imageList);

				if (company != null) {
					mav.addObject("company", company);
				} else {
					mav.addObject("company", "no");
				}

				mav.setViewName(viewName);
			} else if (memberVO.getUser_level().equals("admin")) {
				mav = new ModelAndView("redirect:/admin.do");
			} else {
				mav = new ModelAndView("redirect:/main.do");
			}
		} catch (NullPointerException e) {
			mav = new ModelAndView("redirect:/main.do");
		}
		return mav;

	}

	// 회사,영화,극장,극장번호 추가
	@RequestMapping(value = "/customer/addmovie.do", method = RequestMethod.POST)
	private ModelAndView addmovie(@ModelAttribute("movie_company") CustomerMovieVO CustomerMovieVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView("redirect:/customer/customer.do");
		customerService.addMovie(CustomerMovieVO);

		return mav;
	}
	
	// 시간 업데이트 페이지
	@RequestMapping(value = "/customer/customerTime.do", method = RequestMethod.GET)
	private ModelAndView customerTime(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		List<String> datatime = new ArrayList<String>();

		for (int i = 1; i < 8; i++) {
			Calendar cal2 = new GregorianCalendar();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			cal2.add(Calendar.DATE, i);
			datatime.add(sdf1.format(cal2.getTime()));
		}

		CustomerTimeValueVO vo = (CustomerTimeValueVO) session.getAttribute("customerTimeValue");

		List<String> theater_num = new ArrayList<String>();
		try {
			if (vo.getCompany() != null && vo.getTheater_name() != null) {
				theater_num = customerDAO.selectTheaterNum_notTime(vo.getCompany(), vo.getTheater_name());
				mav.addObject("theater_name_selected", vo.getTheater_name());
			}
		} catch (NullPointerException e) {
			mav.addObject("theater_name_selected", "이미 시간이 업데이트된 영화관은 관리페이지에서 수정해주세요");
		}

		/* ------------ 접근 처리 ------------ */
		try {
			if (memberVO.getUser_level().equals("customer")) {
				try {

					String company = customerDAO.selectCompanyName_sub(memberVO.getId());
					List<String> theater_name = customerDAO.selectTheaterName_sub(memberVO.getId());
					if (company != null) {
						mav.addObject("company", company);
						mav.addObject("theater_name", theater_name);
						mav.addObject("theater_num", theater_num);
						mav.addObject("datatime", datatime);
					} else {
						mav.addObject("company", "no");
					}

				} catch (NullPointerException e) {
					mav.addObject("company", "no");
					mav.addObject("theater_name", "no");
					mav.addObject("theater_num", "no");
				}

				mav.addObject("member", memberVO);
				mav.setViewName(viewName);
			} else if (memberVO.getUser_level().equals("admin")) {
				mav = new ModelAndView("redirect:/admin.do");
			} else {
				mav = new ModelAndView("redirect:/main.do");
			}
		} catch (NullPointerException e) {
			mav = new ModelAndView("redirect:/main.do");
		}
		return mav;
	}
	
	// 시간 업데이트 페이지에서 극장,극장번호 불어오기
	@RequestMapping(value = "/customer/customerTimeValue.do", method = RequestMethod.POST)
	private ModelAndView customerTimeValue(@ModelAttribute("customerTimeValue") CustomerTimeValueVO vo,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/customer/customerTime.do");
		HttpSession session = request.getSession();
		session.removeAttribute("customerTimeValue");
		session.setAttribute("customerTimeValue", vo);

		return mav;
	}

	// 시간 추가
	@RequestMapping(value = "/customer/addtheater.do", method = RequestMethod.POST)
	private ModelAndView addtheater(@ModelAttribute("theater_time") CustomerTheaterVO customerTheaterVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(customerTheaterVO.getTime1());
		ModelAndView mav = new ModelAndView("redirect:/customer/customer.do");
		customerService.addTheater(customerTheaterVO);

		return mav;
	}

	// 좌석 업데이트 페이지
	@RequestMapping(value = "/customer/customerSeat.do", method = RequestMethod.GET)
	private ModelAndView customerSeat(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		/* ------------ 접근 처리 ------------ */
		try {
			if (memberVO.getUser_level().equals("customer")) {
				mav.addObject("member", memberVO);
				try {
					CustomerTimeValueVO vo = (CustomerTimeValueVO) session.getAttribute("customerTimeValue");
					String company = customerDAO.selectCompanyName_sub(memberVO.getId());
					List<String> theater_name = customerDAO.selectTheaterName_sub(memberVO.getId());

					if (company != null) {
						mav.addObject("company", company);
						mav.addObject("theater_name", theater_name);
						List<String> theater_num = customerDAO.selectTheaterNum_seat(vo.getCompany(),
								vo.getTheater_name());
						mav.addObject("selecttheater_name", vo.getTheater_name());
						mav.addObject("theater_num", theater_num);
						mav.addObject("Alphabet", Alphabet);
					} else {
						mav.addObject("company", "no");
					}

				} catch (NullPointerException e) {
					mav.addObject("theater_num", "null");
				}
				mav.setViewName(viewName);

			} else if (memberVO.getUser_level().equals("admin")) {
				mav = new ModelAndView("redirect:/admin.do");
			} else {
				mav = new ModelAndView("redirect:/main.do");
			}
		} catch (NullPointerException e) {
			mav = new ModelAndView("redirect:/main.do");
		}
		return mav;
	}

	// 좌석 추가
	@RequestMapping(value = "/customer/addseat.do", method = RequestMethod.POST)
	private ModelAndView addseat(@ModelAttribute("theater_seat") CustomerSeatVO customerSeatVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(customerSeatVO.getCompany());
		System.out.println(customerSeatVO.getTheater_name());
		System.out.println(customerSeatVO.getTheater_num());
		System.out.println(customerSeatVO.getSeatrow());
		System.out.println(customerSeatVO.getSeatcol());
		System.out.println(customerSeatVO.getSeat_state());
		System.out.println(customerSeatVO.getDatasolt());
		int num = 0;
		int num2 = 0;
		ModelAndView mav = new ModelAndView("redirect:/customer/customer.do");

		List<String> distinct = customerDAO.theater_Seat_distinct(customerSeatVO.getCompany(),
				customerSeatVO.getTheater_name());

		for (int k = 0; k < distinct.size(); k++) {
			if (distinct.get(k) != null && distinct.get(k).equals(customerSeatVO.getTheater_num())) {
				customerDAO.seatDelete(customerSeatVO.getCompany(), customerSeatVO.getTheater_name(),
						customerSeatVO.getTheater_num());
			}
		}

		for (int i = 0; i < customerSeatVO.getSeatrow().size(); i++) {
			for (int j = 1; j < Integer.parseInt(customerSeatVO.getSeatcol()) + 1; j++) {
				num += 1;
				customerService.addSeat(customerSeatVO.getCompany(), customerSeatVO.getTheater_name(),
						customerSeatVO.getTheater_num(), customerSeatVO.getSeatrow().get(i), Integer.toString(j),
						customerSeatVO.getSeat_state().get(num2), Integer.toString(num));
				num2 += 1;
			}
		}

		return mav;
	}

	// 좌석 업데이트 페이지에서 좌석 불러오기
	@RequestMapping(value = "/customer/customerSeatValue.do", method = RequestMethod.POST)
	private ModelAndView customerSeatValue(@ModelAttribute("customerSeatValue") CustomerSeatValueVO customerSeatValueVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/customer/customerSeat.do");
		HttpSession session = request.getSession();
		int seatRow = Alphabet.indexOf(customerSeatValueVO.getSeatRow());

		session.setAttribute("seatAlphabet", customerSeatValueVO.getSeatRow());
		session.setAttribute("seatRow", seatRow);
		session.setAttribute("seatCol", customerSeatValueVO.getSeatCol());
		session.setAttribute("theater_name_Update", customerSeatValueVO.getTheater_name());
		session.setAttribute("theater_num_Update", customerSeatValueVO.getTheater_num());

		return mav;
	}

	@RequestMapping(value = "/customer/customerConfirm.do", method = RequestMethod.GET)
	private ModelAndView customerConfirm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		session.removeAttribute("seatRow_confirm");
		session.removeAttribute("seatRowSize");
		session.removeAttribute("seatCol_confirm");
		session.removeAttribute("seat_state_confirm");
		/* ------------ 접근 처리 ------------ */
		try {
			if (memberVO.getUser_level().equals("customer")) {
				mav.addObject("member", memberVO);
				mav.setViewName(viewName);
			} else if (memberVO.getUser_level().equals("admin")) {
				mav = new ModelAndView("redirect:/admin.do");
			} else {
				mav = new ModelAndView("redirect:/main.do");
			}
		} catch (NullPointerException e) {
			mav = new ModelAndView("redirect:/main.do");
		}
		return mav;
	}

	@RequestMapping(value = "/customer/check_customerMovie.do")
	private ModelAndView checkCustomerMovie(HttpServletRequest request,
			@RequestParam(defaultValue = "all") String searchOption, @RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int curPage) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		mav.addObject("member", memberVO);
		String company = customerDAO.selectCompanyName_sub(memberVO.getId());
		mav.addObject("company", company);
		List<String> movieList = bookDAO.selectMovieName();

		// 레코드 개수 계산
		int count = customerService.countArticle(memberVO.getId(), searchOption, keyword);
		// 페이지 나누기
		MemberPage paging = new MemberPage(count, curPage);
		int start = paging.getPageBegin();
		int end = paging.getPageEnd();

		// 리스트 불러오기
		List<CustomerMovieVO> list = customerService.movieList(memberVO.getId(), start, end, searchOption, keyword);

		/* ------------ 접근 처리 ------------ */
		try {
			if (memberVO.getUser_level().equals("customer")) {
				mav.setViewName(viewName);

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("list", list);
				map.put("movieList", movieList);
				map.put("count", count);
				map.put("searchOption", searchOption); // 검색 옵션
				map.put("keyword", keyword); // 검색 키워드
				map.put("paging", paging);
				mav.addObject("map", map); // 맵에 저장된 데이터 mav에 저장

			} else if (memberVO.getUser_level().equals("admin")) {
				mav = new ModelAndView("redirect:/admin.do");
			} else {
				mav = new ModelAndView("redirect:/main.do");
			}
		} catch (NullPointerException e) {
			mav = new ModelAndView("redirect:/main.do");
		}

		return mav;
	}

	@RequestMapping(value = "/customer/movieDelete.do", method = RequestMethod.POST)
	public String memberDelete(CustomerMovieVO vo, @RequestParam("del_movie") String movie,
			@RequestParam("theater_name") String theater_name, @RequestParam("theater_num") String theater_num)
			throws Exception {
		vo.setMovie_name(movie);
		vo.setTheater_name(theater_name);
		vo.setTheater_num(theater_num);
		customerService.movieDelete(vo);
		return "redirect:/customer/check_customerMovie.do";
	}

	@RequestMapping(value = "/customer/movieUpdate.do", method = RequestMethod.POST)
	public String memberLevel(CustomerMovieVO vo, @RequestParam("movie_name") String movie_name,
			@RequestParam("theater_name") String theater_name, @RequestParam("theater_num") String theater_num)
			throws Exception {
		vo.setMovie_name(movie_name);
		vo.setTheater_name(theater_name);
		vo.setTheater_num(theater_num);
		customerService.movieUpdate(vo);
		return "redirect:/customer/check_customerMovie.do";
	}

	@RequestMapping(value = "/customer/customerConfirmTime.do", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView customerConfirmTime(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String viewName = (String) request.getAttribute("viewName");
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		List<String> datatime = new ArrayList<String>();

		for (int i = 1; i < 8; i++) {
			Calendar cal2 = new GregorianCalendar();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			cal2.add(Calendar.DATE, i);
			datatime.add(sdf1.format(cal2.getTime()));
		}
		/* ------------ 접근 처리 ------------ */
		try {
			if (memberVO.getUser_level().equals("customer")) {
				String company = customerDAO.selectCompanyName_sub(memberVO.getId());

				List<String> theater_num = customerDAO.selectTheaterNum_sub(memberVO.getId());
				if (company == null || company == "") {
					mav.addObject("company", "no");
				} else {
					mav.addObject("company", company);

					if (count == 0) {
						List<String> theater = customerDAO.selectTheaterName_sub(memberVO.getId());
						List<CustomerTheaterVO> theaterList = customerDAO.selectTheaterList(theater.get(0));

						mav.addObject("theater_name", theater.get(0));
						mav.addObject("theaterList", theaterList);
						mav.addObject("theaterNameList", theater);
						count++;
					}

				}

				mav.addObject("datatime", datatime);
				mav.addObject("theater_num", theater_num);

				mav.setViewName(viewName);
			} else if (memberVO.getUser_level().equals("admin")) {
				mav = new ModelAndView("redirect:/admin.do");
			} else {
				mav = new ModelAndView("redirect:/main.do");
			}
		} catch (NullPointerException e) {
			mav = new ModelAndView("redirect:/main.do");
		}

		return mav;
	}

	@RequestMapping(value = "/customer/customerConfirmTimeMod.do", method = { RequestMethod.GET, RequestMethod.POST })
	private String customerConfirmTimeMod(@ModelAttribute("CustomerTheaterVO") CustomerTheaterVO customerTheaterVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		List<String> theater = customerDAO.selectTheaterName_sub(memberVO.getId());
		List<CustomerTheaterVO> theaterList = customerDAO.selectTheaterList(customerTheaterVO.getTheater_name());
		session.setAttribute("theater_name", customerTheaterVO.getTheater_name());
		session.setAttribute("theaterList", theaterList);
		session.setAttribute("theaterNameList", theater);

		return "redirect:/customer/customerConfirmTime.do";
	}

	@RequestMapping(value = "/customer/customerConfirmTimeDel.do", method = { RequestMethod.GET, RequestMethod.POST })
	private String customerConfirmTimeDel(@ModelAttribute("CustomerTheaterVO") CustomerTheaterVO customerTheaterVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("실행");
		HttpSession session = request.getSession();

		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		List<String> theater = customerDAO.selectTheaterName_sub(memberVO.getId());
		List<CustomerTheaterVO> theaterList = customerDAO.selectTheaterList(customerTheaterVO.getTheater_name());
		session.setAttribute("theater_name", customerTheaterVO.getTheater_name());
		session.setAttribute("theaterList", theaterList);
		session.setAttribute("theaterNameList", theater);

		return "redirect:/customer/customerConfirmTime.do";
	}

	@RequestMapping(value = "/customer/customerConfirmTimeChange.do", method = { RequestMethod.GET,
			RequestMethod.POST })
	private String customerConfirmTimeChange(@RequestParam("theater_name") String theaterName,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		List<String> theater = customerDAO.selectTheaterName_sub(memberVO.getId());
		List<CustomerTheaterVO> theaterList = customerDAO.selectTheaterList(theaterName);
		session.setAttribute("theater_name", theaterName);
		session.setAttribute("theaterList", theaterList);
		session.setAttribute("theaterNameList", theater);

		return "redirect:/customer/customerConfirmTime.do";
	}

	@RequestMapping(value = "/customer/check_customerSeat.do", method = RequestMethod.GET)
	private ModelAndView Check_customerSeat(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		/* ------------ 접근 처리 ------------ */
		try {
			if (memberVO.getUser_level().equals("customer")) {
				mav.addObject("member", memberVO);
				try {
					String company = customerDAO.selectCompanyName_sub(memberVO.getId());
					List<String> theater_name = customerDAO.selectTheaterName_sub(memberVO.getId());
					List<String> theater_num = customerDAO.selectTheaterNum_sub(memberVO.getId());
					/*--------------- 회사 등록을 안했다면 오류 처리 -----------------*/
					if (company != null) {
						mav.addObject("company", company);
						mav.addObject("theater_name", theater_name);
						mav.addObject("theater_num", theater_num);
					} else {
						mav.addObject("company", "no");
					}

				} catch (NullPointerException e) {
					mav.addObject("company", "no");
					mav.addObject("theater_name", "no");
					mav.addObject("theater_num", "no");
				}
				mav.setViewName(viewName);

			} else if (memberVO.getUser_level().equals("admin")) {
				mav = new ModelAndView("redirect:/admin.do");
			} else {
				mav = new ModelAndView("redirect:/main.do");
			}
		} catch (NullPointerException e) {
			mav = new ModelAndView("redirect:/main.do");
		}
		return mav;
	}

	@RequestMapping(value = "/customer/customerSeatInfo.do", method = RequestMethod.POST)
	private ModelAndView customerSeatInfo(@ModelAttribute("customerSeatInfo") CustomerSeatInfoVO customerSeatInfoVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/customer/check_customerSeat.do");
		HttpSession session = request.getSession();
		// seatrow 불러오기
		List<String> seatRow = customerDAO.selectSeatRow_sub(customerSeatInfoVO.getCompany(),
				customerSeatInfoVO.getTheater_name(), customerSeatInfoVO.getTheater_num());
		// seatcol 불러오기
		List<String> seatCol = customerDAO.selectSeatCol_sub(customerSeatInfoVO.getCompany(),
				customerSeatInfoVO.getTheater_name(), customerSeatInfoVO.getTheater_num());
		// seat_state 불러오기
		List<String> seat_state = customerDAO.selectSeat_State_sub(customerSeatInfoVO.getCompany(),
				customerSeatInfoVO.getTheater_name(), customerSeatInfoVO.getTheater_num());
		try {
			if (seatRow.get(0) != null) {
				session.setAttribute("seatRow_confirm", seatRow);
				session.setAttribute("seatRowSize", Integer.toString(seatRow.size()));
				session.setAttribute("seatCol_confirm", Integer.toString(seatCol.size()));
				session.setAttribute("seat_state_confirm", seat_state);
				session.setAttribute("theater_name_confirm", customerSeatInfoVO.getTheater_name());
				session.setAttribute("theater_num_confirm", customerSeatInfoVO.getTheater_num());
			}
		} catch (IndexOutOfBoundsException e) {
			session.setAttribute("seatRow_confirm", "no");
			session.setAttribute("seatCol_confirm", "no");
			session.setAttribute("seat_state_confirm", "no");
		}
		return mav;
	}

	@RequestMapping(value = "/customer/seatUpdate.do", method = RequestMethod.POST)
	public String seatUpdate(@ModelAttribute("customerSeatUpdateVO") CustomerSeatUpdateVO vo,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num = 0;
		HttpSession session = request.getSession();

		for (int i = 0; i < vo.getSeatrow().size(); i++) {
			for (int j = 0; j < vo.getSeatcol().size(); j++) {
				customerService.seatUpdate(vo.getSeat_state().get(num), vo.getCompany(), vo.getTheater_name(),
						vo.getTheater_num(), vo.getSeatrow().get(i), vo.getSeatcol().get(j));
				num += 1;
			}
		}

		session.setAttribute("seatRow_confirm", "no");
		session.setAttribute("seatCol_confirm", "no");
		session.setAttribute("seat_state_confirm", "no");

		return "redirect:/customer/customerConfirm.do";
	}
}
