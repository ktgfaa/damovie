package com.movie.damovie.member.dao;

import java.util.HashMap;
import java.util.List;
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
	
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		//vo에 담긴 파라미터들은 member.xml에 member라는 namespace에
		//아이디가 memberUpdate인 쿼리에 파라미터 넣기
		sqlSession.update("mapper.member.memberUpdate",vo);
	}

	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		sqlSession.delete("mapper.member.memberDelete",vo);
	}

	@Override
	public List<MemberVO> memberList() {
		return sqlSession.selectList("mapper.member.memberList");
	}

	@Override
	public List<MemberVO> listALL(int start, int end, String searchOption, String keyword) {
		//검색옵션, 키워드 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		//BETWEEN #{start}, #{end}에 입력될 값 앱에 넣기
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("mapper.member.listAll",map);
	}
	
	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		// 검색옵션, 키워드 맵에 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne("mapper.member.countArticle", map);
	}

	@Override
	public void levelUpdate(MemberVO vo) {
		sqlSession.update("mapper.member.levelUpdate",vo);
	}



}
