package com.movie.damovie.member.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.movie.damovie.book.order.VO.OrderVO;
import com.movie.damovie.member.mailService.MailService;
import com.movie.damovie.member.service.MemberService;
import com.movie.damovie.member.vo.MemberVO;

@Controller("memberController")
@EnableAspectJAutoProxy
public class MemberController extends MultiActionController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private OrderVO	orderVO;

	@RequestMapping(value = "/member/addMember.do", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		int result = 0;
		result = memberService.addMember(member);
		ModelAndView mav = new ModelAndView("redirect:/member/loginForm.do");
		return mav;
	}

	@RequestMapping(value = "/member/idcheck.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView idcheck(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView();
		int count = 0;
		String action = "action";

		String userid = req.getParameter("id");

		count = memberService.idcheck(userid);

		if (count == 1) {
			mav.addObject("idcheckresult", false);
			mav.addObject("action", action);
		} else {
			mav.addObject("idcheckresult", true);
			mav.addObject("userid", userid);
			mav.addObject("action", action);
		}

		mav.setViewName("redirect:/member/memberForm.do");
		return mav;
	}

	@RequestMapping(value = "/member/loginForm.do", method =  { RequestMethod.GET , RequestMethod.POST})
	public ModelAndView loginform(@RequestParam(value = "result", required = false) String result,
			@RequestParam(value = "action", required = false) String action, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("result", result);
		mav.setViewName(viewName);
		return mav;
		
	}

	@RequestMapping(value = "/member/memberForm.do", method = RequestMethod.GET)
	public ModelAndView memberform(@RequestParam(value = "idcheckresult", required = false) boolean idcheckresult,
			@RequestParam(value = "userid", required = false) String userid,
			@RequestParam(value = "action", required = false) String action, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("action : " + action);

		if (action == null) {
			String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);

			mav.setViewName(viewName);
			return mav;
		} else {
			String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("userid", userid);
			mav.addObject("idcheckresult", idcheckresult);

			mav.setViewName(viewName);
			return mav;
		}
	}
	
	@RequestMapping(value = "/member/idsearchForm.do", method = RequestMethod.GET)
	public ModelAndView idsearchForm(HttpServletRequest request,HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = "/member/pwdsearchForm.do", method = RequestMethod.GET)
	public ModelAndView pwdsearchForm(HttpServletRequest request,HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)

	public ModelAndView login(@ModelAttribute("member") MemberVO member,@ModelAttribute("order") OrderVO order, RedirectAttributes rAttr,

			HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();

		memberVO = memberService.login(member);
		
		orderVO = memberService.order(order);
		

		if (memberVO != null) {

			HttpSession session = request.getSession();
			
			session.setAttribute("member", memberVO);

			session.setAttribute("order", orderVO);

			session.setAttribute("isLogon", true);

			String action = (String) session.getAttribute("action");

			session.removeAttribute("action");

			if (action != null) {

				mav.setViewName("redirect:" + action);

			} else {

				//접속자가 관리자라면 

				if(memberVO.getUser_level().equals("admin")) {

					mav.setViewName("redirect:/admin.do");

				}else if(memberVO.getUser_level().equals("customer")){

					mav.setViewName("redirect:/customer/customer.do");

				}else {

					mav.setViewName("redirect:/main.do");

				}

			}

		} else {

			rAttr.addAttribute("result", "loginFailed");

			mav.setViewName("redirect:/member/loginForm.do");

		}

		return mav;

	}

	@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogon");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}

	@Autowired
	private MailService mailService;

	@RequestMapping(value = "/member/sendMail.do", method = {RequestMethod.POST , RequestMethod.GET})
	public ModelAndView sendSimpleMail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		ModelAndView mav = new ModelAndView();
		String useremail = request.getParameter("email");
		String userid = memberService.idsearch(useremail);
		
		String emailmessage = null;
		
		if(userid != null) {
		StringBuffer sb = new StringBuffer();
		sb.append("<html><head>");
		sb.append("<meta http-equiv='content-Type' content='text/html;charset=euc-kr'>");
		sb.append("</head><body>");
		sb.append("<img src='http://192.168.0.2:8080/damovie/resources/images/damovilogo2.png'/><br>");
		sb.append("<h1>안녕하세요!! DAMOVIE 입니다</h1><br>");
		sb.append("<h2>귀하의 id는</h2>" + "<h1 style='color:red;'>" + userid + "</h1>" + " <h2>입니다.</h2><br>");
		sb.append("<strong>보안상 받으신 메일은 삭제를 권장드립니다!!!</strong><br>");
		sb.append("<a href='http://192.168.0.2:8080/damovie/member/loginForm.do'>로그인 하러가기</h1>");
		sb.append("</body></html>");
		String str = sb.toString();
	mailService.sendMail(useremail, "아이디 찾기", str);
	emailmessage = "true";
	mav.addObject("emailMessage", emailmessage);
	
		} else {
			emailmessage = "false";
			mav.addObject("emailMessage", emailmessage);
		}
		
		mav.setViewName("redirect:/member/loginForm.do");
		return mav;
	}
	
	@RequestMapping(value = "/member/pwdsendMail.do", method = {RequestMethod.POST , RequestMethod.GET})
	public ModelAndView pwdsendMail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		ModelAndView mav = new ModelAndView();
		
		System.out.println("useremail : " + request.getParameter("useremail"));
		System.out.println("userid : " + request.getParameter("userid"));

		String useremail = request.getParameter("useremail");
		String userid = request.getParameter("userid");
		String userid2 = memberService.idsearch(useremail);
		
		String emailmessage = null;


		if(userid.equals(userid2)){
		String userpwd = memberService.pwdsearch(useremail, userid);
		
		StringBuffer sb = new StringBuffer();
		sb.append("<html><head>");
		sb.append("<meta http-equiv='content-Type' content='text/html;charset=euc-kr'>");
		sb.append("</head><body>");
		sb.append("<img src='http://192.168.0.2:8080/damovie/resources/images/damovilogo2.png'/><br>");
		sb.append("<h1>안녕하세요!! DAMOVIE 입니다</h1><br>");
		sb.append("<h2>귀하의 임의 비밀번호는</h2>" + "<h1 style='color:red;'>" + userpwd + "</h1>" + " <h2>입니다.</h2><br>");
		sb.append("<strong>보안상 받으신 메일은 삭제를 해주세요!!!</strong><br>");
		sb.append("<a href='http://192.168.0.2:8080/damovie/member/loginForm.do'>로그인 하러가기</h1>");
		sb.append("</body></html>");
		String str = sb.toString();
		mailService.pwdsendMail(useremail, "비밀번호 찾기", str);
		
		emailmessage = "true";
		mav.addObject("emailMessage", emailmessage);
		
		} else {
			emailmessage = "false";
			mav.addObject("emailMessage", emailmessage);
		}
		mav.setViewName("redirect:/member/loginForm.do");
		return mav;
	}
	
	@RequestMapping(value="/member/memberUpdateView.do", method=RequestMethod.GET)
	public String memberUpdateView(HttpSession session) throws Exception{
		String id = (String)session.getAttribute("id");
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		/* ------------ 접근 처리 ------------ */
		try {
			if(memberVO == null) {
				return "redirect:/main.do";
			} 
		} catch(NullPointerException e) {
			return "redirect:/main.do";

		}
		return "memberUpdateView";
	}
	
	@RequestMapping(value="/member/memberUpdate.do",method= RequestMethod.POST)
	public String memberUpdate(MemberVO vo, HttpSession session,RedirectAttributes rAttr)throws Exception{
		
		memberService.memberUpdate(vo);
		session.removeAttribute("member");
		session.setAttribute("member", memberVO);
		
		//마이페이지로 돌아가기
		return "redirect:/mypage.do";
	}
	
	@RequestMapping(value= "/member/checkMyBook.do", method=RequestMethod.GET )
	private String checkMyBook(HttpSession session) throws Exception {
		String id = (String)session.getAttribute("id");
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		/* ------------ 접근 처리 ------------ */
		try {
			if(memberVO == null) {
				return "redirect:/main.do";
			} 
		} catch(NullPointerException e) {
			return "redirect:/main.do";

		}
		return "checkMyBook";
	}
	
	
	@RequestMapping(value="/member/memberDeleteForm.do", method=RequestMethod.GET)
	public String memberDeleteForm(HttpSession session)throws Exception{
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		/* ------------ 접근 처리 ------------ */
		try {
			if(memberVO == null) {
				return "redirect:/main.do";
			} 
		} catch(NullPointerException e) {
			return "redirect:/main.do";

		}
		return "memberDeleteForm";
	}
	
	@RequestMapping(value="/member/memberDelete.do", method=RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rAttr)throws Exception{
		
		//세션의 member가져와 member변수에 넣기
		MemberVO member = (MemberVO) session.getAttribute("member");

		String sessionPwd = member.getPwd();
		String voPwd = vo.getPwd();
		
		if(!(sessionPwd.equals(voPwd))) {
			rAttr.addFlashAttribute("msg",false);
			return "redirect:/member/memberDeleteForm.do";
		}else {
		vo.setId(member.getId());
		memberService.memberDelete(vo);
		
		//세션 무효화
		session.invalidate();

		return "redirect:/main.do";
		}
	}
}
