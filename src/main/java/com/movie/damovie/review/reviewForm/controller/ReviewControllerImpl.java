package com.movie.damovie.review.reviewForm.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.movie.damovie.main.controller.MainController;
import com.movie.damovie.review.reviewForm.service.BoardPager;
import com.movie.damovie.review.reviewForm.service.ReviewService;
import com.movie.damovie.review.reviewForm.vo.ReviewVO;
import com.movie.damovie.review.reviewForm.vo.WriteVO;


@Controller("reviewController")
@EnableAspectJAutoProxy
public class ReviewControllerImpl extends MultiActionController implements ReviewController  {
	private static final Logger logger = LoggerFactory.getLogger(ReviewControllerImpl.class);
	
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private ReviewVO reviewVO;
	@Autowired
	private WriteVO writeVO;
	
	
	@RequestMapping(value="review.do" , method={RequestMethod.POST , RequestMethod.GET})
	public ModelAndView review(@RequestParam(defaultValue="1") int curPage, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		String movieName = request.getParameter("movieName");
		String summary = request.getParameter("summary");
		String actor= request.getParameter("actor");
		String director= request.getParameter("director");
		String imageName= request.getParameter("imageName");
		String runtime= request.getParameter("runtime");
		String jenre= request.getParameter("jenre");
		String openingDate= request.getParameter("openingDate");
		String userId = request.getParameter("userId");
		String des = request.getParameter("des");
		String score = request.getParameter("score");
		String reviewDate= request.getParameter("reviewDate");
		float total = 0;
		
		List movieList = reviewService.movieList();
		
		
		if(imageName != null && imageName != "") {
			ReviewVO movieInfo = (ReviewVO)reviewService.movieInfo(imageName);
			mav.addObject("movieInfo", movieInfo);
			
		}
		if(movieName != null && movieName != "") {
			List reviewList = reviewService.reviewList(movieName);
			
			
			if(reviewList != null) {
				int totalList = reviewService.totalList(movieName);
				System.out.println(totalList);
				if(totalList == 0) {
					total = totalList;
					mav.addObject("total", total);
				} else {
					total = (float)totalList / reviewList.size();
					String str = String.format("%.1f", total);
					mav.addObject("total", str);
				}
				mav.addObject("reviewList", reviewList);
				mav.addObject("userId",userId);
				mav.addObject("des",des);
				mav.addObject("score",score);
				mav.addObject("reviewDate",reviewDate);
			}
			
			
			String searchOption="";
			String keyword="";
			
			int count = reviewService.countArticle(searchOption, keyword);
			
			BoardPager boardPager = new BoardPager(count, curPage);
			int start = boardPager.getPageBegin();
			int end = boardPager.getPageEnd();
			
			List<WriteVO> list = reviewService.listAll(start, end, searchOption, keyword);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list",list);
			map.put("count",count);
			map.put("searchOption",searchOption);
			map.put("keyword",keyword);
			map.put("BoardPager",boardPager);
			
			
			mav.addObject("map",map);
			mav.setViewName("review");
			
//			mav.addObject("totalList", totalList);
//			WriteVO reviewInfo = (WriteVO)reviewService.reviewInfo(movieName);
//			mav.addObject("reviewInfo", reviewInfo);

			
			
		}
		
		/* mav.clear(); */
		mav.addObject("movieList", movieList);
		mav.addObject("movieName",movieName);
		mav.addObject("summary",summary);
		mav.addObject("actor",actor);
		mav.addObject("director",director);
		mav.addObject("imageName",imageName);
		mav.addObject("runtime",runtime);
		mav.addObject("jenre",jenre);
		mav.addObject("openingDate",openingDate);
		
		mav.setViewName(viewName);
		return mav;
		
	}


	@RequestMapping(value="reviewWrite.do" , method=RequestMethod.POST)
	public ModelAndView reviewWrite(@ModelAttribute("write") WriteVO writeVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		int result=0;
		result = reviewService.reviewWrite(writeVO);
		String imageName= request.getParameter("imageName");
		String movieName = URLEncoder.encode(writeVO.getMovie_name(), "UTF-8");
		ModelAndView mav = new ModelAndView("redirect:/review.do?imageName="+imageName+"&movieName="+movieName);
		
		
		return mav;
	}	
	@RequestMapping(value="modReview.do" , method=RequestMethod.POST)
	public ModelAndView modReview(@ModelAttribute("write") WriteVO writeVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		
		int result=0;
		result=reviewService.modReview(writeVO);
		String imageName=request.getParameter("imageName");
		String movieName = writeVO.getMovie_name();
		movieName=URLEncoder.encode(movieName,"UTF-8");
		ModelAndView mav = new ModelAndView("redirect:/review.do?imageName="+imageName+"&movieName="+movieName);
		return mav;
	}


	@RequestMapping(value="delReview.do" , method=RequestMethod.POST)
	public ModelAndView delReview(@ModelAttribute("write") WriteVO writeVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		reviewService.delReview(writeVO);
		String movieName = writeVO.getMovie_name();
		String imageName= request.getParameter("image_name");
		movieName = URLEncoder.encode(movieName,"UTF-8");
		ModelAndView mav = new ModelAndView("redirect:/review.do?imageName="+imageName+"&movieName="+movieName);
		return mav;
	}


	@RequestMapping(value="list.do" , method=RequestMethod.POST)
	public ModelAndView list(@RequestParam(defaultValue="title") String searchOption, @RequestParam(defaultValue="") String keyword, @RequestParam(defaultValue="1") int curPage) throws Exception {
		
		
		return null;
	}
	
	
	
}
