package com.movie.damovie.member.service;

import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.movie.damovie.member.dao.MemberDAO;
import com.movie.damovie.member.vo.MemberVO;



@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;


	@Override
	public int addMember(MemberVO memberVO) throws DataAccessException {
		return memberDAO.insertMember(memberVO);
	}

	@Override
	public MemberVO login(MemberVO member) {
		return memberDAO.loginById(member);
	}

	@Override
	public int idcheck(String userid) {
		return memberDAO.idcheck(userid);
	}

	@Override
	public String idsearch(String useremail) {
		return memberDAO.idsearch(useremail);
	}

	@Override
	public String pwdsearch(String useremail, String userid) {
		return memberDAO.pwdsearch(useremail, userid);
	}


	


}
