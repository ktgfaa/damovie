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
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
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

	
