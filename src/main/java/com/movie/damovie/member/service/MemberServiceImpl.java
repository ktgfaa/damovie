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

import com.movie.damovie.book.order.VO.OrderVO;
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
	
	//Controller에서 보내는 파라미터 memeberUpdate(MemberVO vo)로 받고
		@Override
		public void memberUpdate(MemberVO vo) throws Exception {
			//받은 vo를 DAO로 전송한다.
			memberDAO.memberUpdate(vo);
		}

		@Override
		public void memberDelete(MemberVO vo) throws Exception {
			memberDAO.memberDelete(vo);
		}

		@Override
		public List<MemberVO> memberList(){
			return memberDAO.memberList();
		}

		@Override
		public List<MemberVO> listAll(int start, int end, String searchOption, String keyword) {
			return memberDAO.listALL(start, end, searchOption, keyword);
		}

		@Override
		public int countArticle(String searchOption, String keyword) throws Exception {
			return memberDAO.countArticle(searchOption, keyword);
		}

		@Override
		public void levelUpdate(MemberVO vo) {
			memberDAO.levelUpdate(vo);
		}

		@Override
		public OrderVO order(OrderVO order) {
			return memberDAO.order(order);
		}

		@Override
		public String getRunTime(String movie_name) {
			return memberDAO.getRunTime(movie_name);
		}

		@Override
		public void bookDelete(MemberVO vo) {
			memberDAO.bookDelete(vo);
		}

}
