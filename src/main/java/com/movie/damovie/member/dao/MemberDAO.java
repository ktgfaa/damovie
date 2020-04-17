package com.movie.damovie.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.RequestBody;

import com.movie.damovie.book.order.VO.OrderVO;
import com.movie.damovie.member.vo.MemberVO;



public interface MemberDAO {

	public int insertMember(MemberVO memberVO) throws DataAccessException;

	public MemberVO loginById(MemberVO member);
	
	public int idcheck(@RequestBody String userid);
	
	public String idsearch(@RequestBody String useremail);
	
	public String pwdsearch(@RequestBody String useremail , @RequestBody String userid);
	
	public void memberUpdate(MemberVO vo)throws Exception;

	public void memberDelete(MemberVO vo)throws Exception;

	public List<MemberVO> memberList();

	public List<MemberVO> listALL(int start, int end, String searchOption, String keyword);

	public int countArticle(String searchOption, String keyword) throws Exception;

	public void levelUpdate(MemberVO vo);

	public OrderVO order(OrderVO order);

	public String getRunTime(String movie_name);

	public void bookDelete(MemberVO vo);

}
