package com.movie.damovie.book.order.controller;

import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.movie.damovie.book.order.DAO.OrderDAO;
import com.movie.damovie.book.order.VO.OrderVO;
import com.movie.damovie.book.order.service.OrderService;

@Controller("orderController")
public class OrderController extends MultiActionController {
	
	@Autowired
	OrderVO orderVO = new OrderVO();
	
	@Autowired
	OrderDAO orderDAO = new OrderDAO();
	
	@Autowired
	OrderService orderService = new OrderService();
	
	@RequestMapping(value ="/order/order.do", method = RequestMethod.POST)
	private ModelAndView order(
			@ModelAttribute("order") OrderVO order,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		System.out.println("order 실행");
		
		int bookresult = orderService.addBook(order);
		
		System.out.println("bookresult : " + bookresult);
		
		session.setAttribute("order", order);
		session.setAttribute("bookresult", bookresult);
		
		ModelAndView mav = new ModelAndView("redirect:/order/ordercomplete.do");
		return mav;
	}
	
	@RequestMapping(value ="/book/addseat.do", method = RequestMethod.POST)
	private ModelAndView addseat(
			@ModelAttribute("order") OrderVO order,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		System.out.println("addorder 실행");
		
		HttpSession session = request.getSession();
		session.setAttribute("order", order);
		
		List<Map<String,String>> seat_info = orderDAO.selectSeat(order.getCompany(), order.getTheater_name(), order.getTheater_num());
		List<String> seatRow_distinct = orderDAO.selectSeatDistinct(order.getCompany(), order.getTheater_name(), order.getTheater_num());
		List<String> seatResRow = orderDAO.selectResSeatRow(order.getMovie_name(), order.getCompany(), order.getTheater_name(), order.getTheater_num(), order.getTime(), order.getMovie_date());
		List<String> seatResCol = orderDAO.selectResSeatCol(order.getMovie_name(), order.getCompany(), order.getTheater_name(), order.getTheater_num(), order.getTime(), order.getMovie_date());

		
		/*-------------- 예약된 SeatRow 가져와서 나누기 ----------------------*/
		List<Object> seatResRowList = new ArrayList<Object> ();
		for(int j = 0; j< seatResRow.size();j++) {
			for(int i =0;i<seatResRow.get(j).length();i++) {
			String b = "" + seatResRow.get(j).charAt(i);
			seatResRowList.add(b);
			}
		}
		
		/*-------------- 예약된 SeatCol 가져와서 나누기 ----------------------*/
		List<String> seatResColList = new ArrayList<String> ();
		String addCol = "";
		for(int j = 0; j<seatResCol.size();j++) {
			for(int i =0;i<seatResCol.get(j).length();i++) {
				if(seatResCol.get(j).charAt(i) != ',') {
					addCol += seatResCol.get(j).charAt(i);
				} else {
					seatResColList.add(addCol);
					addCol = "";
				}
			}
		}

		/*--------------- 영화관 좌석 최대 열수 구하기 ------------------------------*/
		String a = "";
		int b = 0;

		for(int i =0 ; i< seat_info.size();i++) {
			if(i > 0 && !a.equals(seat_info.get(i).get("seatRow"))) {
				b = i;
				break;
			}
			a = seat_info.get(i).get("seatRow");
		}
		
		List<String> seatBtnid = new ArrayList<String>();
		String q= "";
		for(int i =0 ; i< seat_info.size();i++) {
			q = seat_info.get(i).get("seatRow") + seat_info.get(i).get("seatCol");
			seatBtnid.add(i, q);			                                                                                                      
		}

		System.out.println("MaxSeatNum : " + b );
		System.out.println("seatRow_distinct : " + seatRow_distinct );
		
		session.setAttribute("seat_info", seat_info);
		session.setAttribute("seatRow_distinct", seatRow_distinct);
		session.setAttribute("MaxSeatNum", b);
		session.setAttribute("seatResRowList", seatResRowList);
		session.setAttribute("seatResColList", seatResColList);
		session.setAttribute("seatBtnid", seatBtnid);
		
		ModelAndView mav = new ModelAndView("redirect:/book/seat.do");
		return mav;
	}
	
	@RequestMapping(value ="/book/seat.do", method = {RequestMethod.POST , RequestMethod.GET})
	private ModelAndView seat(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		
		
		
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value ="/order/ordercomplete.do", method = {RequestMethod.POST , RequestMethod.GET})
	private ModelAndView orderComplete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		
		
		
		mav.setViewName(viewName);
		return mav;
	}

}
