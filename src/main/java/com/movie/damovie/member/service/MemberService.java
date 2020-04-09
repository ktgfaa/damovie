package com.movie.damovie.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.RequestBody;

import com.movie.damovie.member.vo.MemberVO;



public interface MemberService {

	public int addMember(MemberVO memberVO) throws DataAccessException;

	public MemberVO login(MemberVO member);
	
	public int idcheck(@RequestBody String userid);
	
	public String idsearch(@RequestBody String useremail);
	
	public String pwdsearch(@RequestBody String useremail, @RequestBody String userid);
	
}
