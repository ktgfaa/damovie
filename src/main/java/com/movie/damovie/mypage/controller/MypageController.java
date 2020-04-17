package com.movie.damovie.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.movie.damovie.book.order.VO.OrderVO;
import com.movie.damovie.member.service.MemberService;
import com.movie.damovie.member.vo.MemberVO;

@Controller("mypageController")
public class MypageController {
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="mypage.do" , method=RequestMethod.GET)
	private ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		OrderVO orderVO = (OrderVO)session.getAttribute("order");
		ModelAndView mav = new ModelAndView();
		
		/* ------------ 접근 처리 ------------ */
		try {
		if(memberVO.getUser_level().equals("user")) {
			mav.addObject("member",memberVO);
			mav.addObject("order",orderVO);
			mav.setViewName(viewName);
			} else if(memberVO.getUser_level().equals("admin")) {
				mav = new ModelAndView("redirect:/admin.do");
			}else if(memberVO.getUser_level().equals("customer")) {
				mav = new ModelAndView("redirect:/customer/customer.do");
			} else {
			mav = new ModelAndView("redirect:/main.do");
			} } catch(NullPointerException e) {
			mav = new ModelAndView("redirect:/main.do");
		}
		return mav;
	}	

	@RequestMapping( "info.do" )
	private ModelAndView servicecenter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
}

	
