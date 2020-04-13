package com.movie.damovie.admin.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.movie.damovie.admin.service.MemberPage;
import com.movie.damovie.member.service.MemberService;
import com.movie.damovie.member.vo.MemberVO;

@Controller("adminController")
public class AdminController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/admin.do")
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(defaultValue="all") String searchOption,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="1") int curPage) throws Exception {
		
		//회원 레코드 개수 계산
				int count = memberService.countArticle(searchOption, keyword);
				
				//페이지 나누기
				MemberPage memberPage = new MemberPage(count, curPage);
				int start = memberPage.getPageBegin();
				int end = memberPage.getPageEnd();
				
				List<MemberVO> list = memberService.listAll(start, end, searchOption,keyword);
				
				//데이터를 맵에 저장하기
				Map<String, Object> map = new HashMap<String,Object>();
				map.put("list", list);		//회원 리스트
				map.put("count", count);	//회원 수
				map.put("searchOption", searchOption);	//검색 옵션
				map.put("keyword", keyword);	//검색 키워드
				map.put("memberPage", memberPage);
				
				String viewName = (String) request.getAttribute("viewName");
				ModelAndView mav = new ModelAndView();
				mav.addObject("map",map); //맵에 저장된 데이터 mav에 저장
				mav.setViewName(viewName);	//뷰를 memberManagement.jsp로 설정
		return mav;
	}

	@RequestMapping(value="/admin/memberDelete.do", method=RequestMethod.POST)
	public String memberDelete(MemberVO vo,
							@RequestParam("del_id") String id)throws Exception{
		if(!id.equals("admin")) {//혹시 관리자가 자기꺼 삭제 못하게 설정해놓기
			vo.setId(id);
			memberService.memberDelete(vo);
			return "redirect:/admin/memberManagement.do";
		}else {
			return "redirect:/admin/memberManagement.do";
		}
	}
	@RequestMapping(value="/admin/memberLevel.do", method=RequestMethod.POST)
	public String memberLevel(MemberVO vo,
							@RequestParam("user_level") String user_level,
							@RequestParam("mod_level_id") String id)throws Exception{
		vo.setId(id);
		vo.setUser_level(user_level);
		memberService.levelUpdate(vo);
		return "redirect:/admin/memberManagement.do";
	}
	
}