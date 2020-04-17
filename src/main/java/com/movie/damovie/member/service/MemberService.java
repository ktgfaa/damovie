package com.movie.damovie.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.RequestBody;

import com.movie.damovie.book.order.VO.OrderVO;
import com.movie.damovie.member.vo.MemberVO;



public interface MemberService {

	public int addMember(MemberVO memberVO) throws DataAccessException;

	public MemberVO login(MemberVO member);
	
	public int idcheck(@RequestBody String userid);
	
	public String idsearch(@RequestBody String useremail);
	
	public String pwdsearch(@RequestBody String useremail, @RequestBody String userid);
	
	public void memberUpdate(MemberVO vo)throws Exception;

	public void memberDelete(MemberVO vo)throws Exception;
	
	public List<MemberVO> memberList();

	public List<MemberVO> listAll(int start, int end, String searchOption, String keyword);
	
	//회원 레코드 개수
	public int countArticle(String searchOption, String keyword) throws Exception;

	public void levelUpdate(MemberVO vo);

	public OrderVO order(OrderVO order);

	public String getRunTime(String movie_name);

	public void bookDelete(MemberVO vo);
	
}
