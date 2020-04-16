package com.movie.damovie.customer.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.movie.damovie.customer.vo.CustomerMovieVO;
import com.movie.damovie.customer.vo.CustomerSeatVO;
import com.movie.damovie.customer.vo.CustomerTheaterVO;


@Repository("customerDAO")
public class CustomerDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;

	}
	
	public int addMovie(CustomerMovieVO customerMovieVO) {
		int movieResult = sqlSession.insert("mapper.customer.insertMovie", customerMovieVO);
		return movieResult;
	}
	
	public int addTheater(CustomerTheaterVO customerTheaterVO) {
		int theaterResult = sqlSession.insert("mapper.customer.insertTime", customerTheaterVO);
		System.out.println(theaterResult);
		return theaterResult;
	}
	
	public int addSeat(String company,String theater_name,String theater_num,String seatrow,String seatcol, String seat_state,String datasolt) {
		Map<String,String> seatData = new HashMap<String,String>();
		seatData.put("company", company);
		seatData.put("theater_name", theater_name);
		seatData.put("theater_num", theater_num);
		seatData.put("seatrow", seatrow);
		seatData.put("seatcol", seatcol);
		seatData.put("seat_state", seat_state);
		seatData.put("datasolt", datasolt);
		
		int seatResult = sqlSession.insert("mapper.customer.insertSeat", seatData);
		System.out.println(seatResult);
		return seatResult;
	}
	
	public String selectCompanyName_sub(String id) throws DataAccessException {
		String company = sqlSession.selectOne("mapper.customer.selectCompanyName_sub", id);

		return company;
	}
	
	public List<String> selectTheaterName_sub(String id) throws DataAccessException {
		List<String> TheaterName = sqlSession.selectList("mapper.customer.selectTheaterName_sub", id);

		return TheaterName;
	}
	
	public List<String> selectTheaterNum_sub(String id) throws DataAccessException {
		List<String> TheaterNum = sqlSession.selectList("mapper.customer.selectTheaterNum_sub", id);

		return TheaterNum;
	}
	public List<CustomerMovieVO> listALL(String id, int start, int end, String searchOption, String keyword) {
		//검색옵션, 키워드 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		//BETWEEN #{start}, #{end}에 입력될 값 앱에 넣기
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("mapper.customer.listAll",map);
	}

	public int countArticle(String id, String searchOption, String keyword) {
		// 검색옵션, 키워드 맵에 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne("mapper.customer.countArticle", map);
	}

	public void movieDelete(CustomerMovieVO vo) {
		sqlSession.delete("mapper.customer.movieDelete",vo);
	}

	public List<String> movieList(String id) {
		return sqlSession.selectList("mapper.customer.movieList",id);
	}

	public void movieUpdate(CustomerMovieVO vo) {
		sqlSession.update("mapper.customer.movieUpdate",vo);
	}
}
