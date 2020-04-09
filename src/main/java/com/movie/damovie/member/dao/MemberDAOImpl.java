package com.movie.damovie.member.dao;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.movie.damovie.member.vo.MemberVO;


@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}



	@Override
	public int insertMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.insertMember", memberVO);
		return result;
	}

	@Override
	public MemberVO loginById(MemberVO member) {
		MemberVO vo = sqlSession.selectOne("mapper.member.loginById", member);
		return vo;
	}



	@Override
	public int idcheck(String userid) {
		int count = 0;
		count = sqlSession.selectOne("mapper.member.idcheck", userid);
		return count;
	}



	@Override
	public String idsearch(String useremail) {
		String email = null;
		email = sqlSession.selectOne("mapper.member.idsearch", useremail);
		return email;
	}



	@Override
	public String pwdsearch(String useremail, String userid) {
		String pwd = "";

			Random rnd = new Random();
			
			for(int i =0 ; i<8;i++) {
			String randompwd = String.valueOf((char) ((int) (rnd.nextInt(26)) + 97));
			pwd += randompwd;
		}
			Map map = new HashMap();
			map.put("pwd", pwd);
			map.put("userid", userid);
			
		sqlSession.update("mapper.member.updatePwd", map);
		String Rpwd = sqlSession.selectOne("mapper.member.selectPwd", userid);
		return Rpwd;
	}



}
