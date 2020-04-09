package com.movie.damovie.main.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.movie.damovie.main.dao.MainDAO;

@Controller("mainController")
@EnableAspectJAutoProxy
public class MainController extends MultiActionController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

//	@Autowired
//	private MovieReviewVO movieReviewVO = new MovieReviewVO();

	@Autowired
	private MainDAO mainDAO = new MainDAO();
	
	// 영화 속성이름 저장
	private ArrayList <String> atName = new ArrayList <String>(Arrays.asList("name1","name2","name3","name4","name5","image1","image2","image3","image4","image5"));

	@RequestMapping(value = { "/", "main.do" }, method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 현재 시간 구하기
//		Calendar cal = Calendar.getInstance();
//		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy년 MM월 dd일 hh:mm 기준");
//		String datatime = sdf1.format(cal.getTime());
		
		ModelAndView mav = new ModelAndView();
		
//		List movieRanking = mainDAO.selectRanking();
//		for (int i = 0; i < movieRanking.size(); i++) {
//			System.out.println("속성값 넣기");
//			mav.addObject(atName.get(i) , movieRanking.get(i));
//		}

		String viewName = (String) request.getAttribute("viewName");
//		mav.addObject("datatime", datatime);
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping( "servicecenter.do" )
	private ModelAndView servicecenter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

}
